static char sccsid[] = "@(#)12  1.9  src/bos/usr/ccs/lib/libc/svc_tcp.c, libcrpc, bos411, 9428A410j 10/25/93 20:42:56";
/*
 *   COMPONENT_NAME: LIBCRPC
 *
 *   FUNCTIONS: makefd_xprt
 *		readtcp
 *		rendezvous_request
 *		rendezvous_stat
 *		svcfd_create
 *		svctcp_create
 *		svctcp_destroy
 *		svctcp_freeargs
 *		svctcp_getargs
 *		svctcp_recv
 *		svctcp_reply
 *		svctcp_stat
 *		writetcp
 *		
 *
 *   ORIGINS: 24,27
 *
 *   This module contains IBM CONFIDENTIAL code. -- (IBM
 *   Confidential Restricted when combined with the aggregated
 *   modules for this product)
 *                    SOURCE MATERIALS
 *
 *   (C) COPYRIGHT International Business Machines Corp. 1989,1993
 *   All Rights Reserved
 *   US Government Users Restricted Rights - Use, duplication or
 *   disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 */


/* 
#if defined(LIBC_SCCS) && !defined(lint)
static char sccsid[] = 	"@(#)svc_tcp.c	1.5 90/07/19 4.1NFSSRC Copyr 1990 Sun Micro";
#endif
 *
 * Copyright (c) 1988 by Sun Microsystems, Inc.
 *  1.22 88/02/08
 */


/*
 * svc_tcp.c, Server side for TCP/IP based RPC. 
 *
 * Actually implements two flavors of transporter -
 * a tcp rendezvouser (a listner and connection establisher)
 * and a record/tcp stream.
 */

#include <stdio.h>
#include <rpc/rpc.h>
#include <sys/socket.h>
#include <errno.h>
#include <sys/syslog.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <libc_msg.h>

extern bool_t abort();
extern errno;

/*
 * Ops vector for TCP/IP based rpc service handle
 */
static bool_t		svctcp_recv();
static enum xprt_stat	svctcp_stat();
static bool_t		svctcp_getargs();
static bool_t		svctcp_reply();
static bool_t		svctcp_freeargs();
static void		svctcp_destroy();

static struct xp_ops svctcp_op = {
	svctcp_recv,
	svctcp_stat,
	svctcp_getargs,
	svctcp_reply,
	svctcp_freeargs,
	svctcp_destroy
};

/*
 * Ops vector for TCP/IP rendezvous handler
 */
static bool_t		rendezvous_request();
static enum xprt_stat	rendezvous_stat();

static struct xp_ops svctcp_rendezvous_op = {
	rendezvous_request,
	rendezvous_stat,
	abort,
	abort,
	abort,
	svctcp_destroy
};

static int readtcp(), writetcp();
static SVCXPRT *makefd_xprt();

struct tcp_rendezvous { /* kept in xprt->xp_p1 */
	u_int sendsize;
	u_int recvsize;
};

struct tcp_conn {  /* kept in xprt->xp_p1 */
	enum xprt_stat strm_stat;
	u_long x_id;
	XDR xdrs;
	char verf_body[MAX_AUTH_BYTES];
};

/*
 * Usage:
 *	xprt = svctcp_create(sock, send_buf_size, recv_buf_size);
 *
 * Creates, registers, and returns a (rpc) tcp based transporter.
 * Once *xprt is initialized, it is registered as a transporter
 * see (svc.h, xprt_register).  This routine returns
 * a NULL if a problem occurred.
 *
 * If sock<0 then a socket is created, else sock is used.
 * If the socket, sock is not bound to a port then svctcp_create
 * binds it to an arbitrary port.  The routine then starts a tcp
 * listener on the socket's associated port.  In any (successful) case,
 * xprt->xp_sock is the registered socket number and xprt->xp_port is the
 * associated port number.
 *
 * Since tcp streams do buffered io similar to stdio, the caller can specify
 * how big the send and receive buffers are via the second and third parms;
 * 0 => use the system default.
 */
