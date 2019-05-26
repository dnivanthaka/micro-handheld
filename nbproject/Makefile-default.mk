#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PIC18FLCD5110.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PIC18FLCD5110.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=--mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=pcd8544.c main.c /opt/microchip/xc8/v2.05/sources/pic18/plib/SPI/spi_clos.c /opt/microchip/xc8/v2.05/sources/pic18/plib/SPI/spi_open.c /opt/microchip/xc8/v2.05/sources/pic18/plib/SPI/spi_read.c /opt/microchip/xc8/v2.05/sources/pic18/plib/SPI/spi_writ.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/pcd8544.p1 ${OBJECTDIR}/main.p1 ${OBJECTDIR}/_ext/717854027/spi_clos.p1 ${OBJECTDIR}/_ext/717854027/spi_open.p1 ${OBJECTDIR}/_ext/717854027/spi_read.p1 ${OBJECTDIR}/_ext/717854027/spi_writ.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/pcd8544.p1.d ${OBJECTDIR}/main.p1.d ${OBJECTDIR}/_ext/717854027/spi_clos.p1.d ${OBJECTDIR}/_ext/717854027/spi_open.p1.d ${OBJECTDIR}/_ext/717854027/spi_read.p1.d ${OBJECTDIR}/_ext/717854027/spi_writ.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/pcd8544.p1 ${OBJECTDIR}/main.p1 ${OBJECTDIR}/_ext/717854027/spi_clos.p1 ${OBJECTDIR}/_ext/717854027/spi_open.p1 ${OBJECTDIR}/_ext/717854027/spi_read.p1 ${OBJECTDIR}/_ext/717854027/spi_writ.p1

