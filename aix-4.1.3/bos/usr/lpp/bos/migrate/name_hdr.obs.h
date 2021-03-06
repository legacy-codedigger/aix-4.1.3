/* @(#)08  1.4  src/bos/usr/lpp/bos/migrate/name_hdr.obs.h, cmdsmit, bos411, 9428A410j 6/30/94 15:10:58 */
/*
 *   COMPONENT_NAME: CMDSMIT
 *
 *   FUNCTIONS: none
 *
 *   PURPOSE: obsolete sm_name_hdr entries from 3.2
 *
 *   ORIGINS: 27
 *
 *   IBM CONFIDENTIAL -- (IBM Confidential Restricted when
 *   combined with the aggregated modules for this product)
 *                    SOURCE MATERIALS
 *
 *   (C) COPYRIGHT International Business Machines Corp. 1994
 *   All Rights Reserved
 *   US Government Users Restricted Rights - Use, duplication or
 *   disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 */

struct name_hdr_list {
        char *id;
        char *next_id;
        char *option_id;
} obs_name_hdrs [] =
        {
	"Ace_sel", "run_Ace", "ls_dacs",
	"Dac_sel", "lsarrays", "ls_dacs",
	"RCS_ch_what_serv", "RCS_chusrprof_tmp", "RCS_rcs_serv_sel",
	"RCS_chgslip", "RCS_chgslipc", "RCS__chgslip",
	"RCS_chusrprof_IBMLink", "RCS_link_prof_", "RCS_conn_sel_lnk",
	"RCS_chusrprof_Support/6000", "RCS_cs_usr_prof_", "RCS_ch_conn_sel",
	"RCS_chusrprof_sel", "RCS_ch_what_serv", "RCS_chusr_name_sel",
	"RCS_chusrprof_tmp", "RCS_chusrprof_", "RCS_ghost_cmd_opt",
	"RCS_connectslip", "RCS_showslips", "RCS_ghost_cmd_opt",
	"RCS_echo_active_before", "RCS_ok_to_stopslip_ask_", "RCS_echo_active_slips",
	"RCS_get_slip", "RCS_reconfig_slip", "RCS__get_slip",
	"RCS_ibmlogon", "RCS_ibmprof_sel", "RCS_ghost_cmd_opt",
	"RCS_ibmprof_logonSLIP", "RCS_ibmprof_logon_slip_", "RCS_ghost_cmd_opt",
	"RCS_ibmprof_logonSNA", "RCS_ibmprof_logon_sna", "RCS_ghost_cmd_opt",
	"RCS_ibmprof_logonTCP/IP", "RCS_ibmprof_logon_tcp_", "RCS_ghost_cmd_opt",
	"RCS_ibmprof_sel", "RCS_ibmprof_logon", "RCS_getibmserv",
	"RCS_link_emul_SLIP", "RCS_linkucfg_slip_", "RCS_link_emul_sel",
	"RCS_link_emul_SNA", "RCS_linkucfg_sna", "RCS__link_emul_SNA",
	"RCS_link_emul_TCP/IP", "RCS_linkucfg_tcp_", "RCS_link_emul_sel",
	"RCS_link_prof_SLIP", "RCS_chlnk_prof_slip_", "RCS_emul_link_slip",
	"RCS_link_prof_SLIP", "RCS_chlnk_prof_slip_", "RCS_sel_emul_slip",
	"RCS_link_prof_SNA", "RCS_chlnk_prof_sna_HCON", "RCS_ghost_cmd_opt",
	"RCS_link_prof_TCP/IP", "RCS_chlnk_prof_tcp_", "RCS_sel_emul_tcp",
	"RCS_mkusrprof_IBMLink", "RCS_mkusrprof_ibm_", "RCS_link_conn_type",
	"RCS_mkusrprof_Support/6000", "RCS_mkusrprof_", "RCS_sup6conn",
	"RCS_mkusrprof_ibm_SLIP", "RCS_mkusrprof_ibm_slip_", "RCS_link_emul_ibm_SLIP",
	"RCS_mkusrprof_ibm_SNA", "RCS_mkprof_HCON", "RCS_ghost_cmd_opt",
	"RCS_mkusrprof_ibm_TCP/IP", "RCS_mkusrprof_ibm_tcp_", "RCS_link_emul_TCP/IP",
	"RCS_process_profile", "RCS_rmusrprof_", "RCS_ghost_cmd_opt",
	"RCS_rcs_add_profile", "RCS_rcs_select_serv", "RCS_rcs_select_name",
	"RCS_rcs_select_serv", "RCS_mkusrprof_", "RCS_rcs_service",
	"RCS_rm_what_serv", "RCS_process_profile", "RCS_rm_serv_sel",
	"RCS_rmslip", "RCS_removeslip", "RCS_whichslip",
	"RCS_rmusrprof_sel", "RCS_rm_what_serv", "RCS_rm_name_sel",
	"RCS_showslips", "RCS_makeconnection", "RCS__showslips",
	"RCS_stopslip_bad", "RCS_echo_active_before", "RCS_ghost_cmd_opt",
	"RCS_stopslip_good", "RCS_ok_to_stopslip", "RCS_ghost_cmd_opt",
	"RCS_stopslipserver", "RCS_stopslip_", "RCS_ghost_cmd_opt",
	"RCS_sub_sys_disconn_slip", "RCS__sub_sys_disconn_slip", "RCS_select_slip",
	"RCS_sup6login_name_sel", "RCS_sup6login_sel", "RCS_ghost_cmd_opt",
	"RCS_sup6login_sel", "RCS_sup6login_", "RCS__sup6login_sel",
	"RCS_user_disconnslip", "RCS_disconnslip", "RCS_what_slip_to_rm",
	"RCS_usr_disconnslip", "RCS_user_disconnslip", "RCS_ghost_cmd_opt",
	"RCS_usrfuncIBMLink", "RCS_link_emul_", "RCS__linkcontype",
	"RCS_usrfuncSupport/6000", "RCS_sup6ucfg_", "RCS__sup6contype",
	"RCS_usrfunc_getname", "RCS_usrfuncquery", "RCS_ghost_cmd_opt",
	"RCS_usrfuncquery", "RCS_usrfunc", "RCS__usrfuncquery",
	"SEL_Amd_delete", "Amd_delete", "ls_array_3",
	"SEL_Amd_display", "Amd_display", "ls_array_2",
	"SEL_Apc", "Apc", "ls_array_4",
	"SEL_disp_firmware_version", "disp_firmware_version", "ls_ac",
	"SEL_download_firmware", "download_firmware", "ls_ac",
	"add_snmp_comun", "add_snmp_comun_chg", "_add_snmp_comun",
	"add_snmp_nms", "add_snmp_nms_cmd", "add_snmp_nms_opt",
	"add_snmp_traps", "add_snmp_traps_cmd", "add_snmp_traps_opt",
	"bffcreate", "bffcreate.cmd_header", "get_device.bffcreate",
	"cfg128psync", "cfg128psync_hdr", "128psync_ln_opt",
	"cfg_fcs_dd", "cfg_fcsdd_hdr", "cfg_fcs_dd_opt",
	"cfg_scbndd", "cfg_scbndd_hdr", "cfg_scbndd_nopt",
	"cfgcdr", "cfgcdr_hdr", "cdrom_ln_opt",
	"cfgdials", "cfgdials_hdr", "dials_ln_opt",
	"cfgdsk", "cfgdsk_hdr", "disk_ln_opt",
	"cfgdskt", "cfgdskt_hdr", "dskt_ln_opt",
	"cfgmp", "cfgmp_hdr", "mp_ln_opt",
	"cfgmsla", "cfgmsla_hdr", "msla_ln_opt",
	"cfgprt", "cfgprt_hdr", "prt_ln_opt",
	"cfgsdlcmpadd", "cfg_sdlcmpa_dd", "ln_sdlcmpa_opt2",
	"cfgtmscsi", "cfgtmscsi_hdr", "tmscsi_ln_opt",
	"cfgtpe", "cfgtpe_hdr", "tape_ln_opt",
	"cfgtty", "cfgtty_hdr", "tty_ln_opt",
	"cfgx25dd", "cfg_x25a_dd", "ln_x25a_opt",
	"chacpa", "chgacp_hdr", "acp_ln_opt",
	"chcdrfs", "cdchfsCmdHdr", "cdchfsNameOpt",
	"chdclient", "chdclient", "client_select",
	"chdials", "chgdials_hdr_", "dials_ln_opt",
	"chdispsz", "chdispsz_dial", "chdispsz_sel",
	"chdspot", "chdspot", "client_select",
	"chen", "chineten", "_chen",
	"chfc", "chinetfc", "_chfc",
	"chfi", "chinetfi", "_chfi",
	"chg128psync", "chg128psync_hdr", "128psync_ln_opt",
	"chg3270", "chg3270_hdr", "3270_ln_opt",
	"chg_fcs_dd", "chg_fcsdd_hdr", "chg_fcs_dd_opt",
	"chg_scbndd", "chg_scbndd_hdr", "chg_scbndd_nopt",
	"chgcat", "chgcat_hdr_", "cat_ln_opt",
	"chgcat_hdr_pca_mca", "chgcat_hdr_", "cat_chg",
	"chgcdr", "chgcdr_", "cdrom_ln_opt",
	"chgdsk", "chgdsk_", "disk_ln_opt",
	"chgdskt", "chgdskt_hdr", "dskt_ln_opt",
	"chgenet", "chgenet_hdr_", "enet_ln_opt",
	"chgfddi", "chgfddi_hdr_", "fddi_ln_opt",
	"chghdr_mpa_mca", "chghdr_", "mpachg",
	"chghfcs", "chghfcs_hdr", "fcs_ln_opt",
	"chgmp", "chgmp_hdr", "mp_ln_opt",
	"chgmpa", "chghdr_", "lnopt",
	"chgmsla", "chgmsla_hdr_", "msla_ln_opt",
	"chgprt", "chgprt_hdr_", "prt_ln_opt",
	"chgprt_hdr_parallel", "chgprt_parallel", "chgprt_hdr_parallel.opt",
	"chgprt_hdr_rs232", "chgprt_rs232_", "chgprt_hdr_rs232.opt",
	"chgprt_hdr_rs422", "chgprt_rs422", "chgprt_hdr_rs422.opt",
	"chgroup", "group_change.hdr", "group_change.name_select",
	"chgscsi", "chgscsi_hdr_", "scsi_ln_opt",
	"chgtmscsi", "chgtmscsi_", "tmscsi_ln_opt",
	"chgtok", "chgtok_hdr_", "tok_ln_opt",
	"chgtpe", "chgtpe_", "tape_ln_opt",
	"chgtty", "chgtty_hdr", "tty_ln_opt",
	"chgtty", "chgtty_task_selector", "tty_ln_opt",
	"chgtty_hw", "chgtty_hw_", "chgtty_hw.opt",
	"chgtty_nls", "chgtty_nls_diag", "chgtty_nls_diag.opt",
	"chgtty_posix", "chgtty_posix_diag", "chgtty_posix_diag.opt",
	"chgtty_program", "chgtty_program_diag", "chgtty_program_diag.opt",
	"chgtty_route_to_dialog", "chgtty_", "chgtty_route_to_dialog.opt",
	"chgtty_task_selector", "chgtty_", "chgtty_task_selector.opt",
	"chhostent", "chhostent1", "_chhostent",
	"chif", "chif1", "_chif",
	"chifdriveren", "chifdriver1", "_chifdriveren",
	"chifdriverfc", "chifdriver1", "_chifdriverfc",
	"chifdriverfi", "chifdriver1", "_chifdriverfi",
	"chifdrivertr", "chifdriver1", "_chifdrivertr",
	"chifdriverx2", "chifdriver1", "_chifdriverx2",
	"chinet", "chinet", "_chinet",
	"chinetdconf", "chinetdconf1", "_chinetdconf",
	"chinetsx25", "chsx25_", "_chsx25",
	"chinetx25", "chx25_", "_chx25",
	"chinterface", "chinterface.dial", "chinterface.ns",
	"chjfs", "jchfsCmdHdr", "jchfsNameOpt",
	"chlv1", "chlvd", "_cmdlvmlvns",
	"chnfsexp", "chnfsexp.dialog", "_nfs.chnfsexp.select",
	"chnfsmnt", "chnfsmnt.dialog", "_nfs.chnfsmnt.select",
	"chps", "chpsCmdHdr", "chpsNameOpt",
	"chpv", "chpv1", "_cmdlvmpvns",
	"chque", "chqueCmdHdr", "chqueNameOpt",
	"chquedev", "chquedevNameHdr", "chquedevNameOpt0",
	"chquedevNameHdr", "chquedevCmdHdr1", "chquedevNameOpt1",
	"chrefrate", "chrefrate_dial", "chrefrate_sel",
	"chrhp", "chrhp_chg_", "_chrhp",
	"chsdlcmpadd", "ch_sdlcmpa_dd", "ln_sdlcmpa_opt",
	"chservices", "chservices1", "_chservices",
	"chsx2", "chinetxs", "_chsx2",
	"chtr", "chinettr", "_chtr",
	"chtz", "chtz_dial", "chtz_cmd_opt_no",
	"chtz", "chtz_dial", "chtz_cmd_opt_yes",
	"chtz", "chtz_selector_", "chtz_cmd_opt_a",
	"chtz_selector_1", "chtz_dial", "chtz_cmd_opt_yes",
	"chtz_selector_2", "chtz_dial", "chtz_cmd_opt_no",
	"chuser", "user_change.hdr", "user_change.name_select",
	"chvca", "chgvca_hdr_", "vca_ln_opt",
	"chvg", "chvg1", "_cmdlvmvgns",
	"chx2", "chinetxt", "_chx2",
	"cmddlc_ether_ls", "cmddlc_ether_ls", "cmddlc_ether_name_ls",
	"cmddlc_ether_mk", "cmddlc_ether_mk", "cmddlc_ether_name_mk",
	"cmddlc_ether_rm", "cmddlc_ether_rm", "cmddlc_ether_name_rm",
	"cmddlc_fddi_ls", "cmddlc_fddi_ls", "cmddlc_fddi_name_ls",
	"cmddlc_fddi_mk", "cmddlc_fddi_mk", "cmddlc_fddi_name_mk",
	"cmddlc_fddi_rm", "cmddlc_fddi_rm", "cmddlc_fddi_name_rm",
	"cmddlc_qllc_ls", "cmddlc_qllc_ls", "cmddlc_qllc_name_ls",
	"cmddlc_qllc_mk", "cmddlc_qllc_mk", "cmddlc_qllc_name_mk",
	"cmddlc_qllc_rm", "cmddlc_qllc_rm", "cmddlc_qllc_name_rm",
	"cmddlc_sdlc_ls", "cmddlc_sdlc_ls", "cmddlc_sdlc_name_ls",
	"cmddlc_sdlc_mk", "cmddlc_sdlc_mk", "cmddlc_sdlc_name_mk",
	"cmddlc_sdlc_rm", "cmddlc_sdlc_rm", "cmddlc_sdlc_name_rm",
	"cmddlc_token_ls", "cmddlc_token_ls", "cmddlc_token_name_ls",
	"cmddlc_token_mk", "cmddlc_token_mk", "cmddlc_token_name_mk",
	"cmddlc_token_rm", "cmddlc_token_rm", "cmddlc_token_name_rm",
	"crjfs", "jcrfsCmdHdr", "jcrfsNameOpt",
	"cx25str_dd_a_sel", "cx25str_dd_a_hdr", "cx25str_dd_a_sel_cmd",
	"cx25str_dd_c_sel", "cx25str_dd_c_hdr", "cx25str_dd_c_cmd",
	"cx25str_dd_r_sel", "cx25str_dd_r_hdr", "cx25str_dd_l_cmd",
	"cx25str_mp_a_sel", "x25str_mp_a_hdr", "cx25str_mp_sel_parent",
	"cx25str_mp_m_hdr", "x25str_mp_m_dial", "cx25str_mp_sel_parent",
	"cx25str_mp_m_sel", "cx25str_mp_m_hdr", "x25str_mp_sel_port",
	"dacc_adddev", "dacc_adddev.dialog", "dacc_pickparent_device",
	"dacc_configdev", "dacc_configdev.dialog", "dacc_pick_device",
	"dacc_remdev", "dacc_remdev.dialog", "dacc_pick_device",
	"date", "date_dial", "date_sel_opt",
	"date_dial", "date_dial", "chtz_opts",
	"diskless_cklevels", "diskless_cklevels.hdr", "diskless_cklevels.name_select",
	"diskless_install_commit", "diskless_install_commit.hdr", "diskless_install_commit.name_select",
	"diskless_install_install", "diskless_install_install.name_select2.hdr", "diskless_install_install.name_select1",
	"diskless_install_install.name_select2.hdr", "diskless_install_install.hdr", "diskless_install_install.name_select2",
	"diskless_install_instupdt", "diskless_install_instupdt.name_select2.hdr", "diskless_install_instupdt.name_select1",
	"diskless_install_instupdt.name_select2.hdr", "diskless_install_instupdt.hdr", "diskless_install_instupdt.name_select2",
	"diskless_install_list_applied", "diskless_install_list_applied.hdr", "diskless_install_list_applied.name_select",
	"diskless_install_reject", "diskless_install_reject.hdr", "diskless_install_reject.name_select",
	"diskless_install_remove", "diskless_install_remove.hdr", "diskless_install_remove.name_select",
	"diskless_install_update", "diskless_install_update.name_select2.hdr", "diskless_install_update.name_select1",
	"diskless_install_update.name_select2.hdr", "diskless_install_update.hdr", "diskless_install_update.name_select2",
	"diskless_instupdt_commit", "diskless_instupdt_commit.hdr", "diskless_instupdt_commit.name_select",
	"diskless_instupdt_install", "diskless_instupdt_install.name_select2.hdr", "diskless_instupdt_install.name_select1",
	"diskless_instupdt_install.name_select2.hdr", "diskless_instupdt_install.hdr", "diskless_instupdt_install.name_select2",
	"diskless_instupdt_instupdt", "diskless_instupdt_instupdt.name_select2.hdr", "diskless_instupdt_instupdt.name_select1",
	"diskless_instupdt_instupdt.name_select2.hdr", "diskless_instupdt_instupdt.hdr", "diskless_instupdt_instupdt.name_select2",
	"diskless_instupdt_pending", "diskless_instupdt_pending.hdr", "diskless_instupdt_pending.name_select",
	"diskless_instupdt_reject", "diskless_instupdt_reject.hdr", "diskless_instupdt_reject.name_select",
	"diskless_instupdt_remove", "diskless_instupdt_remove.hdr", "diskless_instupdt_remove.name_select",
	"diskless_instupdt_update", "diskless_instupdt_update.name_select2.hdr", "diskless_instupdt_update.name_select1",
	"diskless_instupdt_update.name_select2.hdr", "diskless_instupdt_update.hdr", "diskless_instupdt_update.name_select2",
	"diskless_list_applied", "diskless_list_applied.hdr", "diskless_list_applied.name_select",
	"diskless_lslpp_dependents", "diskless_lslpp_dependents.hdr", "diskless_lslpp_dependents.name_select",
	"diskless_lslpp_files", "diskless_lslpp_files.hdr", "diskless_lslpp_files.name_select",
	"diskless_lslpp_history", "diskless_lslpp_history.hdr", "diskless_lslpp_history.name_select",
	"diskless_lslpp_id", "diskless_lslpp_id.hdr", "diskless_lslpp_id.name_select",
	"diskless_lslpp_installed", "diskless_lslpp_installed.cmd_option", "diskless_lslpp_installed.name_select",
	"diskless_lslpp_maintenance", "diskless_lslpp_maintenance.hdr", "diskless_lslpp_maintenance.name_select",
	"diskless_lslpp_prereq", "diskless_lslpp_prereq.hdr", "diskless_lslpp_prereq.name_select",
	"diskless_verify", "diskless_verify.hdr", "diskless_verify.name_select",
	"diskless_vpd_cklevels", "diskless_vpd_cklevels.hdr", "diskless_vpd_cklevels.name_select",
	"diskless_vpd_dependents", "diskless_vpd_dependents.hdr", "diskless_vpd_dependents.name_select",
	"diskless_vpd_files", "diskless_vpd_files.hdr", "diskless_vpd_files.name_select",
	"diskless_vpd_history", "diskless_vpd_history.hdr", "diskless_vpd_history.name_select",
	"diskless_vpd_list", "diskless_vpd_list.hdr", "diskless_vpd_list.name_select",
	"diskless_vpd_listupdt", "diskless_vpd_listupdt.hdr", "diskless_vpd_listupdt.name_select",
	"diskless_vpd_pending", "diskless_vpd_pending.hdr", "diskless_vpd_pending.name_select",
	"diskless_vpd_pid", "diskless_vpd_pid.hdr", "diskless_vpd_pid.name_select",
	"diskless_vpd_prereqs", "diskless_vpd_prereqs.hdr", "diskless_vpd_prereqs.name_select",
	"diskless_vpd_verify", "diskless_vpd_verify.hdr", "diskless_vpd_verify.name_select",
	"dump_copy_dskt", "dump_copy_dskt_", "dump_copy_dskt",
	"dump_copy_file", "dump_copy_file_", "dump_copy_file",
	"dumpfmt", "dumpfmt_", "dumpfmt_opt",
	"errpt", "errpt_sel_", "errpt_sel.1st",
	"errpt_sel_1", "errpt.dial_1_", "errpt_ghost",
	"errpt_sel_2", "errpt.dial_2_", "errpt_ghost",
	"extendlv", "extendlv1", "_cmdlvmlvns",
	"install_all", "install_all.cmd_header", "get_device",
	"install_enhancements", "install_enhancements.cmd_header", "get_device",
	"install_latest", "install_latest.cmd_header", "get_device",
	"install_list", "install_list.cmd_header", "get_device",
	"install_list_problems", "install_list_problems.cmd_header", "get_device",
	"install_maintenance", "install_maintenance.cmd_header", "get_device",
	"install_selectable_all", "install_selectable_all.cmd_header", "get_device",
	"install_subsystems", "install_subsystems.cmd_header", "get_device",
	"instupdt_for_net", "instupdt_for_net.hdr_", "instupdt_for_net.name_select",
	"instupdt_install", "instupdt.install.hdr_", "instupdt.install.name_select",
	"instupdt_instupdt", "instupdt.instupdt.hdr_", "instupdt.instupdt.name_select",
	"instupdt_list", "instupdt.list.hdr_", "instupdt.list.name_select",
	"instupdt_list_problems", "instupdt_list_problems_", "instupdt_list_problems.ns",
	"instupdt_update", "instupdt.update.hdr_", "instupdt.update.name_select",
	"lsattrd", "lsattrd_hdr", "lsattrd_opt",
	"lsattrs", "lsattrs_1", "lsattrs_opt",
	"lsattrs_1", "lsattrs_2", "lsattrs_1_opt",
	"lsattrs_2", "lsattrs_hdr", "lsattrs_2_opt",
	"lscat", "sslast", "",
	"lslv", "lslvd", "_cmdlvmlvns",
	"lsmpa", "sslast", "",
	"lspv", "lspvd", "_cmdlvmpvns",
	"lsvg1", "lsvgd", "_cmdlvmvgns",
	"makcdr", "makcdr_", "cdrom_predef_opt",
	"makcdr_oscd_scsi", "makcdr_oscd_scsi_hdr", "makcdr_parent_opt",
	"makcdr_scsi", "makcdr_scsi_hdr", "makcdr_parent_opt",
	"makdials", "makdials_parent", "dials_predef_opt",
	"makdials_parent", "makdials_hdr", "makdials_parent_opt",
	"makdsk", "makdsk_", "disk_predef_opt",
	"makdsk_dar", "dacc_adddev.dialog", "dacc_pickparent_device",
	"makdsk_osdisk_scsi", "makdsk_osdisk_scsi_hdr", "makdsk_parent_opt",
	"makdsk_scsi", "makdsk_scsi_hdr", "makdsk_parent_opt",
	"makmp", "makmp_hdr", "mp_mk_parent",
	"makmsla", "makmsla_mode", "msla_mk_parent",
	"makmsla_mode", "makmsla_hdr_", "msla_mk_mode",
	"makprt", "makprt_subclass", "prt_predef_opt",
	"makprt_hdr_parallel", "makprt_parallel", "makprt_hdr_parallel.opt",
	"makprt_hdr_rs232", "makprt_rs232_", "makprt_hdr_rs232.opt",
	"makprt_hdr_rs422", "makprt_rs422", "makprt_hdr_rs422.opt",
	"makprt_parent", "makprt_hdr_", "makprt_parent_opt",
	"makprt_subclass", "makprt_parent", "prt_predef_class_opt",
	"maktmscsi", "maktmscsi_", "tmscsi_predef_opt",
	"maktmscsi_scsi", "maktmscsi_scsi_hdr", "maktmscsi_parent_opt",
	"maktpe", "maktpe_", "tape_predef_opt",
	"maktpe_1200mb-c_scsi", "maktpe_1200mb-c_scsi_hdr", "maktpe_parent_opt",
	"maktpe_150mb_scsi", "maktpe_150mb_scsi_hdr", "maktpe_parent_opt",
	"maktpe_3490e_scsi", "maktpe_3490e_scsi_hdr", "maktpe_parent_opt",
	"maktpe_4mm2gb_scsi", "maktpe_4mm2gb_scsi_hdr", "maktpe_parent_opt",
	"maktpe_4mm4gb_scsi", "maktpe_4mm4gb_scsi_hdr", "maktpe_parent_opt",
	"maktpe_525mb_scsi", "maktpe_525mb_scsi_hdr", "maktpe_parent_opt",
	"maktpe_8mm5gb_scsi", "maktpe_8mm5gb_scsi_hdr", "maktpe_parent_opt",
	"maktpe_8mm_scsi", "maktpe_8mm_scsi_hdr", "maktpe_parent_opt",
	"maktpe_9trk_scsi", "maktpe_9trk_scsi_hdr", "maktpe_parent_opt",
	"maktpe_ost_scsi", "maktpe_ost_scsi_hdr", "maktpe_parent_opt",
	"maktty", "maktty_parent", "tty_predef_opt",
	"maktty_hdr", "addtty_", "maktty_hdr.opt",
	"maktty_parent", "maktty_hdr", "maktty_parent_opt",
	"migratepv", "migratepvd", "_cmdlvmpvns",
	"migratepv", "migratepvd", "_cmdlvmspvns",
	"mk_fcs_dd", "mk_fcsdd_hdr", "mk_fcs_dd_opt",
	"mk_scbndd", "mk_scbndd_hdr", "mk_scbndd_nopt",
	"mkdclient", "mkdclient", "spot_select",
	"mkhostent", "rmx25_1", "_mkhostent",
	"mkinet1ca", "mkinetca", "_mkinet1ca",
	"mkinet1en", "mkineten", "_mkinet1en",
	"mkinet1et", "mkinetet", "_mkinet1et",
	"mkinet1fc", "mkinetfc", "_mkinet1fc",
	"mkinet1fi", "mkinetfi", "_mkinet1fi",
	"mkinet1sl", "mkinetsl", "_mkinet1sl",
	"mkinet1so", "mkinetso", "_mkinet1so",
	"mkinet1tr", "mkinettr", "_mkinet1tr",
	"mkinet1xs", "mkinetxs", "_mkinet1xs",
	"mkinet1xt", "mkinetxt", "_mkinet1xt",
	"mkinetca", "mkinetca", "_mkinetca",
	"mkinetdconf", "mkinetdconf1", "_mkinetdconf",
	"mkinetdconf1", "mkinetdconf1", "_mkinetdconf1",
	"mkineten", "mkineten", "_mkineten",
	"mkinetet", "mkinetet", "_mkinetet",
	"mkinetfc", "mkinetfc", "_mkinetfc",
	"mkinetfi", "mkinetfi", "_mkinetfi",
	"mkinetsl", "mkinetsl", "_mkinetsl",
	"mkinetso", "mkinetso", "_mkinetso",
	"mkinettr", "mkinettr", "_mkinettr",
	"mkinetxt", "mkinetxt", "_mkinetxt",
	"mklv", "mklv1", "_cmdlvmvgns",
	"mklvcopy", "mklvcopy1", "_cmdlvmlvns",
	"mkps", "mkpsCmdHdr", "mkpsNameOpt",
	"mksdlcmpadd", "mk_sdlcmpa_dd", "ln_sdlcmpa_opt3",
	"mktcpip", "mktcpip", "_mktcpip1",
	"mkx25dd", "mk_x25a_dd", "mk_x25a_opt",
	"movmp", "movmp_parent", "mp_ln_opt",
	"movmp_parent", "movmp_hdr", "mp_mv_parent",
	"movprt", "movprt_parent", "prt_ln_opt",
	"movprt_parent", "movprt_hdr", "prt_mv_parent",
	"movtty", "movtty_parent", "tty_ln_opt",
	"movtty_parent", "movtty_hdr", "tty_mv_parent",
	"mpqp_add", "makmpdd_hdr", "mp_mkdd_parent",
	"mpqp_cfg", "cfgmpdd_hdr", "mp_lndd_opt",
	"mpqp_rm", "rmvmpdd_hdr", "mp_lndd_opt",
	"off_chsnmp_status", "off_chsnmp_status_chg", "_off_chsnmp_status",
	"on_chsnmp_status", "on_chsnmp_status_chg", "_on_chsnmp_status",
	"qserver", "qserver.cmd", "select.subsvr.name.opt",
	"react_chgshowdev", "react_chgshowdev.dialog", "react_pick_device",
	"react_removedev", "react_remdev.dialog", "react_pick_device",
	"reducevg1", "reducevgd", "_cmdlvmvgns",
	"reducevg2", "rmvg", "_cmdlvmvgns",
	"remove_snmp_nms", "remove_snmp_nms_lst", "remove_snmp_nms_opt",
	"remove_snmp_nms_lst", "remove_snmp_nms_cmd", "remove_snmp_nms_lst_opt",
	"remove_snmp_traps", "remove_snmp_traps_lst", "remove_snmp_traps_opt",
	"remove_snmp_traps_lst", "remove_snmp_traps_cmd", "remove_snmp_traps_lst_opt",
	"reorgvg", "reorgvg1", "_cmdlvmvgns",
	"rm_fcs_dd", "rm_fcsdd_hdr", "rm_fcs_dd_opt",
	"rm_scbndd", "rm_scbndd_hdr", "chg_scbndd_nopt",
	"rmdials", "rmvdials_hdr", "dials_ln_opt",
	"rmen", "rmi1", "_rmen",
	"rmfc", "rmi1", "_rmfc",
	"rmfi", "rmi1", "_rmfi",
	"rmhostent", "rmhostent1", "_chhostent",
	"rmhostent1", "rmhostent1", "_rmhostent1",
	"rminet", "rmi1", "_rminet",
	"rminetdconf", "rminetdconf1", "_rminetdconf",
	"rmlvcopy", "rmlvcopy1", "_cmdlvmlvns",
	"rmnfsexp", "rmnfsexp.dialog", "_nfs.rmnfsexp.select",
	"rmnfsmnt", "rmnfsmnt.dialog", "_nfs.rmnfsmnt.select",
	"rmquedev", "rmquedevCmdHdr", "rmquedevNameOpt",
	"rmsdlcmpadd", "rm_sdlcmpa_dd", "ln_sdlcmpa_opt",
	"rmservices", "rmservices1", "_rmservices",
	"rmso", "rmi1", "_rmen",
	"rmsx2", "rmi1", "_rmsx2",
	"rmsx25", "rmsx25_1", "_rmsx25",
	"rmtr", "rmi1", "_rmtr",
	"rmvcdr", "rmvcdr_hdr", "cdrom_ln_opt",
	"rmvdsk", "rmvdsk_hdr", "disk_ln_opt",
	"rmvdskt", "rmvdskt_hdr", "dskt_ln_opt",
	"rmvmp", "rmvmp_hdr", "mp_ln_opt",
	"rmvmsla", "rmvmsla_hdr", "msla_ln_opt",
	"rmvprt", "rmvprt_hdr", "prt_ln_opt",
	"rmvtmscsi", "rmvtmscsi_hdr", "tmscsi_ln_opt",
	"rmvtpe", "rmvtpe_hdr", "tape_ln_opt",
	"rmvtty", "rmvtty_hdr", "tty_ln_opt",
	"rmx2", "rmi1", "_rmx2",
	"rmx25", "rmx25_1", "_rmx25",
	"rmx25dd", "rm_x25a_dd", "ln_x25a_opt",
	"rsdswconfig", "rsdswconfig.hdr", "rsdswconfig_device.name_select",
	"rsdswconfig_n_safe", "rsdswconfig_n_safe.hdr", "rsdswconfig_device.name_select",
	"rsdswconfig_rpl", "rsdswconfig_rpl.hdr", "rsdswconfig_device.name_select",
	"rsdswconfig_safe", "rsdswconfig_safe.hdr", "rsdswconfig_device.name_select",
	"rsswconfig", "rsswconfig.hdr", "rsswconfig_device.name_select",
	"rsswconfig_n_safe", "rsswconfig_n_safe.hdr", "rsswconfig_device.name_select",
	"rsswconfig_rpl", "rsswconfig_rpl.hdr", "rsswconfig_device.name_select",
	"rsswconfig_safe", "rsswconfig_safe.hdr", "rsswconfig_device.name_select",
	"sh_snmp_nms", "sh_snmp_nms_cmd", "sh_snmp_nms_opt",
	"sh_snmp_traps", "sh_snmp_traps_cmd", "sh_snmp_traps_opt",
	"shsnmp_comun", "shsnmp_comun_sh", "_shsnmp_comun",
	"shsnmp_comun_sh", "shsnmp_comun_sh_chg", "shsnmp_comun_sh_opt",
	"shsnmp_status", "shsnmp_status_chg", "_shsnmp_status",
	"spotinfo", "spotinfo", "spot_select",
	"startserver", "startserver.cmd", "select.subsvr.name.opt",
	"startserver.trace", "startserver.trace.cmd", "select.subsvr.name.opt",
	"stopserver", "stopserver.cmd", "select.subsvr.name.opt",
	"stopserver.trace", "stopserver.trace.cmd", "select.subsvr.name.opt",
	"svdswconfig", "svdswconfig.hdr", "svdswconfig.name_select",
	"svswconfig", "svswconfig.hdr", "svswconfig.name_select",
	"trcrpt", "trcrpt_", "trcrpt_sel",
	"trcstop", "trcstop", "trcstop.N",
	"ts7318_cs_chg_server_nam", "ts7318_cs_chg_hdr", "ts7318_cs_chg_server_opt",
	"ts7318_cs_remove_server_nam", "ts7318_cs_remove_hdr", "ts7318_cs_remove_server_opt",
	"ts7318_port_buddy_server_nam", "ts7318_port_buddy_hdr", "ts7318_port_buddy_server_opt",
	"ts7318_port_hibaud_server_nam", "ts7318_port_hibaud_hdr", "ts7318_port_hibaud_server_opt",
	"ts7318_port_slew_server_nam", "ts7318_port_slew_hdr", "ts7318_port_slew_server_opt",
	"ts7318_prt_add_intf_nam", "ts7318_prt_add_port_nam_", "ts7318_prt_add_intf_opt",
	"ts7318_prt_add_port_nam_parallel", "ts7318_prt_add_par_hdr", "ts7318_prt_add_par_port_opt",
	"ts7318_prt_add_port_nam_rs232", "ts7318_prt_add_ser_type_nam", "ts7318_prt_add_ser_port_opt",
	"ts7318_prt_add_port_nam_rs422", "ts7318_prt_add_ser_type_nam", "ts7318_prt_add_ser_port_opt",
	"ts7318_prt_add_printer_nam", "ts7318_prt_add_intf_nam", "ts7318_prt_add_printer_opt",
	"ts7318_prt_add_ser_type_nam", "ts7318_prt_add_ser_type_hdr_", "ts7318_prt_add_ser_type_opt",
	"ts7318_prt_add_server_nam", "ts7318_prt_add_printer_nam", "ts7318_prt_add_server_opt",
	"ts7318_prt_chg_printer_nam", "ts7318_prt_chg_type_nam", "ts7318_prt_chg_printer_opt",
	"ts7318_prt_chg_server_nam", "ts7318_prt_chg_printer_nam", "ts7318_prt_chg_server_opt",
	"ts7318_prt_chg_type_nam", "ts7318_prt_chg_type_hdr_", "ts7318_prt_chg_type_opt",
	"ts7318_prt_remove_printer_nam", "ts7318_prt_remove_hdr", "ts7318_prt_remove_printer_opt",
	"ts7318_prt_remove_server_nam", "ts7318_prt_remove_printer_nam", "ts7318_prt_remove_server_opt",
	"ts7318_tty_add_port_nam", "ts7318_tty_add_type_nam", "ts7318_tty_add_port_opt",
	"ts7318_tty_add_server_nam", "ts7318_tty_add_port_nam", "ts7318_tty_add_server_opt",
	"ts7318_tty_add_type_nam", "ts7318_tty_add_hdr_", "ts7318_tty_add_type_opt",
	"ts7318_tty_chg_server_nam", "ts7318_tty_chg_tty_nam", "ts7318_tty_chg_server_opt",
	"ts7318_tty_chg_tty_nam", "ts7318_tty_chg_hdr", "ts7318_tty_chg_tty_opt",
	"ts7318_tty_remove_server_nam", "ts7318_tty_remove_tty_nam", "ts7318_tty_remove_server_opt",
	"ts7318_tty_remove_tty_nam", "ts7318_tty_remove_hdr", "ts7318_tty_remove_tty_opt",
	"x25csa", "x25csa2", "x25_listc",
	"x25csa2", "x25csa_", "x25_list_pvc",
	"x25csd", "x25csd", "x25_listc",
	"x25csf", "x25csf", "x25_listc",
	"x25csg", "x25csg", "x25_listc",
	"x25csn", "x25csn", "x25_listc",
	"x25csp", "x25csp", "x25_listc",
	"x25str_a_cio_sel", "x25str_a_cio_hdr", "x25str_a_cio_cmd",
	"x25str_dd_a_sel", "x25str_dd_a_hdr", "x25str_dd_a_sel_cmd",
	"x25str_dd_c_sel", "x25str_dd_c_hdr", "x25str_dd_c_cmd",
	"x25str_dd_r_sel", "x25str_dd_r_hdr", "x25str_dd_l_cmd",
	"x25str_mp_a_sel", "x25str_mp_a_hdr", "x25str_mp_sel_parent",
	"x25str_mp_c_sel", "x25str_mp_c_hdr", "x25str_mp_sel_dport",
	"x25str_mp_csp_d_sel", "x25str_mp_csp_d_hdr", "x25str_mp_sel_port",
	"x25str_mp_csp_f_sel", "x25str_mp_csp_f_hdr", "x25str_mp_sel_port",
	"x25str_mp_csp_g_sel", "x25str_mp_csp_g_hdr", "x25str_mp_sel_port",
	"x25str_mp_csp_p_sel", "x25str_mp_csp_p_hdr", "x25str_mp_sel_port",
	"x25str_mp_m_hdr", "x25str_mp_m_dial", "x25str_mp_sel_parent",
	"x25str_mp_m_sel", "x25str_mp_m_hdr", "x25str_mp_sel_port",
	"x25str_mp_mnd_a_sel", "x25str_mp_mnd_a_hdr", "x25str_mp_sel_port",
	"x25str_mp_mnd_r_sel", "x25str_mp_mnd_r_hdr", "x25str_mp_sel_port",
	"x25str_mp_mnd_s_sel", "x25str_mp_mnd_s_hdr", "x25str_mp_sel_port",
	"x25str_mp_r_sel", "x25str_mp_r_hdr", "x25str_mp_sel_port",
	"x25str_r_cio_sel", "x25str_r_cio_hdr", "x25str_r_cio_cmd",
	"x25str_r_if_sel", "x25str_r_if_hdr", "x25str_r_if_cmd",
	"x_chg_net_n", "x_chg_net_d", "x_chg_net_n_opt",
	"x_chg_trm_n_120", "x_chg_trm_d_120", "x_chg_trm_n_opt_120",
	"x_chg_trm_n_130", "x_chg_trm_d_130", "x_chg_trm_n_opt_130",
	"x_chg_trm_n_140", "x_chg_trm_d_140", "x_chg_trm_n_opt_140",
	"x_chg_trm_n_150", "x_chg_trm_d_150", "x_chg_trm_n_opt_150",
	"x_rm_fpe_n", "x_rm_fpe_n2", "x_rm_fpe_n_opt",
	"x_rm_fpe_n2", "x_rm_fpe_d", "x_rm_fpe_n2_opt",
	"x_rm_net_n", "x_rm_net_d", "x_rm_net_n_opt",
	"x_rm_trm_n", "x_rm_trm_d", "x_rm_trm_n_opt"
        };

#define NUM_OBS_NAME_HDRS (sizeof(obs_name_hdrs) / sizeof(struct name_hdr_list))