SVCXPRT *
svctcp_create(sock, sendsize, recvsize)
	register int sock;
	u_int sendsize;
	u_int recvsize;
{
	bool_t madesock = FALSE;
	register SVCXPRT *xprt;
	register struct tcp_rendezvous *r;
	struct sockaddr_in addr;
	int len = sizeof(struct sockaddr_in);

	if (sock == RPC_ANYSOCK) {
		/* if (fd < 20) ==> interference with shells */
		if ( (sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) >= 0 &&
		     sock < 20 )
		{
			int sock_fd = sock;

			sock = fcntl(sock_fd, F_DUPFD, 20);
			(void)close(sock_fd);
		}
		if (sock < 0) {
			(void) syslog(LOG_ERR, (char *)oncmsg(LIBCRPC,RPC89,
		           "svctcp_create - tcp socket creation problem: %m"));
			return ((SVCXPRT *)NULL);
		}
		madesock = TRUE;
	}
	bzero((char *)&addr, sizeof (addr));
	addr.sin_family = AF_INET;
	if (bindresvport(sock, &addr)) {
		addr.sin_port = 0;
		(void)bind(sock, (struct sockaddr *)&addr, len);
	}
	if ((getsockname(sock, (struct sockaddr *)&addr, &len) != 0)  ||
	    (listen(sock, 2) != 0)) {
		(void) syslog(LOG_ERR, (char *)oncmsg(LIBCRPC,RPC90,
                         "svctcp_create - cannot getsockname or listen: %m"));
		if (madesock)
		       (void)close(sock);
		return ((SVCXPRT *)NULL);
	}
	r = (struct tcp_rendezvous *)mem_alloc(sizeof(*r));
	if (r == NULL) {
		(void) syslog(LOG_ERR, (char *)oncmsg(LIBCRPC,RPC91,
			     "svctcp_create: out of memory"));
		if (madesock)
			(void)close(sock);
		return (NULL);
	}
	r->sendsize = sendsize;
	r->recvsize = recvsize;
	xprt = (SVCXPRT *)mem_alloc(sizeof(SVCXPRT));
	if (xprt == NULL) {
		(void) syslog(LOG_ERR, (char *)oncmsg(LIBCRPC,RPC91,
			     "svctcp_create: out of memory"));
		mem_free((char *) r, sizeof(*r));
		if (madesock)
			(void)close(sock);
		return (NULL);
	}
	xprt->xp_p2 = NULL;
	xprt->xp_p3 = NULL;
	xprt->xp_p1 = (caddr_t)r;
	xprt->xp_verf = _null_auth;
	xprt->xp_ops = &svctcp_rendezvous_op;
	xprt->xp_port = ntohs(addr.sin_port);
	xprt->xp_sock = sock;
	xprt_register(xprt);
	return (xprt);
}

/*
 * Like svtcp_create(), except the routine takes any *open* UNIX file
 * descriptor as its first input.
 */
SVCXPRT *
svcfd_create(fd, sendsize, recvsize)
	int fd;
	u_int sendsize;
	u_int recvsize;
{

	return (makefd_xprt(fd, sendsize, recvsize));
}

static SVCXPRT *
makefd_xprt(fd, sendsize, recvsize)
	int fd;
	u_int sendsize;
	u_int recvsize;
{
	register SVCXPRT *xprt;
	register struct tcp_conn *cd;
 
	xprt = (SVCXPRT *)mem_alloc(sizeof(SVCXPRT));
	if (xprt == (SVCXPRT *)NULL) {
		(void) syslog(LOG_ERR, (char *)oncmsg(LIBCRPC,RPC41,
			   "svc_tcp: makefd_xprt: out of memory"));
		goto done;
	}
	cd = (struct tcp_conn *)mem_alloc(sizeof(struct tcp_conn));
	if (cd == (struct tcp_conn *)NULL) {
		(void) syslog(LOG_ERR, (char *)oncmsg(LIBCRPC,RPC41,
			   "svc_tcp: makefd_xprt: out of memory"));
		mem_free((char *) xprt, sizeof(SVCXPRT));
		xprt = (SVCXPRT *)NULL;
		goto done;
	}
	cd->strm_stat = XPRT_IDLE;
	xdrrec_create(&(cd->xdrs), sendsize, recvsize,
	    (caddr_t)xprt, readtcp, writetcp);
	xprt->xp_p2 = NULL;
	xprt->xp_p1 = (caddr_t)cd;
	xprt->xp_verf.oa_base = cd->verf_body;
	xprt->xp_addrlen = 0;
	xprt->xp_ops = &svctcp_op;  /* truely deals with calls */
	xprt->xp_port = 0;  /* this is a connection, not a rendezvouser */
	xprt->xp_sock = fd;
	xprt_register(xprt);
    done:
	return (xprt);
}

static bool_t
rendezvous_request(xprt)
	register SVCXPRT *xprt;
{
	int sock;
	struct tcp_rendezvous *r;
	struct sockaddr_in addr;
	int len;
	int off = 0;

	r = (struct tcp_rendezvous *)xprt->xp_p1;
    again:
	len = sizeof(struct sockaddr_in);
	if ((sock = accept(xprt->xp_sock, (struct sockaddr *)&addr,
	    &len)) < 0) {
		if (errno == EINTR)
			goto again;
	       return (FALSE);
	}

	/*
	 * we set the new socket to blocking in case the listen socket
	 * was non-blocking (which it generally should be, since the
	 * application can get a connection and call us, but in the
	 * meantime the connection can be reset by the peer; this will
	 * cause us to block in the accept() call above, which is
	 * often undesirable).
	 *
	 * if someone is counting on the new socket being non-blocking
	 * because they set the listen socket to non-blocking, then this
	 * may cause problems; but since the writetcp() code assumes a
	 * blocking socket, this is unlikely.
	 */
	(void) ioctl(sock, FIONBIO, &off);

	/*
	 * make a new transporter (re-uses xprt)
	 */
	xprt = makefd_xprt(sock, r->sendsize, r->recvsize);
	xprt->xp_raddr = addr;
	xprt->xp_addrlen = len;
	return (FALSE); /* there is never an rpc msg to be processed */
}