# Source Files
SOURCEFILES=pcd8544.c main.c /opt/microchip/xc8/v2.05/sources/pic18/plib/SPI/spi_clos.c /opt/microchip/xc8/v2.05/sources/pic18/plib/SPI/spi_open.c /opt/microchip/xc8/v2.05/sources/pic18/plib/SPI/spi_read.c /opt/microchip/xc8/v2.05/sources/pic18/plib/SPI/spi_writ.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/PIC18FLCD5110.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F2550
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/pcd8544.p1: pcd8544.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pcd8544.p1.d 
	@${RM} ${OBJECTDIR}/pcd8544.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit2  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"/opt/microchip/xc8/v2.05/pic/include" -I"/opt/microchip/xc8/v2.05/include/plib" --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/pcd8544.p1  pcd8544.c 
	@-${MV} ${OBJECTDIR}/pcd8544.d ${OBJECTDIR}/pcd8544.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/pcd8544.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/main.p1: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.p1.d 
	@${RM} ${OBJECTDIR}/main.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit2  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"/opt/microchip/xc8/v2.05/pic/include" -I"/opt/microchip/xc8/v2.05/include/plib" --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/main.p1  main.c 
	@-${MV} ${OBJECTDIR}/main.d ${OBJECTDIR}/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/717854027/spi_clos.p1: /opt/microchip/xc8/v2.05/sources/pic18/plib/SPI/spi_clos.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/717854027" 
	@${RM} ${OBJECTDIR}/_ext/717854027/spi_clos.p1.d 
	@${RM} ${OBJECTDIR}/_ext/717854027/spi_clos.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit2  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"/opt/microchip/xc8/v2.05/pic/include" -I"/opt/microchip/xc8/v2.05/include/plib" --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/717854027/spi_clos.p1  /opt/microchip/xc8/v2.05/sources/pic18/plib/SPI/spi_clos.c 
	@-${MV} ${OBJECTDIR}/_ext/717854027/spi_clos.d ${OBJECTDIR}/_ext/717854027/spi_clos.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/717854027/spi_clos.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/717854027/spi_open.p1: /opt/microchip/xc8/v2.05/sources/pic18/plib/SPI/spi_open.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/717854027" 
	@${RM} ${OBJECTDIR}/_ext/717854027/spi_open.p1.d 
	@${RM} ${OBJECTDIR}/_ext/717854027/spi_open.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit2  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"/opt/microchip/xc8/v2.05/pic/include" -I"/opt/microchip/xc8/v2.05/include/plib" --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/717854027/spi_open.p1  /opt/microchip/xc8/v2.05/sources/pic18/plib/SPI/spi_open.c 
	@-${MV} ${OBJECTDIR}/_ext/717854027/spi_open.d ${OBJECTDIR}/_ext/717854027/spi_open.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/717854027/spi_open.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/717854027/spi_read.p1: /opt/microchip/xc8/v2.05/sources/pic18/plib/SPI/spi_read.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/717854027" 
	@${RM} ${OBJECTDIR}/_ext/717854027/spi_read.p1.d 
	@${RM} ${OBJECTDIR}/_ext/717854027/spi_read.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit2  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"/opt/microchip/xc8/v2.05/pic/include" -I"/opt/microchip/xc8/v2.05/include/plib" --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/717854027/spi_read.p1  /opt/microchip/xc8/v2.05/sources/pic18/plib/SPI/spi_read.c 
	@-${MV} ${OBJECTDIR}/_ext/717854027/spi_read.d ${OBJECTDIR}/_ext/717854027/spi_read.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/717854027/spi_read.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/717854027/spi_writ.p1: /opt/microchip/xc8/v2.05/sources/pic18/plib/SPI/spi_writ.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/717854027" 
	@${RM} ${OBJECTDIR}/_ext/717854027/spi_writ.p1.d 
	@${RM} ${OBJECTDIR}/_ext/717854027/spi_writ.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit2  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"/opt/microchip/xc8/v2.05/pic/include" -I"/opt/microchip/xc8/v2.05/include/plib" --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/717854027/spi_writ.p1  /opt/microchip/xc8/v2.05/sources/pic18/plib/SPI/spi_writ.c 
	@-${MV} ${OBJECTDIR}/_ext/717854027/spi_writ.d ${OBJECTDIR}/_ext/717854027/spi_writ.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/717854027/spi_writ.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/pcd8544.p1: pcd8544.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pcd8544.p1.d 
	@${RM} ${OBJECTDIR}/pcd8544.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"/opt/microchip/xc8/v2.05/pic/include" -I"/opt/microchip/xc8/v2.05/include/plib" --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/pcd8544.p1  pcd8544.c 
	@-${MV} ${OBJECTDIR}/pcd8544.d ${OBJECTDIR}/pcd8544.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/pcd8544.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/main.p1: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.p1.d 
	@${RM} ${OBJECTDIR}/main.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"/opt/microchip/xc8/v2.05/pic/include" -I"/opt/microchip/xc8/v2.05/include/plib" --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/main.p1  main.c 
	@-${MV} ${OBJECTDIR}/main.d ${OBJECTDIR}/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/717854027/spi_clos.p1: /opt/microchip/xc8/v2.05/sources/pic18/plib/SPI/spi_clos.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/717854027" 
	@${RM} ${OBJECTDIR}/_ext/717854027/spi_clos.p1.d 
	@${RM} ${OBJECTDIR}/_ext/717854027/spi_clos.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"/opt/microchip/xc8/v2.05/pic/include" -I"/opt/microchip/xc8/v2.05/include/plib" --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/717854027/spi_clos.p1  /opt/microchip/xc8/v2.05/sources/pic18/plib/SPI/spi_clos.c 
	@-${MV} ${OBJECTDIR}/_ext/717854027/spi_clos.d ${OBJECTDIR}/_ext/717854027/spi_clos.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/717854027/spi_clos.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/717854027/spi_open.p1: /opt/microchip/xc8/v2.05/sources/pic18/plib/SPI/spi_open.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/717854027" 
	@${RM} ${OBJECTDIR}/_ext/717854027/spi_open.p1.d 
	@${RM} ${OBJECTDIR}/_ext/717854027/spi_open.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"/opt/microchip/xc8/v2.05/pic/include" -I"/opt/microchip/xc8/v2.05/include/plib" --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/717854027/spi_open.p1  /opt/microchip/xc8/v2.05/sources/pic18/plib/SPI/spi_open.c 
	@-${MV} ${OBJECTDIR}/_ext/717854027/spi_open.d ${OBJECTDIR}/_ext/717854027/spi_open.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/717854027/spi_open.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/717854027/spi_read.p1: /opt/microchip/xc8/v2.05/sources/pic18/plib/SPI/spi_read.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/717854027" 
	@${RM} ${OBJECTDIR}/_ext/717854027/spi_read.p1.d 
	@${RM} ${OBJECTDIR}/_ext/717854027/spi_read.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"/opt/microchip/xc8/v2.05/pic/include" -I"/opt/microchip/xc8/v2.05/include/plib" --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/717854027/spi_read.p1  /opt/microchip/xc8/v2.05/sources/pic18/plib/SPI/spi_read.c 
	@-${MV} ${OBJECTDIR}/_ext/717854027/spi_read.d ${OBJECTDIR}/_ext/717854027/spi_read.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/717854027/spi_read.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/717854027/spi_writ.p1: /opt/microchip/xc8/v2.05/sources/pic18/plib/SPI/spi_writ.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/717854027" 
	@${RM} ${OBJECTDIR}/_ext/717854027/spi_writ.p1.d 
	@${RM} ${OBJECTDIR}/_ext/717854027/spi_writ.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"/opt/microchip/xc8/v2.05/pic/include" -I"/opt/microchip/xc8/v2.05/include/plib" --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/717854027/spi_writ.p1  /opt/microchip/xc8/v2.05/sources/pic18/plib/SPI/spi_writ.c 
	@-${MV} ${OBJECTDIR}/_ext/717854027/spi_writ.d ${OBJECTDIR}/_ext/717854027/spi_writ.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/717854027/spi_writ.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/PIC18FLCD5110.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G -mdist/${CND_CONF}/${IMAGE_TYPE}/PIC18FLCD5110.X.${IMAGE_TYPE}.map  -D__DEBUG=1 --debugger=pickit2  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"/opt/microchip/xc8/v2.05/pic/include" -I"/opt/microchip/xc8/v2.05/include/plib" --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     --rom=default,-7dc0-7fff --ram=default,-3f4-3ff,-fdb-fdf,-fe3-fe7,-feb-fef,-fd4-fd4,-ffd-fff  $(COMPARISON_BUILD) --memorysummary dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -odist/${CND_CONF}/${IMAGE_TYPE}/PIC18FLCD5110.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/PIC18FLCD5110.X.${IMAGE_TYPE}.hex 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/PIC18FLCD5110.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G -mdist/${CND_CONF}/${IMAGE_TYPE}/PIC18FLCD5110.X.${IMAGE_TYPE}.map  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"/opt/microchip/xc8/v2.05/pic/include" -I"/opt/microchip/xc8/v2.05/include/plib" --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     $(COMPARISON_BUILD) --memorysummary dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -odist/${CND_CONF}/${IMAGE_TYPE}/PIC18FLCD5110.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
