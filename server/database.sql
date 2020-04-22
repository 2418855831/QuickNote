CREATE DATABASE  IF NOT EXISTS `quick_note` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `quick_note`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: quick_note
-- ------------------------------------------------------
-- Server version	5.7.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add blog',7,'add_blog'),(26,'Can change blog',7,'change_blog'),(27,'Can delete blog',7,'delete_blog'),(28,'Can view blog',7,'view_blog'),(29,'Can add category',8,'add_category'),(30,'Can change category',8,'change_category'),(31,'Can delete category',8,'delete_category'),(32,'Can view category',8,'view_category');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$boz8pbB1MJ7b$6UardOAaQk2QXY8CboDEIy+iQRDJiZccIPwXdViqqGc=','2020-04-10 16:06:37.896174',1,'root','','','',1,1,'2020-03-04 05:55:50.288989'),(2,'pbkdf2_sha256$150000$wm8N57OF0Gzf$TyvXHJHg5rLzU9HiF9yVOS4VaG48p4d2BCKDUumb50E=',NULL,0,'user1.','','','',0,1,'2020-04-04 05:52:51.748315');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blog`
--

DROP TABLE IF EXISTS `blog_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `content` longtext NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `views_count` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_blog_category_id_c34d5f94_fk_blog_category_id` (`category_id`),
  CONSTRAINT `blog_blog_category_id_c34d5f94_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blog`
--

LOCK TABLES `blog_blog` WRITE;
/*!40000 ALTER TABLE `blog_blog` DISABLE KEYS */;
INSERT INTO `blog_blog` VALUES (23,'tsinghua-ucore-lab1','@[TOC](tsinghua-ucore-lab1)\n\n# 练习1\n## 练习1.1 \n> 操作系统镜像文件ucore.img是如何一步一步生成的？（需要比较详细地解释Makefile中每一条相关命令和命令参数的含义，以及说明命令导致的结果。\n\n### ucore.img的生成过程\n1. 编译`libs`和`kern`目录下的.c和.S文件，生成.o文件，并连接得到`bin/kernel`文件\n2. 编译`boot`目录下的.c和.S文件，生成.o文件，并连接得到`bin/block.out`文件\n3. 编译`tools/sign.c`文件，得到`bin/sign`文件\n4. 利用`bin/sign`工具将`bin/bootblock.out`文件转换为512字节的`bin/bootblock`文件，并将`bin/bootblock`的最后两个字节设置为0x55AA\n5. 为`bin/ucore.img`分配5000KB的内存空间，并将`bin/bootblock`复制到`bin/ucore.img`的第一个块里，将`bin/kernel`复制到`bin/ucore.img`的第二个块开始的位置。\n\n### kernel的生成过程\n**代码：**\n```makefile\nkernel = $(call totarget,kernel)\n\n$(kernel): tools/kernel.ld\n\n$(kernel): $(KOBJS)\n	@echo + ld $@\n	$(V)$(LD) $(LDFLAGS) -T tools/kernel.ld -o $@ $(KOBJS)\n	@$(OBJDUMP) -S $@ > $(call asmfile,kernel)\n	@$(OBJDUMP) -t $@ | $(SED) \'1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d\' > $(call symfile,kernel)\n\n$(call create_target,kernel)\n```\n\n**代码解释：**\n1. 第一行指出`kernel`的目标路径，`bin/kernel`\n2. 第三行指出`kernel`目标文件依赖`tools/kernel.ld`文件\n3. 第五行指出`kernel`目标文件依赖的obj文件，`KOBJS=obj/libs/*.o obj/kern/**/*.o`\n4. 第七行指出使用`tools/kernel.ld`脚本连接。实际执行代码为：\n```\nld -m    elf_i386 -nostdlib -T tools/kernel.ld -o bin/kernel  obj/kern/init/init.o obj/kern/libs/readline.o obj/kern/libs/stdio.o obj/kern/debug/kdebug.o obj/kern/debug/kmonitor.o obj/kern/debug/panic.o obj/kern/driver/clock.o obj/kern/driver/console.o obj/kern/driver/intr.o obj/kern/driver/picirq.o obj/kern/trap/trap.o obj/kern/trap/trapentry.o obj/kern/trap/vectors.o obj/kern/mm/pmm.o  obj/libs/printfmt.o obj/libs/string.o\n```\n5. 第八行使用objdump将bin/kernel反汇编为obj/kernel.asm，以便后续调试。实际执行代码为：\n```\nobjdump -S bin/kern > obj/kernel.asm\n```\n6. 第九行使用objdump解析bin/kernel，得到符号表文件obj/kernel.sym。实际执行代码为：\n```\nobjdump -t bin/kernel | sed \'1,/SYMBOL TABLE/d; s/ .* / /; /^$/d\' > obj/kernel.sym\n```\n\n### bootblock的生成过程\n**代码：**\n```makefile\nbootfiles = $(call listf_cc,boot)\n$(foreach f,$(bootfiles),$(call cc_compile,$(f),$(CC),$(CFLAGS) -Os -nostdinc))\n\nbootblock = $(call totarget,bootblock)\n\n$(bootblock): $(call toobj,$(bootfiles)) | $(call totarget,sign)\n	@echo + ld $@\n	$(V)$(LD) $(LDFLAGS) -N -e start -Ttext 0x7C00 $^ -o $(call toobj,bootblock)\n	@$(OBJDUMP) -S $(call objfile,bootblock) > $(call asmfile,bootblock)\n	@$(OBJCOPY) -S -O binary $(call objfile,bootblock) $(call outfile,bootblock)\n	@$(call totarget,sign) $(call outfile,bootblock) $(bootblock)\n\n$(call create_target,bootblock)\n```\n\n**代码解释：**\n1. 第一行，获取`boot`目录下的源文件（.c .S），`bootfiles=boot/*.c boot/*.S`\n2. 第二行，将`boot/*.c boot/*.S`编译成`obj/boot/*.o`\n3. 第四行，指定`bootblock`的目标路径，`bootblock=bin/bootblock`\n4. 第六行，声明`bin/bootblock`依赖于`obj/boot/*.o bin/sign`\n5. 第八行，连接所有`obj/boot/*.o`生成`obj/bootblock.o`\n6. 第九行，使用`objdump`反汇编`obj/bootblock.o`为`obj/bootblock.asm`\n7. 第十行，使用`objcopy`将`obj/bootblock.o`转换为`obj/bootblock.out`并去掉重定位和符号信息。\n8. 第十一行，使用`bin/sign`工具将`obj/bootblock.out`转换为`obj/bootblock`（使得最终的文件大小为512字节，并且以0x55AA结尾，即ELF格式）\n\n### sign工具的生成\n**sign的生成代码：**\n```makefile\n$(call add_files_host,tools/sign.c,sign,sign)\n$(call create_target_host,sign,sign)\n```\n\n**代码解释：**\n1. 第一行，设置`__objs_sign=obj/sign/tools/sign.o`\n2. 第二行，生成`bin/sign`\n\n\n### Makefile代码解释\n```makefile\n# 定义了五个变量，PROJ、EMPTY、SPACE、SLASH、V。\nPROJ	:= challenge\nEMPTY	:=\nSPACE	:= $(EMPTY) $(EMPTY)\nSLASH	:= /\n\nV       := @\n#need llvm/cang-3.5+\n#USELLVM := 1\n# try to infer the correct GCCPREFX\n\n# 如果未定义GCCPREFIX，则运行该shell脚本\n# 执行命令i386-elf-objdump -i，2>&1将标准错误重定向到标准输出\n# 通过grep查找输出的结果中是否包含开头为elf32-i386的字符串\n# 如果包含，则输出i386-elf-i赋值给GCCPREFIX\n# 如果不包含，则执行objdump -i命令（显示所有支持的架构和目标格式），并查找输出结果中是否包含elf32-i386\n# 如果包含，则输出空赋值给GCCPREFIX\n# 如果以上两种情况均不满足，则输出错误信息，并退出\nifndef GCCPREFIX\nGCCPREFIX := $(shell if i386-elf-objdump -i 2>&1 | grep \'^elf32-i386$$\' >/dev/null 2>&1; \\\n	then echo \'i386-elf-\'; \\\n	elif objdump -i 2>&1 | grep \'elf32-i386\' >/dev/null 2>&1; \\\n	then echo \'\'; \\\n	else echo \"***\" 1>&2; \\\n	echo \"*** Error: Couldn\'t find an i386-elf version of GCC/binutils.\" 1>&2; \\\n	echo \"*** Is the directory with i386-elf-gcc in your PATH?\" 1>&2; \\\n	echo \"*** If your i386-elf toolchain is installed with a command\" 1>&2; \\\n	echo \"*** prefix other than \'i386-elf-\', set your GCCPREFIX\" 1>&2; \\\n	echo \"*** environment variable to that prefix and run \'make\' again.\" 1>&2; \\\n	echo \"*** To turn off this error, run \'gmake GCCPREFIX= ...\'.\" 1>&2; \\\n	echo \"***\" 1>&2; exit 1; fi)\nendif\n\n# try to infer the correct QEMU\n# 如果未定义QEMU，则执行该shell命令\n# 查询qemu-system-i386的路径\n# 如果存在，则QEMU被赋值为qemu-system-i386\n# 如果不存在，则查询i386-elf-qemu\n# 如果存在，则QEMU被赋值为i386-elf-qemu\n# 否则，输出错误信息\nifndef QEMU\nQEMU := $(shell if which qemu-system-i386 > /dev/null; \\\n	then echo \'qemu-system-i386\'; exit; \\\n	elif which i386-elf-qemu > /dev/null; \\\n	then echo \'i386-elf-qemu\'; exit; \\\n	elif which qemu > /dev/null; \\\n	then echo \'qemu\'; exit; \\\n	else \\\n	echo \"***\" 1>&2; \\\n	echo \"*** Error: Couldn\'t find a working QEMU executable.\" 1>&2; \\\n	echo \"*** Is the directory containing the qemu binary in your PATH\" 1>&2; \\\n	echo \"***\" 1>&2; exit 1; fi)\nendif\n\n# eliminate default suffix rules\n.SUFFIXES: .c .S .h\n\n# delete target files if there is an error (or make is interrupted)\n.DELETE_ON_ERROR:\n\n# define compiler and flags\nifndef  USELLVM\n\n# HOSTCC是主机所用的编译器\nHOSTCC		:= gcc\n\n# -g是为了生成符号表，以便gdb能进行调试\n# -Wall是生成警告信息\n# -O2是优化处理\nHOSTCFLAGS	:= -g -Wall -O2\n\n# CC是i386，elf32格式的编译器\nCC		:= $(GCCPREFIX)gcc\n\n# -fno-builtin: 不接收不以__builtin_开头的内置函数\n# -Wall: 警告\n# -ggdb: 生成GDB用的调试信息\n# -m32: 编译32位程序\n# -gstabs: 此选项以stabs格式生成调试信息,但是不包括gdb扩展调试信息\n# -nostdinc: 不搜索标准头文件目录，仅搜索-I指定的目录\nCFLAGS	:= -march=i686 -fno-builtin -fno-PIC -Wall -ggdb -m32 -gstabs -nostdinc $(DEFS)\n\n# 如果 -fno-stack-protector 存在，则开启 -fno-stack-protector\n# -fstack-protector: 生成额外的代码检查缓冲区溢出\n# -E: 仅进行预处理\n# -x c: 指定编程语言为c语言\nCFLAGS	+= $(shell $(CC) -fno-stack-protector -E -x c /dev/null >/dev/null 2>&1 && echo -fno-stack-protector)\nelse\nHOSTCC		:= clang\nHOSTCFLAGS	:= -g -Wall -O2\nCC		:= clang\nCFLAGS	:= -march=i686 -fno-builtin -fno-PIC -Wall -g -m32 -nostdinc $(DEFS)\nCFLAGS	+= $(shell $(CC) -fno-stack-protector -E -x c /dev/null >/dev/null 2>&1 && echo -fno-stack-protector)\nendif\n\n# 源文件类型为c或者S\nCTYPE	:= c S\n\n# ld: 连接器\nLD      := $(GCCPREFIX)ld\n\n# -m: 使用模拟器\n# -V: 查看所有连接器支持的模拟器\n# head -n 1: 取第一行\n# -nostdlib: 不连接标准库\nLDFLAGS	:= -m $(shell $(LD) -V | grep elf_i386 2>/dev/null | head -n 1)\nLDFLAGS	+= -nostdlib\n\nOBJCOPY := $(GCCPREFIX)objcopy\nOBJDUMP := $(GCCPREFIX)objdump\n\nCOPY	:= cp\nMKDIR   := mkdir -p\nMV		:= mv\nRM		:= rm -f\nAWK		:= awk\nSED		:= sed\nSH		:= sh\nTR		:= tr\nTOUCH	:= touch -c\n\nOBJDIR	:= obj\nBINDIR	:= bin\n\nALLOBJS	:=\nALLDEPS	:=\nTARGETS	:=\n\ninclude tools/function.mk\n\n# 列出$(1)中所有的.c和.S文件\nlistf_cc = $(call listf,$(1),$(CTYPE))\n\n# for cc\nadd_files_cc = $(call add_files,$(1),$(CC),$(CFLAGS) $(3),$(2),$(4))\ncreate_target_cc = $(call create_target,$(1),$(2),$(3),$(CC),$(CFLAGS))\n\n# for hostcc\nadd_files_host = $(call add_files,$(1),$(HOSTCC),$(HOSTCFLAGS),$(2),$(3))\ncreate_target_host = $(call create_target,$(1),$(2),$(3),$(HOSTCC),$(HOSTCFLAGS))\n\ncgtype = $(patsubst %.$(2),%.$(3),$(1))\nobjfile = $(call toobj,$(1))\nasmfile = $(call cgtype,$(call toobj,$(1)),o,asm)\noutfile = $(call cgtype,$(call toobj,$(1)),o,out)\nsymfile = $(call cgtype,$(call toobj,$(1)),o,sym)\n\n# for match pattern\nmatch = $(shell echo $(2) | $(AWK) \'{for(i=1;i<=NF;i++){if(match(\"$(1)\",\"^\"$$(i)\"$$\")){exit 1;}}}\'; echo $$?)\n\n# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n# include kernel/user\n\nINCLUDE	+= libs/\n\nCFLAGS	+= $(addprefix -I,$(INCLUDE))\n\nLIBDIR	+= libs\n\n$(call add_files_cc,$(call listf_cc,$(LIBDIR)),libs,)\n\n# -------------------------------------------------------------------\n# kernel\n\nKINCLUDE	+= kern/debug/ \\\n			   kern/driver/ \\\n			   kern/trap/ \\\n			   kern/mm/\n\nKSRCDIR		+= kern/init \\\n			   kern/libs \\\n			   kern/debug \\\n			   kern/driver \\\n			   kern/trap \\\n			   kern/mm\n\n# 给kernel的include路径加上-I\nKCFLAGS		+= $(addprefix -I,$(KINCLUDE))\n\n$(call add_files_cc,$(call listf_cc,$(KSRCDIR)),kernel,$(KCFLAGS))\n\nKOBJS	= $(call read_packet,kernel libs)\n\n# create kernel target\n# 给kernel添加上目标路径 => bin/kernel\nkernel = $(call totarget,kernel)\n\n$(kernel): tools/kernel.ld\n\n$(kernel): $(KOBJS)\n	@echo + ld $@\n	$(V)$(LD) $(LDFLAGS) -T tools/kernel.ld -o $@ $(KOBJS)\n	@$(OBJDUMP) -S $@ > $(call asmfile,kernel)\n	@$(OBJDUMP) -t $@ | $(SED) \'1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d\' > $(call symfile,kernel)\n\n$(call create_target,kernel)\n\n# -------------------------------------------------------------------\n\n# create bootblock\n# 列出boot中的.c和.S文件 => bootmain.c、bootasm.S\nbootfiles = $(call listf_cc,boot)\n$(foreach f,$(bootfiles),$(call cc_compile,$(f),$(CC),$(CFLAGS) -Os -nostdinc))\n\n# 给bootblock添加目标路径 => bin/bootblock\nbootblock = $(call totarget,bootblock)\n\n$(bootblock): $(call toobj,$(bootfiles)) | $(call totarget,sign)\n	@echo + ld $@\n	# 使用ld连接bootasm.o和bootmain.o，生成bootblock.o\n	# -N使data和text节可读可写，-e start指出入口符号为start，-Ttext 0x7C00，将代码重定位到0x7C00\n	$(V)$(LD) $(LDFLAGS) -N -e start -Ttext 0x7C00 $^ -o $(call toobj,bootblock)\n	# 使用objdump反汇编bootblock.o，生成bootblock.asm文件\n	@$(OBJDUMP) -S $(call objfile,bootblock) > $(call asmfile,bootblock)\n	# 使用objcopy将bootblock.o转换为bootblock.out，-S表示去掉重定位和符号信息，-O binary表示文件格式为二进制\n	@$(OBJCOPY) -S -O binary $(call objfile,bootblock) $(call outfile,bootblock)\n	# 使用sign工具将bootblock.out转换为bootblock文件\n	@$(call totarget,sign) $(call outfile,bootblock) $(bootblock)\n\n$(call create_target,bootblock)\n\n# -------------------------------------------------------------------\n\n# create \'sign\' tools\n$(call add_files_host,tools/sign.c,sign,sign)\n$(call create_target_host,sign,sign)\n\n# -------------------------------------------------------------------\n\n# create ucore.img\n# 为ucore.img添加目标路径 => bin/ucore.img\nUCOREIMG	:= $(call totarget,ucore.img)\n\n# dd: 转换、复制文件\n# if: 输入文件\n# of: 输出文件\n# count: 要复制的块数。（默认每个块为512字节）\n# seek: 输出到目标文件时需要跳过的块数，即从第seek块之后开始写入\n# conv=notrunc: 不截断输出文件\n# 以下命令的意思是：\n# 1.为ucore.img分配10000*512块的空间，全部置0\n# 2.将bootblock复制到ucore.img的开头处\n# 3.将kernel复制到ucore.img的第二块开始处\n$(UCOREIMG): $(kernel) $(bootblock)\n	$(V)dd if=/dev/zero of=$@ count=10000\n	$(V)dd if=$(bootblock) of=$@ conv=notrunc\n	$(V)dd if=$(kernel) of=$@ seek=1 conv=notrunc\n\n$(call create_target,ucore.img)\n\n# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n\n$(call finish_all)\n\nIGNORE_ALLDEPS	= clean \\\n				  dist-clean \\\n				  grade \\\n				  touch \\\n				  print-.+ \\\n				  handin\n\nifeq ($(call match,$(MAKECMDGOALS),$(IGNORE_ALLDEPS)),0)\n-include $(ALLDEPS)\nendif\n\n# files for grade script\n\nTARGETS: $(TARGETS)\n\n.DEFAULT_GOAL := TARGETS\n\n.PHONY: qemu qemu-nox debug debug-nox\nqemu-mon: $(UCOREIMG)\n	$(V)$(QEMU)  -no-reboot -monitor stdio -hda $< -serial null\nqemu: $(UCOREIMG)\n	$(V)$(QEMU) -no-reboot -parallel stdio -hda $< -serial null\nlog: $(UCOREIMG)\n	$(V)$(QEMU) -no-reboot -d int,cpu_reset  -D q.log -parallel stdio -hda $< -serial null\nqemu-nox: $(UCOREIMG)\n	$(V)$(QEMU)   -no-reboot -serial mon:stdio -hda $< -nographic\nTERMINAL        :=gnome-terminal\ndebug: $(UCOREIMG)\n	$(V)$(QEMU) -S -s -parallel stdio -hda $< -serial null &\n	$(V)sleep 2\n	$(V)$(TERMINAL) -e \"gdb -q -tui -x tools/gdbinit\"\n	\ndebug-nox: $(UCOREIMG)\n	$(V)$(QEMU) -S -s -serial mon:stdio -hda $< -nographic &\n	$(V)sleep 2\n	$(V)$(TERMINAL) -e \"gdb -q -x tools/gdbinit\"\n\n.PHONY: grade touch\n\nGRADE_GDB_IN	:= .gdb.in\nGRADE_QEMU_OUT	:= .qemu.out\nHANDIN			:= proj$(PROJ)-handin.tar.gz\n\nTOUCH_FILES		:= kern/trap/trap.c\n\nMAKEOPTS		:= --quiet --no-print-directory\n\ngrade:\n	$(V)$(MAKE) $(MAKEOPTS) clean\n	$(V)$(SH) tools/grade.sh\n\ntouch:\n	$(V)$(foreach f,$(TOUCH_FILES),$(TOUCH) $(f))\n\nprint-%:\n	@echo $($(shell echo $(patsubst print-%,%,$@) | $(TR) [a-z] [A-Z]))\n\n.PHONY: clean dist-clean handin packall tags\nclean:\n	$(V)$(RM) $(GRADE_GDB_IN) $(GRADE_QEMU_OUT) cscope* tags\n	-$(RM) -r $(OBJDIR) $(BINDIR)\n\ndist-clean: clean\n	-$(RM) $(HANDIN)\n\nhandin: packall\n	@echo Please visit http://learn.tsinghua.edu.cn and upload $(HANDIN). Thanks!\n\npackall: clean\n	@$(RM) -f $(HANDIN)\n	@tar -czf $(HANDIN) `find . -type f -o -type d | grep -v \'^\\.*$$\' | grep -vF \'$(HANDIN)\'`\n\ntags:\n	@echo TAGS ALL\n	$(V)rm -f cscope.files cscope.in.out cscope.out cscope.po.out tags\n	$(V)find . -type f -name \"*.[chS]\" >cscope.files\n	$(V)cscope -bq \n	$(V)ctags -L cscope.files\n```\n\n\n\n\n## 练习1.2 \n> 一个被系统认为是符合规范的硬盘主引导扇区的特征是什么？\n\n> 这里我们可以打开sign.c进行查看，sign工具对bootblock进行了规范化，使得其大小为512个字节，且最后两个字节为0x55,0xAA。\n\n# 练习2\n> 使用qemu执行并调试lab1中的软件：\n> 1. 从CPU加电后执行的第一条指令开始，单步跟踪BIOS的执行。\n> 2. 在初始化位置0x7c00设置实地址断点，测试断点正常。\n> 3. 从0x7c00开始跟踪代码运行，将单步跟踪反汇编得到的代码与bootasm.S和bootblock.asm进行比较。\n> 4. 自己找一个bootloader或内核中的代码位置，设置断点并进行测试。\n\n**启动qemu：**\n```\nqemu -S -s -hda bin/ucore.img -monitor stdio\n```\n\n**启动gdb：**\n```\ngdb\nset architecture i8086\ntarget remote :1234\n```\n\n**常用的gdb命令：**\n[链接](https://www.linuxidc.com/Linux/2017-01/139028.htm)\n> 1. 运行程序\n> - run(r): 运行程序\n> 2. 查看源代码\n> - list(l): 查看最近十行代码 \n> 3. 设置断点\n> - break(b): 打断点，后面接行号/函数名/*地址\n> 4. 单步调试\n> - continue(c): 运行至下一个断点\n> - next(n): 单步跟踪，不进入函数\n> - step(s): 单步跟踪，可进入函数\n> - nexti(ni): 单步跟踪一条机器指令，不进入函数\n> - stepi(si): 单步跟踪一条机器指令\n> 5. 查看运行时数据\n> - print(p): 打印数据，后面接变量名/*地址/$寄存器\n> 6. 查看内存\n> - examine(x)/nfu address\n> 	- n: 表示显示内存长度\n>   - f: 表示输出格式\n> 		- x: 十六进制\n>		- d: 十进制\n> 		- u: 十六进制无符号整型\n> 		- o: 八进制\n> 		- t: 二进制\n> 		- a: 十六进制\n> 		- c: 字符\n> 		- f: 浮点数\n> 		- i: 汇编指令\n>   - u: 表示内存单位长度\n> 		- b: 单字节\n> 		- h: 双字节\n> 		- w: 四字节\n> 		- g: 八字节\n> 7. 终止程序\n> - kill(k): 终止正在调试的程序\n> 8. 退出调试\n> - quit(q): 退出gdb\n\n# 练习3\n> 分析bootloader进入保护模式的过程\n\n**[为何开启A20，以及如何开启A20？](http://hengch.blog.163.com/blog/static/107800672009013104623747/)**\n> Intel早期的8086 CPU提供了20根地址线，能寻址的范围是0--2^20(00000h--fffffh)共1MB的内存空间，\n> 但是8086的数据处理位宽为16位，无法直接寻址1MB的内存空间，所以8086提供了段地址加偏移地址的地址转换机制。\n> 计算机的寻址结构为segment:offset，segment和offset都是16位的寄存器，最大值位0xffffh，换算成物理地址的计算方法是\n> 把segment左移四位，再加上offset，所以理论上segment:offset的寻址能力为0xffff0+0xffff=0x10ffefh，大概为1088KB，\n> 也就是说，segment:offset这种表示方法的寻址能力超过了实际的20位地址线所能表示的物理地址大小，因此当寻址超过1MB的\n> 内存时，会发生“回卷”（不会产生异常）。但下一代的基于Inter 80286 CPU的计算机系统提供了24根地址线，这样CPU的寻址\n> 能力就成了2^24=16M，同时也提供了保护模式，可以访问到1MB以上的内存了。此时如果访问1MB以上的内存，系统就不会再\n> “回卷”了，这就造成了向下不兼容。为了向下兼容（即提供“回卷”功能），于是出现了A20 Gate。\n> \n> 这个A20地址线默认是被屏蔽的（总为0），直到系统软件去打开它，这个打开它的开关就叫做A20 Gate。\n> 这样一来，在实模式中，寻址超过1MB时会被“回卷”。而在保护模式中寻址1MB以上的内存空间时，就需要将A20 Gate打开。\n> \n> 那么A20 Gate又是怎么实现的呢？\n> 早期的PC机，控制键盘有一个单独的单片机8042，现如今这个芯片已经给集成到了其它大片子中，但其功能和使用方法还是一样，\n> PC机刚刚出现A20 Gate的时候，估计实在找不到控制它的地方了，同时也不值得为这点小事增加芯片，于是工程师使用这个8042\n> 键盘控制器来控制A20 Gate，但是A20 Gate真的和键盘无关。\n>\n> 如何开启A20 Gate呢？\n> 8042键盘控制器的IO端口是0x60～0x6f，实际上IBM PC/AT使用的只有0x60和0x64两个端口（0x61、0x62和0x63用于与XT兼容\n> 目的）。8042通过这些端口给键盘控制器或键盘发送命令或读取状态。输出端口P2用于特定目的。位0（P20引脚）用于实现CPU复\n> 位操作，位1（P21引脚）用户控制A20信号线的开启与否。系统向输入缓冲（端口0x64）写入一个字节，即发送一个键盘控制器命\n> 令。可以带一个参数。参数是通过0x60端口发送的。 命令的返回值也从端口 0x60去读。\n> \n> 8042有4个寄存器：\n> - 1个8-bit长的Input buffer；Write-Only；\n> - 1个8-bit长的Output buffer； Read-Only；\n> - 1个8-bit长的Status Register；Read-Only；\n> - 1个8-bit长的Control Register；Read/Write。\n>\n>有两个端口地址：60h和64h，有关对它们的读写操作描述如下：\n> - 读60h端口，读output buffer\n> - 写60h端口，写input buffer\n> - 读64h端口，读Status Register\n> 操作Control Register，首先要向64h端口写一个命令（20h为读命令，60h为写命令），然后根据命令从60h端口读出Control\n> Register的数据或者向60h端口写入Control Register的数据（64h端口还可以接受许多其它的命令）。\n>\n> 端口的操作都是通过向64h发送命令，然后在60h进行读写的方式完成，其中本文要操作的A20 Gate被定义在Output Port的bit\n> 1上，所以有必要对Outport Port的操作及端口定义做一个说明。\n> - 读Output Port：向64h发送0d0h命令，然后从60h读取Output Port的内容\n> - 写Output Port：向64h发送0d1h命令，然后向60h写入Output Port的数据\n>\n> 打开A20 Gate的具体步骤大致如下（参考bootasm.S）：\n> - 等待8042 Input buffer为空；\n> - 发送Write 8042 Output Port （P2）命令到8042 Input buffer；\n> - 等待8042 Input buffer为空；\n> - 将8042 Output Port（P2）得到字节的第2位置1，然后写入8042 Input buffer；\n\n**如何初始化GDT表？**\n> [段描述符](https://blog.csdn.net/qq_36916179/article/details/91621947)\n> ![段描述符结构图](https://img-blog.csdnimg.cn/20190612163123572.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM2OTE2MTc5,size_16,color_FFFFFF,t_70)\n>\n> 首先，声明三个段描述符:\n> 1. 第一个为空段描述符，全部清零\n> 2. 第二个为代码段描述符，可执行可读，基地址为0，段界限为0xffffffffh，粒度为4B\n> 3. 第三个为数据段描述符，可写，基地址为0，段界限为0xfffffffffh，粒度为4B\n>\n> 其次，声明段描述符表的界限和基址，并加载到GDTR中\n> - 低16位为段界限\n> - 高16位为基地址\n\n**如何使能和进入保护模式：**\n> 1. 屏蔽中断，设置串地址增长方向为正向，将ds、es、ss清零\n> - cli: 中断允许标志位(IF)，0表示不响应可屏蔽中断\n> - cld: 方向标志位(DF)，0表示递增，1表示递减\n> 2. 开启A20\n> - cpu waiting for 8042 are not busy\n> - cpu --write 8042 output port--> 8042\'s input buffer\n> - cpu waiting for 8042 are not busy\n> - cpu --set A20 bit--> 8042\'s input buffer\n> 3. 加载全局描述符表\n> - lgdt: load global descriptor table，将数值加载到gdtr(全局描述符表寄存器)中，高32位为基地址，低16位为段界限\n> 4. 从实模式切换到保护模式\n> - cr0: 含有控制处理器操作模式和状态的系统控制标志\n> 	- PE(Protected-Mode Enable Bit): 第0位。PE=0，CPU处于实模式；PE=1，CPU处于保护模式，并使用分段机制\n> 	- PG(Paging Enable Bit): 第31位。PG=0，不启用分页机制；PG=1，启用分页机制\n\n# 练习4\n> 分析bootloader加载ELF格式的OS的过程\n>\n> 通过阅读bootmain.c，了解bootloader如何加载ELF文件。通过分析源代码和通过qemu来运行并调试bootloader&OS。\n> - bootloader如何读取硬盘扇区的？\n> - bootloader是如何加载ELF格式的OS？\n\n**bootloader如何读取硬盘扇区的？**\n> CPU使用[LBA模式](https://blog.csdn.net/cosmoslife/article/details/9029657)的PIO(Program IO)方式来访问硬盘\n> 的（即所有的IO操作是通过CPU访问硬盘的IO地址寄存器完成）。\n>\n> 读取的流程：\n> 1. 等待磁盘准备好\n> 2. 发出读取扇区的命令\n> 3. 等待磁盘准备好\n> 4. 把磁盘扇区数据读到指定内存\n\n| IO地址 | 功能 |\n| --- | --- |\n| 0x1f0 | 读数据，当0x1f7不为忙状态时，可以读。|\n| 0x1f2 | 要读写的扇区数 |\n| 0x1f3 | 若是LBA模式，则为LBA的0-7位 |\n| 0x1f4 | 若是LBA模式，则为LBA的8-15位 |\n| 0x1f5 | 若是LBA模式，则为LBA的16-23位 |\n| 0x1f6 | 第0-3位，若是LBA模式，则为LBA的24-27位；第4位，主盘为0，从盘为1 |\n| 0x1f7 | 状态和命令寄存器。操作时先给命令，再读取，如果不是忙状态就从0x1f0端口读数据 |\n\n**bootloader是如何加载ELF格式的OS？**\n> 1. 从硬盘读取第一页(4KB)到内存0x10000处\n> 2. 检查是否为ELF格式，即检查开头四个字节的magic number是否为0x7f 45 4c 4d\n> 3. 根据ELF header找到program header，然后逐个加载各个段\n> 4. 根据ELF header中的入口信息，找到内核入口，并执行\n\n\n# 练习5\n> 实现函数调用跟踪堆栈\n格式：\n```\nebp:0x00007b28 eip:0x00100992 args:0x00010094 0x00010094 0x00007b58 0x00100096\n    kern/debug/kdebug.c:305: print_stackframe+22\n```\n\n**代码：**\n```c\nvoid\nprint_stackframe(void) {\n     /* LAB1 YOUR CODE : STEP 1 */\n     /* (1) call read_ebp() to get the value of ebp. the type is (uint32_t);\n      * (2) call read_eip() to get the value of eip. the type is (uint32_t);\n      * (3) from 0 .. STACKFRAME_DEPTH\n      *    (3.1) printf value of ebp, eip\n      *    (3.2) (uint32_t)calling arguments [0..4] = the contents in address (uint32_t)ebp +2 [0..4]\n      *    (3.3) cprintf(\"\\n\");\n      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.\n      *    (3.5) popup a calling stackframe\n      *           NOTICE: the calling funciton\'s return addr eip  = ss:[ebp+4]\n      *                   the calling funciton\'s ebp = ss:[ebp]\n      */\n      uint32_t ebp;\n      uint32_t eip;\n      uint32_t* p_args;\n\n      ebp = read_ebp();\n      eip = read_eip();\n      \n      int i;\n      int j;\n      for(i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++){\n          cprintf(\"ebp:0x%08x eip:0x%08x args:\", ebp, eip);\n          p_args = (uint32_t*)ebp + 2;\n          for(j = 0; j < 4; j ++){\n            cprintf(\"0x%08x \", p_args[j]);\n          }\n          cprintf(\"\\n\");\n          print_debuginfo(eip - 1);\n          eip = *((uint32_t *)(ebp + 4));\n          ebp = *((uint32_t *)ebp);\n      }\n}\n```\n\n# 练习6\n> 完善中断初始化和处理\n\n**1. 中断描述符表（也可简称为保护模式下的中断向量表）中一个表项占多少字节？其中哪几位代表中断处理代码的入口？**\n\n> 中断描述符一个表项占8个字节，第三四个字节为段选择子，最低的两个字节和最高的两个字节构成偏移值\n\n**2. 请编程完善kern/trap/trap.c中对中断向量表进行初始化的函数idt_init。在idt_init函数中，依次对所有中断入口进行初始化。使用mmu.h中的SETGATE宏，填充idt数组内容。每个中断的入口由tools/vectors.c生成，使用trap.c中声明的vectors数组即可。**\n```c\nvoid\nidt_init(void) {\n     /* LAB1 YOUR CODE : STEP 2 */\n     /* (1) Where are the entry addrs of each Interrupt Service Routine (ISR)?\n      *     All ISR\'s entry a\n      extern uintptr_t __vectors[];ddrs are stored in __vectors. where is uintptr_t __vectors[] ?\n      *     __vectors[] is in kern/trap/vector.S which is produced by tools/vector.c\n      *     (try \"make\" command in lab1, then you will find vector.S in kern/trap DIR)\n      *     You can use  \"extern uintptr_t __vectors[];\" to define this extern variable which will be used later.\n      * (2) Now you should setup the entries of ISR in Interrupt Description Table (IDT).\n      *     Can you see idt[256] in this file? Yes, it\'s IDT! you can use SETGATE macro to setup each item of IDT\n      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using \'lidt\' instruction.\n      *     You don\'t know the meaning of this instruction? just google it! and check the libs/x86.h to know more.\n      *     Notice: the argument of lidt is idt_pd. try to find it!\n      */\n\n      // uintptr_t __vectors[] is defined in vectors.S, so we refer to it using the keyword \'extern\'.\n      extern uintptr_t __vectors[];\n      // the length of IDT.\n      const uint32_t length = sizeof(idt) / sizeof(struct gatedesc);\n      // Setup the entries of ISR in IDT.\n      uint32_t i;\n      for(i = 0; i < length; i ++){\n          SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);\n      }\n      SETGATE(idt[T_SWITCH_TOK], 0, GD_KTEXT, __vectors[T_SWITCH_TOK], DPL_KERNEL);\n      // Tell the CPU where and how long is the IDT,\n      // i.e., load IDT\'s base address and limit into IDTR.\n      lidt(&idt_pd);\n}\n```\n\n**3. 请编程完善trap.c中的中断处理函数trap，在对时钟中断进行处理的部分填写trap函数中处理时钟中断的部分，使操作系统每遇到100次时钟中断后，调用print_ticks子程序，向屏幕上打印一行文字“100 ticks”。**\n```c\nstatic void\ntrap_dispatch(struct trapframe *tf) {\n    char c;\n\n    switch (tf->tf_trapno) {\n    case IRQ_OFFSET + IRQ_TIMER:\n        /* LAB1 YOUR CODE : STEP 3 */\n        /* handle the timer interrupt */\n        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c\n         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().\n         * (3) Too Simple? Yes, I think so!\n         */\n        ticks ++;\n        if (ticks % TICK_NUM == 0) {\n            print_ticks();\n        }\n        break;\n    case IRQ_OFFSET + IRQ_COM1:\n        c = cons_getc();\n        cprintf(\"serial [%03d] %c\\n\", c, c);\n        break;\n    case IRQ_OFFSET + IRQ_KBD:\n        c = cons_getc();\n        cprintf(\"kbd [%03d] %c\\n\", c, c);\n        break;\n    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.\n    case T_SWITCH_TOU:\n    case T_SWITCH_TOK:\n        panic(\"T_SWITCH_** ??\\n\");\n        break;\n    case IRQ_OFFSET + IRQ_IDE1:\n    case IRQ_OFFSET + IRQ_IDE2:\n        /* do nothing */\n        break;\n    default:\n        // in kernel, it must be a mistake\n        if ((tf->tf_cs & 3) == 0) {\n            print_trapframe(tf);\n            panic(\"unexpected trap in kernel.\\n\");\n        }\n    }\n}\n```\n\n# 扩展练习 1\n> 增加syscall，即增加一用户态函数，当内核态初始化完毕后，可以从内核态返回到用户态的函数，而用户态的函数又通过系统\n> 调用得到内核态的服务。\n\n```\n当trap发生时，会在栈上保存相应的寄存器里的信息，以便处理完trap后恢复。\n\n现在我们来分析下当特权级变化中断发生时栈的变化情况，先分析特权态到用户态的转变：\n\nint中断使得eflags、cs、eip被压栈（注意，这里ss、esp并没有被压栈，因为CPL并没有发生变化，但是之后要用上，所以这里要空出两个位置以备用）\n|            |\n|            |\n|   eflags   |\n|   cs       |\n|   eip      | <----- esp\n\n然后操作系统根据中断向量号和IDTR，查找中断向量表，找到中断例程，并跳到相应的中断例程执行。\n中断例程中又压入了错误信息和中断向量号，此时的栈看起来是这样的：\n|            |\n|            |\n|   eflags   |\n|   cs       |\n|   eip      |\n|   err      |\n|   num      | <----- esp\n\n之后，跳到中断处理的通用方法(__alltraps)中，又继续压入了其它寄存器的值：\n|            |\n|            |\n|   eflags   |\n|   cs       |\n|   eip      |\n|   err      |\n|   num      | \n|   ds       |\n|   es       |\n|   fs       |\n|   gs       |\n|   eax      |\n|   ecx      |\n|   edx      |\n|   ebx      |\n|   esp      | # 此esp没用\n|   ebp      |\n|   esi      |\n|   edi      | <----- esp\n\n接着，又压入了esp的值作为参数传递给trap函数，此时的esp指向的栈正好对应上trapframe结构体：\n|            |\n|            |\n|   eflags   |\n|   cs       |\n|   eip      |\n|   err      |\n|   num      | \n|   ds       |\n|   es       |\n|   fs       |\n|   gs       |\n|   eax      |\n|   ecx      |\n|   edx      |\n|   ebx      |\n|   esp      | # 此esp没用\n|   ebp      |\n|   esi      |\n|   edi      | <--| # tf 指向这里\n|   esp      |  --|\n\n紧接着，调用了trap函数，后面的栈的变化就不用细看了，因为我们已经得到这个trapframe结构体了。\n接下来的任务就是修改I/O特权级和段寄存器了。\n    stack                                           switchk2u\n|            |                                  |   ss       | --> USER_DS\n|            | <------------------------------- |   esp      |                                  \n|   eflags   |                                  |   eflags   | --> IOPL=3\n|   cs       |                                  |   cs       | --> USER_CS\n|   eip      |                                  |   eip      |\n|   err      |                                  |   err      |\n|   num      |                                  |   num      |\n|   ds       |                                  |   ds       | --> USER_DS\n|   es       |                                  |   es       | --> USER_DS\n|   fs       |                                  |   fs       |\n|   gs       |                                  |   gs       |\n|   eax      |                                  |   eax      |\n|   ecx      |                                  |   ecx      |\n|   edx      |                                  |   edx      |\n|   ebx      |                                  |   ebx      |\n|   esp      | # 此esp没用                       |   esp      |\n|   ebp      |                                  |   ebp      |\n|   esi      |                                  |   esi      |\n|   edi      | # tf 指向这里                |--> |   edi      |\n|   esp      | ----------------------------|  \n|   ...      |                        \n\n然后就是一路出栈，将保存在switchk2u里的内容弹出到相应的寄存器中，最后iret的时候需要注意，此时CPL=0，DPL=3，发生了切换，所以会继续弹出ss和esp。\n\n最后，movl %ebp, %esp，是将esp指向lab1_switch_to_user函数栈帧开始处，使得函数能正常的退回到上一个栈帧。\n\nint之前寄存器的状态：\neax            0x1e	30\necx            0x0	0\nedx            0x103627	1062439\nebx            0x10094	65684\nesp            0x7b90	0x7b90\nebp            0x7b98	0x7b98\nesi            0x10094	65684\nedi            0x0	0\neip            0x1001d1	0x1001d1 <lab1_switch_to_user+6>\neflags         0x206	[ PF IF ]\ncs             0x8	8\nss             0x10	16\nds             0x10	16\nes             0x10	16\nfs             0x23	35\ngs             0x23	35\n\nint之后寄存器的状态：\neax            0x1e	30\necx            0x0	0\nedx            0x103627	1062439\nebx            0x10094	65684\nesp            0x7b80	0x7b80\nebp            0x7b98	0x7b98\nesi            0x10094	65684\nedi            0x0	0\neip            0x1022c5	0x1022c5 <vector120+2>\neflags         0x6	[ PF ]\ncs             0x8	8\nss             0x10	16\nds             0x10	16\nes             0x10	16\nfs             0x23	35\ngs             0x23	35\n\niret之前寄存器的状态：\neax            0x1e	30\necx            0x0	0\nedx            0x103627	1062439\nebx            0x10094	65684\nesp            0x10f958	0x10f958 <switchk2u+56>\nebp            0x7b98	0x7b98\nesi            0x10094	65684\nedi            0x0	0\neip            0x101e9a	0x101e9a <__trapret+10>\neflags         0x2	[ ]\ncs             0x8	8\nss             0x10	16\nds             0x23	35\nes             0x23	35\nfs             0x23	35\ngs             0x23	35\n\niret之后寄存器的状态：\neax            0x1e	30\necx            0x0	0\nedx            0x103627	1062439\nebx            0x10094	65684\nesp            0x7b90	0x7b90\nebp            0x7b98	0x7b98\nesi            0x10094	65684\nedi            0x0	0\neip            0x1001d3	0x1001d3 <lab1_switch_to_user+8>\neflags         0x3206	[ PF IF #12 #13 ]\ncs             0x1b	27\nss             0x23	35\nds             0x23	35\nes             0x23	35\nfs             0x23	35\ngs             0x23	35\n```\n\n```\n刚才已经分析了从内核态到用户态的转换，现在来分析从用户态到内核态的转换，思路是差不多的。\n\nint发生时，CPL=3,DPL=0，会发生特权级的转换，所以会压入esp、ss、eflags、cs和eip。\n|   ss       |\n|   esp      |\n|   eflags   |\n|   cs       |\n|   eip      |\n|   err      |\n|   num      | <----- esp\n\n之后的步骤和前面一样\n|   ss       |\n|   esp      |\n|   eflags   |\n|   cs       |\n|   eip      |\n|   err      |\n|   num      | \n|   ds       |\n|   es       |\n|   fs       |\n|   gs       |\n|   eax      |\n|   ecx      |\n|   edx      |\n|   ebx      |\n|   esp      | # 此esp没用\n|   ebp      |\n|   esi      |\n|   edi      | <--| # tf 指向这里\n|   esp      |  --|\n\n紧接着，调用了trap函数，后面的栈的变化就不用细看了，因为我们已经得到这个trapframe结构体了。\n接下来的任务就是修改I/O特权级和段寄存器了。\n首先，esp中保存着原来的栈的位置，然后往下移动trapframe去掉ss和esp大小的内存，iret的时候没有发生特权级的切换，所以\n用不着这两个，所以不用拷贝。\n    temp                                             stack\n|   ss       |                                  |            |\n|   esp      | -------------------------------> |            |                                  \n|   eflags   | --> IOPL=0                       |            | \n|   cs       | --> KERNEL_CS                    |            | \n|   eip      |                                  |            |\n|   err      |                                  |            |\n|   num      |                                  |            |\n|   ds       | --> KERNEL_DS                    |            | \n|   es       | --> KERNEL_DS                    |            | \n|   fs       |                                  |            |\n|   gs       |                                  |            |\n|   eax      |                                  |            |\n|   ecx      |                                  |            |\n|   edx      |                                  |            |\n|   ebx      |                                  |            |\n|   esp      | # 此esp没用                       |            |\n|   ebp      |                                  |            |\n|   esi      |                                  |            |\n|   edi      | # tf 指向这里                |--> |            | <-- switchu2k\n|   esp      | ----------------------------|\n|   ...      |   \n\n然后把数据拷贝回原来的栈上，即切换之前的栈上：\n    temp                                             stack\n|   ss       |                                  |            |\n|   esp      | -------------------------------> |            |                                      \n|   eflags   | --> IOPL=0                       |   eflags   | \n|   cs       | --> KERNEL_CS                    |   cs       | \n|   eip      |                                  |   eip      |\n|   err      |                                  |   err      |\n|   num      |                                  |   num      |\n|   ds       | --> KERNEL_DS                    |   ds       | \n|   es       | --> KERNEL_DS                    |   es       | \n|   fs       |                                  |   fs       |\n|   gs       |                                  |   gs       |\n|   eax      |                                  |   eax      |\n|   ecx      |                                  |   ecx      |\n|   edx      |                                  |   edx      |\n|   ebx      |                                  |   ebx      |\n|   esp      | # 此esp没用                       |   esp      |\n|   ebp      |                                  |   ebp      |\n|   esi      |                                  |   esi      |\n|   edi      | # tf 指向这里                |--> |   edi      | <-- switchu2k\n|   esp      | ----------------------------|\n|   ...      |      \n\n最后，恢复堆栈。\n\nint之前寄存器的状态：\neax            0x1e	30\necx            0x0	0\nedx            0x103647	1062471\nebx            0x10094	65684\nesp            0x7b98	0x7b98\nebp            0x7b98	0x7b98\nesi            0x10094	65684\nedi            0x0	0\neip            0x1001da	0x1001da <lab1_switch_to_kernel+3>\neflags         0x3206	[ PF IF #12 #13 ]\ncs             0x1b	27\nss             0x23	35\nds             0x23	35\nes             0x23	35\nfs             0x23	35\ngs             0x23	35\n\nint之后寄存器的状态：\neax            0x1e	30\necx            0x0	0\nedx            0x103647	1062471\nebx            0x10094	65684\nesp            0x10fd68	0x10fd68 <stack0+1000>\nebp            0x7b98	0x7b98\nesi            0x10094	65684\nedi            0x0	0\neip            0x1022ce	0x1022ce <vector121+2>\neflags         0x3006	[ PF #12 #13 ]\ncs             0x8	8\nss             0x10	16\nds             0x23	35\nes             0x23	35\nfs             0x23	35\ngs             0x23	35\n\niret之前寄存器的状态：\neax            0x1e	30\necx            0x0	0\nedx            0x103647	1062471\nebx            0x10094	65684\nesp            0x7b8c	0x7b8c\nebp            0x7b98	0x7b98\nesi            0x10094	65684\nedi            0x0	0\neip            0x101e9a	0x101e9a <__trapret+10>\neflags         0x3002	[ #12 #13 ]\ncs             0x8	8\nss             0x10	16\nds             0x10	16\nes             0x10	16\nfs             0x23	35\ngs             0x23	35\n\niret之后寄存器的状态：\neax            0x1e	30\necx            0x0	0\nedx            0x103647	1062471\nebx            0x10094	65684\nesp            0x7b98	0x7b98\nebp            0x7b98	0x7b98\nesi            0x10094	65684\nedi            0x0	0\neip            0x1001dc	0x1001dc <lab1_switch_to_kernel+5>\neflags         0x206	[ PF IF ]\ncs             0x8	8\nss             0x10	16\nds             0x10	16\nes             0x10	16\nfs             0x23	35\ngs             0x23	35\n```\n\n```c\n// init.c\nstatic void\nlab1_switch_to_user(void) {\n    //LAB1 CHALLENGE 1 : TODO\n    asm volatile (\n        \"sub 0x8, %%esp \\n\"\n        \"int %0 \\n\"\n        \"movl %%ebp, %%esp \\n\"\n        :\n        : \"i\" (T_SWITCH_TOK)\n    );\n}\n\nstatic void\nlab1_switch_to_kernel(void) {\n    //LAB1 CHALLENGE 1 :  TODO\n    asm volatile (\n        \"int %0 \\n\"\n        \"movl %%ebp, %%esp \\n\"\n        :\n        : \"i\" (T_SWITCH_TOU))\n    );\n}\n```\n\n```c\n// trap.c\nstatic void\ntrap_dispatch(struct trapframe *tf) {\n    char c;\n\n    switch (tf->tf_trapno) {\n    case IRQ_OFFSET + IRQ_TIMER:\n        /* LAB1 YOUR CODE : STEP 3 */\n        /* handle the timer interrupt */\n        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c\n         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().\n         * (3) Too Simple? Yes, I think so!\n         */\n        ticks ++;\n        if (ticks % TICK_NUM == 0) {\n            print_ticks();\n        }\n        break;\n    case IRQ_OFFSET + IRQ_COM1:\n        c = cons_getc();\n        cprintf(\"serial [%03d] %c\\n\", c, c);\n        break;\n    case IRQ_OFFSET + IRQ_KBD:\n        c = cons_getc();\n        cprintf(\"kbd [%03d] %c\\n\", c, c);\n        break;\n    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.\n    case T_SWITCH_TOU:\n        if (tf->tf_cs != USER_CS) {\n            switchk2u = *tf;\n            switchk2u.tf_cs = USER_CS;\n            switchk2u.tf_ds = switchk2u.tf_es = switchk2u.tf_ss = USER_DS;\n            switchk2u.tf_esp = (uint32_t)tf + sizeof(struct trapframe) - 8;\n		\n            // set eflags, make sure ucore can use io under user mode.\n            // if CPL > IOPL, then cpu will generate a general protection.\n            switchk2u.tf_eflags |= FL_IOPL_MASK;\n		\n            // set temporary stack\n            // then iret will jump to the right stack\n            *((uint32_t *)tf - 1) = (uint32_t)&switchk2u;\n        }\n        break;\n    case T_SWITCH_TOK:\n        if (tf->tf_cs != KERNEL_CS) {\n            tf->tf_cs = KERNEL_CS;\n            tf->tf_ds = tf->tf_es = KERNEL_DS;\n            tf->tf_eflags &= ~FL_IOPL_MASK;\n            switchu2k = (struct trapframe *)(tf->tf_esp - (sizeof(struct trapframe) - 8));\n            memmove(switchu2k, tf, sizeof(struct trapframe) - 8);\n            *((uint32_t *)tf - 1) = (uint32_t)switchu2k;\n        }\n        break;\n    case IRQ_OFFSET + IRQ_IDE1:\n    case IRQ_OFFSET + IRQ_IDE2:\n        /* do nothing */\n        break;\n    default:\n        // in kernel, it must be a mistake\n        if ((tf->tf_cs & 3) == 0) {\n            print_trapframe(tf);\n            panic(\"unexpected trap in kernel.\\n\");\n        }\n    }\n}\n```','2020-03-03 21:55:50.288989','2020-04-11 17:12:05.189830',22,1),(24,'测试-第二篇','测试-第二篇','2020-03-03 21:55:50.288989','2020-03-19 09:19:35.393072',2,1),(25,'测试-第三篇','测试-第三篇','2020-03-03 21:55:50.288989','2020-03-16 07:46:14.085256',0,1),(26,'测试-第四篇','测试-第四篇','2020-03-03 21:55:50.288989','2020-03-16 07:46:14.085256',0,1),(27,'测试-第五篇','测试-第五篇','2020-03-03 21:55:50.288989','2020-03-16 07:46:14.085256',0,1),(28,'测试-第六篇','测试-第六篇','2020-03-03 21:55:50.288989','2020-03-16 07:46:14.085256',0,1),(29,'测试-第七篇','测试-第七篇','2020-03-03 21:55:50.288989','2020-03-16 07:46:14.085256',0,1),(30,'测试-第八篇','测试-第八篇','2020-03-03 21:55:50.288989','2020-03-17 15:17:26.764219',1,1),(31,'测试-第九篇','测试-第九篇','2020-03-03 21:55:50.288989','2020-03-16 07:46:14.085256',0,1),(32,'测试-第十篇','测试-第十篇','2020-03-03 21:55:50.288989','2020-04-04 09:49:04.466540',0,1);
/*!40000 ALTER TABLE `blog_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
INSERT INTO `blog_category` VALUES (1,'tsinghua-ucore','2020-03-03 21:55:50.288989'),(2,'web','2020-04-10 16:06:48.008989');
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-04-04 05:52:52.077848','2','user1.',1,'[{\"added\": {}}]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'blog','blog'),(8,'blog','category'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-02-25 15:44:14.714027'),(2,'auth','0001_initial','2020-02-25 15:44:16.861509'),(3,'admin','0001_initial','2020-02-25 15:44:22.294762'),(4,'admin','0002_logentry_remove_auto_add','2020-02-25 15:44:23.383724'),(5,'admin','0003_logentry_add_action_flag_choices','2020-02-25 15:44:23.419414'),(6,'contenttypes','0002_remove_content_type_name','2020-02-25 15:44:24.443762'),(7,'auth','0002_alter_permission_name_max_length','2020-02-25 15:44:25.001502'),(8,'auth','0003_alter_user_email_max_length','2020-02-25 15:44:25.576725'),(9,'auth','0004_alter_user_username_opts','2020-02-25 15:44:25.601655'),(10,'auth','0005_alter_user_last_login_null','2020-02-25 15:44:26.052526'),(11,'auth','0006_require_contenttypes_0002','2020-02-25 15:44:26.078443'),(12,'auth','0007_alter_validators_add_error_messages','2020-02-25 15:44:26.117339'),(13,'auth','0008_alter_user_username_max_length','2020-02-25 15:44:26.618668'),(14,'auth','0009_alter_user_last_name_max_length','2020-02-25 15:44:27.125745'),(15,'auth','0010_alter_group_name_max_length','2020-02-25 15:44:27.667616'),(16,'auth','0011_update_proxy_permissions','2020-02-25 15:44:27.691680'),(17,'sessions','0001_initial','2020-02-25 15:44:28.030234'),(18,'blog','0001_initial','2020-03-04 05:57:39.665795'),(19,'blog','0002_remove_blog_path','2020-03-04 16:37:00.629163'),(20,'blog','0003_auto_20200305_2114','2020-03-05 13:14:52.359637'),(21,'blog','0004_auto_20200306_1805','2020-03-06 10:05:26.402281'),(22,'blog','0005_auto_20200316_1545','2020-03-16 07:46:14.908122'),(23,'blog','0006_blog_views_count','2020-03-16 08:30:48.734250'),(24,'blog','0007_auto_20200403_2028','2020-04-03 12:28:14.001306'),(25,'blog','0008_blog_category_id','2020-04-03 14:01:21.015903'),(26,'blog','0009_auto_20200403_2203','2020-04-03 14:03:06.996597'),(27,'blog','0010_auto_20200403_2204','2020-04-03 14:04:40.611779'),(28,'blog','0011_auto_20200403_2315','2020-04-03 15:15:56.301521'),(29,'blog','0012_auto_20200403_2316','2020-04-03 15:16:11.933899');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0c7t2mmfi96s2v28chejyf3xira587mi','ZWFmZjZmMTE0YTBlZWVkODc5NjJkZmQ4ODczNjNjMmE4YjczMjgyNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZWE1NmE4ZDhmYTcxZmQyNGMxOTYwYjRlNjYzZjk5YjYyMjcxOGIyIn0=','2020-03-29 17:16:10.931448'),('4bjv51yc52pwrddd69hz1mhhzddgrdux','ZWFmZjZmMTE0YTBlZWVkODc5NjJkZmQ4ODczNjNjMmE4YjczMjgyNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZWE1NmE4ZDhmYTcxZmQyNGMxOTYwYjRlNjYzZjk5YjYyMjcxOGIyIn0=','2020-04-02 14:07:23.217299'),('4mqp36ke21niboj6wnclfk050h1knc0a','ZWFmZjZmMTE0YTBlZWVkODc5NjJkZmQ4ODczNjNjMmE4YjczMjgyNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZWE1NmE4ZDhmYTcxZmQyNGMxOTYwYjRlNjYzZjk5YjYyMjcxOGIyIn0=','2020-03-29 16:00:13.440739'),('8yqybqe4pnybfvgrtivf8evh3smjuuin','ZWFmZjZmMTE0YTBlZWVkODc5NjJkZmQ4ODczNjNjMmE4YjczMjgyNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZWE1NmE4ZDhmYTcxZmQyNGMxOTYwYjRlNjYzZjk5YjYyMjcxOGIyIn0=','2020-04-18 06:43:34.386372'),('jugyfrwp5cb1c1azxpkw5yy55x2mosfv','ZWFmZjZmMTE0YTBlZWVkODc5NjJkZmQ4ODczNjNjMmE4YjczMjgyNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZWE1NmE4ZDhmYTcxZmQyNGMxOTYwYjRlNjYzZjk5YjYyMjcxOGIyIn0=','2020-03-31 13:41:32.761013'),('kz8ad4l9vyzmoywthpyixzxcwh0hjvpc','ZWFmZjZmMTE0YTBlZWVkODc5NjJkZmQ4ODczNjNjMmE4YjczMjgyNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZWE1NmE4ZDhmYTcxZmQyNGMxOTYwYjRlNjYzZjk5YjYyMjcxOGIyIn0=','2020-04-02 13:07:38.718795'),('mctevdpd9dnpanrmn25uynf5kb6skh3a','ZWFmZjZmMTE0YTBlZWVkODc5NjJkZmQ4ODczNjNjMmE4YjczMjgyNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZWE1NmE4ZDhmYTcxZmQyNGMxOTYwYjRlNjYzZjk5YjYyMjcxOGIyIn0=','2020-04-02 10:43:19.037512'),('mkegnoutl75u0oox9z2fw4rytfc8f61d','ZWFmZjZmMTE0YTBlZWVkODc5NjJkZmQ4ODczNjNjMmE4YjczMjgyNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZWE1NmE4ZDhmYTcxZmQyNGMxOTYwYjRlNjYzZjk5YjYyMjcxOGIyIn0=','2020-04-02 13:12:09.935629'),('u9xmfhn5yzvhn9jzwuwg4z1tmfogx6d1','ZWFmZjZmMTE0YTBlZWVkODc5NjJkZmQ4ODczNjNjMmE4YjczMjgyNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZWE1NmE4ZDhmYTcxZmQyNGMxOTYwYjRlNjYzZjk5YjYyMjcxOGIyIn0=','2020-04-02 12:13:54.099555'),('vv1x4xp97vblczcwgsm17e2gfc1zu2g2','ZWFmZjZmMTE0YTBlZWVkODc5NjJkZmQ4ODczNjNjMmE4YjczMjgyNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZWE1NmE4ZDhmYTcxZmQyNGMxOTYwYjRlNjYzZjk5YjYyMjcxOGIyIn0=','2020-04-24 16:06:37.957010'),('x8i9y93lfeo9sk2s1au4uf72chkfwteo','ZWFmZjZmMTE0YTBlZWVkODc5NjJkZmQ4ODczNjNjMmE4YjczMjgyNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZWE1NmE4ZDhmYTcxZmQyNGMxOTYwYjRlNjYzZjk5YjYyMjcxOGIyIn0=','2020-03-29 17:23:57.846268'),('zbfvr4c1hfiafc12r1cyr032dlgkatv3','ZWFmZjZmMTE0YTBlZWVkODc5NjJkZmQ4ODczNjNjMmE4YjczMjgyNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZWE1NmE4ZDhmYTcxZmQyNGMxOTYwYjRlNjYzZjk5YjYyMjcxOGIyIn0=','2020-04-02 12:28:42.180782');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-22 13:53:12