static enum xprt_stat
rendezvous_stat()
{

	return (XPRT_IDLE);
}

static void
svctcp_destroy(xprt)
	register SVCXPRT *xprt;
{
	register struct tcp_conn *cd = (struct tcp_conn *)xprt->xp_p1;

	xprt_unregister(xprt);
	(void)close(xprt->xp_sock);
	if (xprt->xp_port != 0) {
		/* a rendezvouser socket */
		xprt->xp_port = 0;
	} else {
		/* an actual connection socket */
		XDR_DESTROY(&(cd->xdrs));
	}
	mem_free((caddr_t)cd, sizeof(struct tcp_conn));
	mem_free((caddr_t)xprt, sizeof(SVCXPRT));
}

/*
 * All read operations timeout after 35 seconds.
 * A timeout is fatal for the connection.
 */
static struct timeval wait_per_try = { 35, 0 };

/*
 * reads data from the tcp conection.
 * any error is fatal and the connection is closed.
 * (And a read of zero bytes is a half closed stream => error.)
 */
static int
readtcp(xprt, buf, len)
	register SVCXPRT *xprt;
	caddr_t buf;
	register int len;
{
	register int sock = xprt->xp_sock;
	fd_set mask;
	fd_set readfds;

	FD_ZERO(&mask);
	FD_SET(sock, &mask);
	do {
		readfds = mask;
		if (select(_rpc_dtablesize(), &readfds, (int*)NULL, (int*)NULL, 
			   &wait_per_try) <= 0) {
			if (errno == EINTR) {
				continue;
			}
			goto fatal_err;
		}
	} while (!FD_ISSET(sock, &readfds));
	if ((len = read(sock, buf, len)) > 0) {
		return (len);
	}
fatal_err:
	((struct tcp_conn *)(xprt->xp_p1))->strm_stat = XPRT_DIED;
	return (-1);
}

/*
 * writes data to the tcp connection.
 * Any error is fatal and the connection is closed.
 */
static int
writetcp(xprt, buf, len)
	register SVCXPRT *xprt;
	caddr_t buf;
	int len;
{
	register int i, cnt;

	for (cnt = len; cnt > 0; cnt -= i, buf += i) {
		if ((i = write(xprt->xp_sock, buf, cnt)) < 0) {
			((struct tcp_conn *)(xprt->xp_p1))->strm_stat =
			    XPRT_DIED;
			return (-1);
		}
	}
	return (len);
}

static enum xprt_stat
svctcp_stat(xprt)
	SVCXPRT *xprt;
{
	register struct tcp_conn *cd =
	    (struct tcp_conn *)(xprt->xp_p1);

	if (cd->strm_stat == XPRT_DIED)
		return (XPRT_DIED);
	if (! xdrrec_eof(&(cd->xdrs)))
		return (XPRT_MOREREQS);
	return (XPRT_IDLE);
}

static bool_t
svctcp_recv(xprt, msg)
	SVCXPRT *xprt;
	register struct rpc_msg *msg;
{
	register struct tcp_conn *cd =
	    (struct tcp_conn *)(xprt->xp_p1);
	register XDR *xdrs = &(cd->xdrs);

	xdrs->x_op = XDR_DECODE;
	(void)xdrrec_skiprecord(xdrs);
	if (xdr_callmsg(xdrs, msg)) {
		cd->x_id = msg->rm_xid;
		return (TRUE);
	}
	return (FALSE);
}

static bool_t
svctcp_getargs(xprt, xdr_args, args_ptr)
	SVCXPRT *xprt;
	xdrproc_t xdr_args;
	caddr_t args_ptr;
{

	return ((*xdr_args)(&(((struct tcp_conn *)(xprt->xp_p1))->xdrs), args_ptr));
}

static bool_t
svctcp_freeargs(xprt, xdr_args, args_ptr)
	SVCXPRT *xprt;
	xdrproc_t xdr_args;
	caddr_t args_ptr;
{
	register XDR *xdrs =
	    &(((struct tcp_conn *)(xprt->xp_p1))->xdrs);

	xdrs->x_op = XDR_FREE;
	return ((*xdr_args)(xdrs, args_ptr));
}

static bool_t
svctcp_reply(xprt, msg)
	SVCXPRT *xprt;
	register struct rpc_msg *msg;
{
	register struct tcp_conn *cd =
	    (struct tcp_conn *)(xprt->xp_p1);
	register XDR *xdrs = &(cd->xdrs);
	register bool_t stat;

	xdrs->x_op = XDR_ENCODE;
	msg->rm_xid = cd->x_id;
	stat = xdr_replymsg(xdrs, msg);
	(void)xdrrec_endofrecord(xdrs, TRUE);
	return (stat);
}
