# @(#)88        1.1  src/bldscripts/discrepancies.41J.devices.mca.8efc.com, ade_build, bos41J, 9521A_all 5/23/95 09:39:20
#
#   COMPONENT_NAME: ADE_BUILD
#
#   ORIGINS: 27,71
#
#   This module contains IBM CONFIDENTIAL code. -- (IBM
#   Confidential Restricted when combined with the aggregated
#   modules for this product)
#                    SOURCE MATERIALS
#
#   (C) COPYRIGHT International Business Machines Corp. 1991, 1994
#   All Rights Reserved
#   US Government Users Restricted Rights - Use, duplication or
#   disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
# 

prefix        p
name          178617
reference     
abstract      update != install for devices.mca.8efc.com
duplicate     

state         working                     priority      41Japproved         
severity      3                           target        950523              
age           5

compName      ade_build                   answer        error               
release       bos41J                      symptom       claim               
envName                                   phaseFound    build               
level         9519A                       phaseInject                       

addDate       95/05/18 17:12:29           assignDate    95/05/18 17:18:59   
lastUpdate    95/05/23 08:58:04           responseDate  95/05/18 17:18:59   
endDate                                

ownerLogin    jsillers                    originLogin   jsillers            
ownerName     Sillers, John               originName    Sillers, John       
ownerArea     AUS/d05s                    originArea    AUS/d05s            

tracks:
    releaseName           state           addDate   lastUpdate target
    --------------------- --------------- --------- ---------- ---------------
    bos41J                fix             95/05/18  95/05/23                  

verify:
    type            state           addDate   lastUpdate userLogin
    --------------- --------------- --------- ---------- ---------------
    original        notReady        95/05/18  95/05/18   jsillers       

history:
    addDate              action          userLogin (userName)
    -------------------- --------------- ----------------------------------
    95/05/18 17:12:29    open            jsillers (Sillers, John)
    95/05/18 17:18:59    assign          jsillers (Sillers, John)
    95/05/18 17:18:59    accept          jsillers (Sillers, John)
    95/05/23 08:54:53    modify          jsillers (Sillers, John)
    95/05/23 08:54:54    note            jsillers (Sillers, John)
    95/05/23 08:57:58    modify          mustfix (Project Controls - Must Fix ID)
    95/05/23 08:58:01    note            dmehaffy (Mehaffy, David)
    95/05/23 08:58:04    note            dmehaffy (Mehaffy, David)

duplicate defects: none.

duplicate features: none.

sizing: none.

notes:
    <Note by jsillers (Sillers, John), 95/05/18 17:12:29, action: open>
The following files in devices.mca.8efc.com have been found to be
different between the 41J install images and
update images. These need to be re-synced by
creating an update which include these files.

/usr/lib/drivers/vscsiddpin

    <Note by jsillers (Sillers, John), 95/05/18 17:18:59, action: assign>
Old Owner: aubertin
New Owner: jsillers



    <Note by jsillers (Sillers, John), 95/05/23 08:54:53, action: modify>
Old Target:  
New Target:  950523



    <Note by jsillers (Sillers, John), 95/05/23 08:54:54, action: note>
# Priority being requested:  41Japproved

# CONTACT - Name and phone number of responsible person
#------------------------------------------------------
Sillers, John    678-1007

# CUSTOMER - Who will experience this problem?
#---------------------------------------------
customers installing updates and not install
images

# IMPACT - How will this impact the customer?
#--------------------------------------------
there will be some difference between 41J from
install images versus update images

# CAUSE - Injecting defect or feature and release
#------------------------------------------------
not known

# WORKAROUNDS - Temporary way around the problem
#-----------------------------------------------
none

# SIZE - Size and risk of implementing the solution
#--------------------------------------------------
0 loc
minimal risk 

# REVIEWER - Who will review this change?
#----------------------------------------
rayc

# SYMPTOM - What symptom(s) will the customer experience?
#--------------------------------------------------------
START_SYMPTOM
	difference between 41J systems 
STOP_SYMPTOM

# SOLUTION - Description of the fix to the problem
#-------------------------------------------------
START_SOLUTION
	created updates for the files which are
        different
STOP_SOLUTION

# NEW_FILES - Files being created in release "bos41J"
#---------------------------------------------------
src/bldscripts/discrepancies.41J.devices.mca.8efc.com

# CHANGED_FILES - Files changed in release "bos41J"
#-------------------------------------------------
None.

# EFFECTS - Effects of changes to release "bos41J"
#-------------------------------------------------
updates will match install images

    <Note by mustfix (Project Controls - Must Fix ID), 95/05/23 08:57:58, action: modify>
Changes made by Dave Mehaffy for Defect Board are: Marked 41Japproved,.
Old Priority:  
New Priority:  41Japproved



    <Note by dmehaffy (Mehaffy, David), 95/05/23 08:58:01, action: note>
bos41J approved by Dave Mehaffy for Defect Board

    <Note by dmehaffy (Mehaffy, David), 95/05/23 08:58:04, action: note>
 approved by Dave Mehaffy for Defect Board


