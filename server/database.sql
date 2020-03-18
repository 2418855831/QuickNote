-- MySQL dump 10.13  Distrib 5.7.24, for Win32 (AMD64)
--
-- Host: localhost    Database: quick_note
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add blog',7,'add_blog'),(26,'Can change blog',7,'change_blog'),(27,'Can delete blog',7,'delete_blog'),(28,'Can view blog',7,'view_blog');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$boz8pbB1MJ7b$6UardOAaQk2QXY8CboDEIy+iQRDJiZccIPwXdViqqGc=','2020-03-17 13:41:32.745058',1,'root','','','',1,1,'2020-03-04 05:55:50.288989');
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
  `author` varchar(20) NOT NULL,
  `title` varchar(30) NOT NULL,
  `content` longtext NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `views_count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blog`
--

LOCK TABLES `blog_blog` WRITE;
/*!40000 ALTER TABLE `blog_blog` DISABLE KEYS */;
INSERT INTO `blog_blog` VALUES (23,'root','tsinghua-ucore-lab1','@[TOC](tsinghua-ucore-lab1)\n\n# 缁冧範1\n## 缁冧範1.1 \n> 鎿嶄綔绯荤粺闀滃儚鏂囦欢ucore.img鏄浣曚竴姝ヤ竴姝ョ敓鎴愮殑锛燂紙闇€瑕佹瘮杈冭缁嗗湴瑙ｉ噴Makefile涓瘡涓€鏉＄浉鍏冲懡浠ゅ拰鍛戒护鍙傛暟鐨勫惈涔夛紝浠ュ強璇存槑鍛戒护瀵艰嚧鐨勭粨鏋溿€俓n\n### ucore.img鐨勭敓鎴愯繃绋媆n1. 缂栬瘧`libs`鍜宍kern`鐩綍涓嬬殑.c鍜?S鏂囦欢锛岀敓鎴?o鏂囦欢锛屽苟杩炴帴寰楀埌`bin/kernel`鏂囦欢\n2. 缂栬瘧`boot`鐩綍涓嬬殑.c鍜?S鏂囦欢锛岀敓鎴?o鏂囦欢锛屽苟杩炴帴寰楀埌`bin/block.out`鏂囦欢\n3. 缂栬瘧`tools/sign.c`鏂囦欢锛屽緱鍒癭bin/sign`鏂囦欢\n4. 鍒╃敤`bin/sign`宸ュ叿灏哷bin/bootblock.out`鏂囦欢杞崲涓?12瀛楄妭鐨刞bin/bootblock`鏂囦欢锛屽苟灏哷bin/bootblock`鐨勬渶鍚庝袱涓瓧鑺傝缃负0x55AA\n5. 涓篳bin/ucore.img`鍒嗛厤5000KB鐨勫唴瀛樼┖闂达紝骞跺皢`bin/bootblock`澶嶅埗鍒癭bin/ucore.img`鐨勭涓€涓潡閲岋紝灏哷bin/kernel`澶嶅埗鍒癭bin/ucore.img`鐨勭浜屼釜鍧楀紑濮嬬殑浣嶇疆銆俓n\n### kernel鐨勭敓鎴愯繃绋媆n**浠ｇ爜锛?*\n```makefile\nkernel = $(call totarget,kernel)\n\n$(kernel): tools/kernel.ld\n\n$(kernel): $(KOBJS)\n	@echo + ld $@\n	$(V)$(LD) $(LDFLAGS) -T tools/kernel.ld -o $@ $(KOBJS)\n	@$(OBJDUMP) -S $@ > $(call asmfile,kernel)\n	@$(OBJDUMP) -t $@ | $(SED) \'1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d\' > $(call symfile,kernel)\n\n$(call create_target,kernel)\n```\n\n**浠ｇ爜瑙ｉ噴锛?*\n1. 绗竴琛屾寚鍑篳kernel`鐨勭洰鏍囪矾寰勶紝`bin/kernel`\n2. 绗笁琛屾寚鍑篳kernel`鐩爣鏂囦欢渚濊禆`tools/kernel.ld`鏂囦欢\n3. 绗簲琛屾寚鍑篳kernel`鐩爣鏂囦欢渚濊禆鐨刼bj鏂囦欢锛宍KOBJS=obj/libs/*.o obj/kern/**/*.o`\n4. 绗竷琛屾寚鍑轰娇鐢╜tools/kernel.ld`鑴氭湰杩炴帴銆傚疄闄呮墽琛屼唬鐮佷负锛歕n```\nld -m    elf_i386 -nostdlib -T tools/kernel.ld -o bin/kernel  obj/kern/init/init.o obj/kern/libs/readline.o obj/kern/libs/stdio.o obj/kern/debug/kdebug.o obj/kern/debug/kmonitor.o obj/kern/debug/panic.o obj/kern/driver/clock.o obj/kern/driver/console.o obj/kern/driver/intr.o obj/kern/driver/picirq.o obj/kern/trap/trap.o obj/kern/trap/trapentry.o obj/kern/trap/vectors.o obj/kern/mm/pmm.o  obj/libs/printfmt.o obj/libs/string.o\n```\n5. 绗叓琛屼娇鐢╫bjdump灏哹in/kernel鍙嶆眹缂栦负obj/kernel.asm锛屼互渚垮悗缁皟璇曘€傚疄闄呮墽琛屼唬鐮佷负锛歕n```\nobjdump -S bin/kern > obj/kernel.asm\n```\n6. 绗節琛屼娇鐢╫bjdump瑙ｆ瀽bin/kernel锛屽緱鍒扮鍙疯〃鏂囦欢obj/kernel.sym銆傚疄闄呮墽琛屼唬鐮佷负锛歕n```\nobjdump -t bin/kernel | sed \'1,/SYMBOL TABLE/d; s/ .* / /; /^$/d\' > obj/kernel.sym\n```\n\n### bootblock鐨勭敓鎴愯繃绋媆n**浠ｇ爜锛?*\n```makefile\nbootfiles = $(call listf_cc,boot)\n$(foreach f,$(bootfiles),$(call cc_compile,$(f),$(CC),$(CFLAGS) -Os -nostdinc))\n\nbootblock = $(call totarget,bootblock)\n\n$(bootblock): $(call toobj,$(bootfiles)) | $(call totarget,sign)\n	@echo + ld $@\n	$(V)$(LD) $(LDFLAGS) -N -e start -Ttext 0x7C00 $^ -o $(call toobj,bootblock)\n	@$(OBJDUMP) -S $(call objfile,bootblock) > $(call asmfile,bootblock)\n	@$(OBJCOPY) -S -O binary $(call objfile,bootblock) $(call outfile,bootblock)\n	@$(call totarget,sign) $(call outfile,bootblock) $(bootblock)\n\n$(call create_target,bootblock)\n```\n\n**浠ｇ爜瑙ｉ噴锛?*\n1. 绗竴琛岋紝鑾峰彇`boot`鐩綍涓嬬殑婧愭枃浠讹紙.c .S锛夛紝`bootfiles=boot/*.c boot/*.S`\n2. 绗簩琛岋紝灏哷boot/*.c boot/*.S`缂栬瘧鎴恅obj/boot/*.o`\n3. 绗洓琛岋紝鎸囧畾`bootblock`鐨勭洰鏍囪矾寰勶紝`bootblock=bin/bootblock`\n4. 绗叚琛岋紝澹版槑`bin/bootblock`渚濊禆浜巂obj/boot/*.o bin/sign`\n5. 绗叓琛岋紝杩炴帴鎵€鏈塦obj/boot/*.o`鐢熸垚`obj/bootblock.o`\n6. 绗節琛岋紝浣跨敤`objdump`鍙嶆眹缂朻obj/bootblock.o`涓篳obj/bootblock.asm`\n7. 绗崄琛岋紝浣跨敤`objcopy`灏哷obj/bootblock.o`杞崲涓篳obj/bootblock.out`骞跺幓鎺夐噸瀹氫綅鍜岀鍙蜂俊鎭€俓n8. 绗崄涓€琛岋紝浣跨敤`bin/sign`宸ュ叿灏哷obj/bootblock.out`杞崲涓篳obj/bootblock`锛堜娇寰楁渶缁堢殑鏂囦欢澶у皬涓?12瀛楄妭锛屽苟涓斾互0x55AA缁撳熬锛屽嵆ELF鏍煎紡锛塡n\n### sign宸ュ叿鐨勭敓鎴怽n**sign鐨勭敓鎴愪唬鐮侊細**\n```makefile\n$(call add_files_host,tools/sign.c,sign,sign)\n$(call create_target_host,sign,sign)\n```\n\n**浠ｇ爜瑙ｉ噴锛?*\n1. 绗竴琛岋紝璁剧疆`__objs_sign=obj/sign/tools/sign.o`\n2. 绗簩琛岋紝鐢熸垚`bin/sign`\n\n\n### Makefile浠ｇ爜瑙ｉ噴\n```makefile\n# 瀹氫箟浜嗕簲涓彉閲忥紝PROJ銆丒MPTY銆丼PACE銆丼LASH銆乂銆俓nPROJ	:= challenge\nEMPTY	:=\nSPACE	:= $(EMPTY) $(EMPTY)\nSLASH	:= /\n\nV       := @\n#need llvm/cang-3.5+\n#USELLVM := 1\n# try to infer the correct GCCPREFX\n\n# 濡傛灉鏈畾涔塆CCPREFIX锛屽垯杩愯璇hell鑴氭湰\n# 鎵ц鍛戒护i386-elf-objdump -i锛?>&1灏嗘爣鍑嗛敊璇噸瀹氬悜鍒版爣鍑嗚緭鍑篭n# 閫氳繃grep鏌ユ壘杈撳嚭鐨勭粨鏋滀腑鏄惁鍖呭惈寮€澶翠负elf32-i386鐨勫瓧绗︿覆\n# 濡傛灉鍖呭惈锛屽垯杈撳嚭i386-elf-i璧嬪€肩粰GCCPREFIX\n# 濡傛灉涓嶅寘鍚紝鍒欐墽琛宱bjdump -i鍛戒护锛堟樉绀烘墍鏈夋敮鎸佺殑鏋舵瀯鍜岀洰鏍囨牸寮忥級锛屽苟鏌ユ壘杈撳嚭缁撴灉涓槸鍚﹀寘鍚玡lf32-i386\n# 濡傛灉鍖呭惈锛屽垯杈撳嚭绌鸿祴鍊肩粰GCCPREFIX\n# 濡傛灉浠ヤ笂涓ょ鎯呭喌鍧囦笉婊¤冻锛屽垯杈撳嚭閿欒淇℃伅锛屽苟閫€鍑篭nifndef GCCPREFIX\nGCCPREFIX := $(shell if i386-elf-objdump -i 2>&1 | grep \'^elf32-i386$$\' >/dev/null 2>&1; \\\n	then echo \'i386-elf-\'; \\\n	elif objdump -i 2>&1 | grep \'elf32-i386\' >/dev/null 2>&1; \\\n	then echo \'\'; \\\n	else echo \"***\" 1>&2; \\\n	echo \"*** Error: Couldn\'t find an i386-elf version of GCC/binutils.\" 1>&2; \\\n	echo \"*** Is the directory with i386-elf-gcc in your PATH?\" 1>&2; \\\n	echo \"*** If your i386-elf toolchain is installed with a command\" 1>&2; \\\n	echo \"*** prefix other than \'i386-elf-\', set your GCCPREFIX\" 1>&2; \\\n	echo \"*** environment variable to that prefix and run \'make\' again.\" 1>&2; \\\n	echo \"*** To turn off this error, run \'gmake GCCPREFIX= ...\'.\" 1>&2; \\\n	echo \"***\" 1>&2; exit 1; fi)\nendif\n\n# try to infer the correct QEMU\n# 濡傛灉鏈畾涔塓EMU锛屽垯鎵ц璇hell鍛戒护\n# 鏌ヨqemu-system-i386鐨勮矾寰刓n# 濡傛灉瀛樺湪锛屽垯QEMU琚祴鍊间负qemu-system-i386\n# 濡傛灉涓嶅瓨鍦紝鍒欐煡璇386-elf-qemu\n# 濡傛灉瀛樺湪锛屽垯QEMU琚祴鍊间负i386-elf-qemu\n# 鍚﹀垯锛岃緭鍑洪敊璇俊鎭痋nifndef QEMU\nQEMU := $(shell if which qemu-system-i386 > /dev/null; \\\n	then echo \'qemu-system-i386\'; exit; \\\n	elif which i386-elf-qemu > /dev/null; \\\n	then echo \'i386-elf-qemu\'; exit; \\\n	elif which qemu > /dev/null; \\\n	then echo \'qemu\'; exit; \\\n	else \\\n	echo \"***\" 1>&2; \\\n	echo \"*** Error: Couldn\'t find a working QEMU executable.\" 1>&2; \\\n	echo \"*** Is the directory containing the qemu binary in your PATH\" 1>&2; \\\n	echo \"***\" 1>&2; exit 1; fi)\nendif\n\n# eliminate default suffix rules\n.SUFFIXES: .c .S .h\n\n# delete target files if there is an error (or make is interrupted)\n.DELETE_ON_ERROR:\n\n# define compiler and flags\nifndef  USELLVM\n\n# HOSTCC鏄富鏈烘墍鐢ㄧ殑缂栬瘧鍣╘nHOSTCC		:= gcc\n\n# -g鏄负浜嗙敓鎴愮鍙疯〃锛屼互渚縢db鑳借繘琛岃皟璇昞n# -Wall鏄敓鎴愯鍛婁俊鎭痋n# -O2鏄紭鍖栧鐞哱nHOSTCFLAGS	:= -g -Wall -O2\n\n# CC鏄痠386锛宔lf32鏍煎紡鐨勭紪璇戝櫒\nCC		:= $(GCCPREFIX)gcc\n\n# -fno-builtin: 涓嶆帴鏀朵笉浠_builtin_寮€澶寸殑鍐呯疆鍑芥暟\n# -Wall: 璀﹀憡\n# -ggdb: 鐢熸垚GDB鐢ㄧ殑璋冭瘯淇℃伅\n# -m32: 缂栬瘧32浣嶇▼搴廫n# -gstabs: 姝ら€夐」浠tabs鏍煎紡鐢熸垚璋冭瘯淇℃伅,浣嗘槸涓嶅寘鎷琯db鎵╁睍璋冭瘯淇℃伅\n# -nostdinc: 涓嶆悳绱㈡爣鍑嗗ご鏂囦欢鐩綍锛屼粎鎼滅储-I鎸囧畾鐨勭洰褰昞nCFLAGS	:= -march=i686 -fno-builtin -fno-PIC -Wall -ggdb -m32 -gstabs -nostdinc $(DEFS)\n\n# 濡傛灉 -fno-stack-protector 瀛樺湪锛屽垯寮€鍚?-fno-stack-protector\n# -fstack-protector: 鐢熸垚棰濆鐨勪唬鐮佹鏌ョ紦鍐插尯婧㈠嚭\n# -E: 浠呰繘琛岄澶勭悊\n# -x c: 鎸囧畾缂栫▼璇█涓篶璇█\nCFLAGS	+= $(shell $(CC) -fno-stack-protector -E -x c /dev/null >/dev/null 2>&1 && echo -fno-stack-protector)\nelse\nHOSTCC		:= clang\nHOSTCFLAGS	:= -g -Wall -O2\nCC		:= clang\nCFLAGS	:= -march=i686 -fno-builtin -fno-PIC -Wall -g -m32 -nostdinc $(DEFS)\nCFLAGS	+= $(shell $(CC) -fno-stack-protector -E -x c /dev/null >/dev/null 2>&1 && echo -fno-stack-protector)\nendif\n\n# 婧愭枃浠剁被鍨嬩负c鎴栬€匰\nCTYPE	:= c S\n\n# ld: 杩炴帴鍣╘nLD      := $(GCCPREFIX)ld\n\n# -m: 浣跨敤妯℃嫙鍣╘n# -V: 鏌ョ湅鎵€鏈夎繛鎺ュ櫒鏀寔鐨勬ā鎷熷櫒\n# head -n 1: 鍙栫涓€琛孿n# -nostdlib: 涓嶈繛鎺ユ爣鍑嗗簱\nLDFLAGS	:= -m $(shell $(LD) -V | grep elf_i386 2>/dev/null | head -n 1)\nLDFLAGS	+= -nostdlib\n\nOBJCOPY := $(GCCPREFIX)objcopy\nOBJDUMP := $(GCCPREFIX)objdump\n\nCOPY	:= cp\nMKDIR   := mkdir -p\nMV		:= mv\nRM		:= rm -f\nAWK		:= awk\nSED		:= sed\nSH		:= sh\nTR		:= tr\nTOUCH	:= touch -c\n\nOBJDIR	:= obj\nBINDIR	:= bin\n\nALLOBJS	:=\nALLDEPS	:=\nTARGETS	:=\n\ninclude tools/function.mk\n\n# 鍒楀嚭$(1)涓墍鏈夌殑.c鍜?S鏂囦欢\nlistf_cc = $(call listf,$(1),$(CTYPE))\n\n# for cc\nadd_files_cc = $(call add_files,$(1),$(CC),$(CFLAGS) $(3),$(2),$(4))\ncreate_target_cc = $(call create_target,$(1),$(2),$(3),$(CC),$(CFLAGS))\n\n# for hostcc\nadd_files_host = $(call add_files,$(1),$(HOSTCC),$(HOSTCFLAGS),$(2),$(3))\ncreate_target_host = $(call create_target,$(1),$(2),$(3),$(HOSTCC),$(HOSTCFLAGS))\n\ncgtype = $(patsubst %.$(2),%.$(3),$(1))\nobjfile = $(call toobj,$(1))\nasmfile = $(call cgtype,$(call toobj,$(1)),o,asm)\noutfile = $(call cgtype,$(call toobj,$(1)),o,out)\nsymfile = $(call cgtype,$(call toobj,$(1)),o,sym)\n\n# for match pattern\nmatch = $(shell echo $(2) | $(AWK) \'{for(i=1;i<=NF;i++){if(match(\"$(1)\",\"^\"$$(i)\"$$\")){exit 1;}}}\'; echo $$?)\n\n# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n# include kernel/user\n\nINCLUDE	+= libs/\n\nCFLAGS	+= $(addprefix -I,$(INCLUDE))\n\nLIBDIR	+= libs\n\n$(call add_files_cc,$(call listf_cc,$(LIBDIR)),libs,)\n\n# -------------------------------------------------------------------\n# kernel\n\nKINCLUDE	+= kern/debug/ \\\n			   kern/driver/ \\\n			   kern/trap/ \\\n			   kern/mm/\n\nKSRCDIR		+= kern/init \\\n			   kern/libs \\\n			   kern/debug \\\n			   kern/driver \\\n			   kern/trap \\\n			   kern/mm\n\n# 缁檏ernel鐨刬nclude璺緞鍔犱笂-I\nKCFLAGS		+= $(addprefix -I,$(KINCLUDE))\n\n$(call add_files_cc,$(call listf_cc,$(KSRCDIR)),kernel,$(KCFLAGS))\n\nKOBJS	= $(call read_packet,kernel libs)\n\n# create kernel target\n# 缁檏ernel娣诲姞涓婄洰鏍囪矾寰?=> bin/kernel\nkernel = $(call totarget,kernel)\n\n$(kernel): tools/kernel.ld\n\n$(kernel): $(KOBJS)\n	@echo + ld $@\n	$(V)$(LD) $(LDFLAGS) -T tools/kernel.ld -o $@ $(KOBJS)\n	@$(OBJDUMP) -S $@ > $(call asmfile,kernel)\n	@$(OBJDUMP) -t $@ | $(SED) \'1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d\' > $(call symfile,kernel)\n\n$(call create_target,kernel)\n\n# -------------------------------------------------------------------\n\n# create bootblock\n# 鍒楀嚭boot涓殑.c鍜?S鏂囦欢 => bootmain.c銆乥ootasm.S\nbootfiles = $(call listf_cc,boot)\n$(foreach f,$(bootfiles),$(call cc_compile,$(f),$(CC),$(CFLAGS) -Os -nostdinc))\n\n# 缁檅ootblock娣诲姞鐩爣璺緞 => bin/bootblock\nbootblock = $(call totarget,bootblock)\n\n$(bootblock): $(call toobj,$(bootfiles)) | $(call totarget,sign)\n	@echo + ld $@\n	# 浣跨敤ld杩炴帴bootasm.o鍜宐ootmain.o锛岀敓鎴恇ootblock.o\n	# -N浣縟ata鍜宼ext鑺傚彲璇诲彲鍐欙紝-e start鎸囧嚭鍏ュ彛绗﹀彿涓簊tart锛?Ttext 0x7C00锛屽皢浠ｇ爜閲嶅畾浣嶅埌0x7C00\n	$(V)$(LD) $(LDFLAGS) -N -e start -Ttext 0x7C00 $^ -o $(call toobj,bootblock)\n	# 浣跨敤objdump鍙嶆眹缂朾ootblock.o锛岀敓鎴恇ootblock.asm鏂囦欢\n	@$(OBJDUMP) -S $(call objfile,bootblock) > $(call asmfile,bootblock)\n	# 浣跨敤objcopy灏哹ootblock.o杞崲涓篵ootblock.out锛?S琛ㄧず鍘绘帀閲嶅畾浣嶅拰绗﹀彿淇℃伅锛?O binary琛ㄧず鏂囦欢鏍煎紡涓轰簩杩涘埗\n	@$(OBJCOPY) -S -O binary $(call objfile,bootblock) $(call outfile,bootblock)\n	# 浣跨敤sign宸ュ叿灏哹ootblock.out杞崲涓篵ootblock鏂囦欢\n	@$(call totarget,sign) $(call outfile,bootblock) $(bootblock)\n\n$(call create_target,bootblock)\n\n# -------------------------------------------------------------------\n\n# create \'sign\' tools\n$(call add_files_host,tools/sign.c,sign,sign)\n$(call create_target_host,sign,sign)\n\n# -------------------------------------------------------------------\n\n# create ucore.img\n# 涓簎core.img娣诲姞鐩爣璺緞 => bin/ucore.img\nUCOREIMG	:= $(call totarget,ucore.img)\n\n# dd: 杞崲銆佸鍒舵枃浠禱n# if: 杈撳叆鏂囦欢\n# of: 杈撳嚭鏂囦欢\n# count: 瑕佸鍒剁殑鍧楁暟銆傦紙榛樿姣忎釜鍧椾负512瀛楄妭锛塡n# seek: 杈撳嚭鍒扮洰鏍囨枃浠舵椂闇€瑕佽烦杩囩殑鍧楁暟锛屽嵆浠庣seek鍧椾箣鍚庡紑濮嬪啓鍏n# conv=notrunc: 涓嶆埅鏂緭鍑烘枃浠禱n# 浠ヤ笅鍛戒护鐨勬剰鎬濇槸锛歕n# 1.涓簎core.img鍒嗛厤10000*512鍧楃殑绌洪棿锛屽叏閮ㄧ疆0\n# 2.灏哹ootblock澶嶅埗鍒皍core.img鐨勫紑澶村\n# 3.灏唊ernel澶嶅埗鍒皍core.img鐨勭浜屽潡寮€濮嬪\n$(UCOREIMG): $(kernel) $(bootblock)\n	$(V)dd if=/dev/zero of=$@ count=10000\n	$(V)dd if=$(bootblock) of=$@ conv=notrunc\n	$(V)dd if=$(kernel) of=$@ seek=1 conv=notrunc\n\n$(call create_target,ucore.img)\n\n# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n\n$(call finish_all)\n\nIGNORE_ALLDEPS	= clean \\\n				  dist-clean \\\n				  grade \\\n				  touch \\\n				  print-.+ \\\n				  handin\n\nifeq ($(call match,$(MAKECMDGOALS),$(IGNORE_ALLDEPS)),0)\n-include $(ALLDEPS)\nendif\n\n# files for grade script\n\nTARGETS: $(TARGETS)\n\n.DEFAULT_GOAL := TARGETS\n\n.PHONY: qemu qemu-nox debug debug-nox\nqemu-mon: $(UCOREIMG)\n	$(V)$(QEMU)  -no-reboot -monitor stdio -hda $< -serial null\nqemu: $(UCOREIMG)\n	$(V)$(QEMU) -no-reboot -parallel stdio -hda $< -serial null\nlog: $(UCOREIMG)\n	$(V)$(QEMU) -no-reboot -d int,cpu_reset  -D q.log -parallel stdio -hda $< -serial null\nqemu-nox: $(UCOREIMG)\n	$(V)$(QEMU)   -no-reboot -serial mon:stdio -hda $< -nographic\nTERMINAL        :=gnome-terminal\ndebug: $(UCOREIMG)\n	$(V)$(QEMU) -S -s -parallel stdio -hda $< -serial null &\n	$(V)sleep 2\n	$(V)$(TERMINAL) -e \"gdb -q -tui -x tools/gdbinit\"\n	\ndebug-nox: $(UCOREIMG)\n	$(V)$(QEMU) -S -s -serial mon:stdio -hda $< -nographic &\n	$(V)sleep 2\n	$(V)$(TERMINAL) -e \"gdb -q -x tools/gdbinit\"\n\n.PHONY: grade touch\n\nGRADE_GDB_IN	:= .gdb.in\nGRADE_QEMU_OUT	:= .qemu.out\nHANDIN			:= proj$(PROJ)-handin.tar.gz\n\nTOUCH_FILES		:= kern/trap/trap.c\n\nMAKEOPTS		:= --quiet --no-print-directory\n\ngrade:\n	$(V)$(MAKE) $(MAKEOPTS) clean\n	$(V)$(SH) tools/grade.sh\n\ntouch:\n	$(V)$(foreach f,$(TOUCH_FILES),$(TOUCH) $(f))\n\nprint-%:\n	@echo $($(shell echo $(patsubst print-%,%,$@) | $(TR) [a-z] [A-Z]))\n\n.PHONY: clean dist-clean handin packall tags\nclean:\n	$(V)$(RM) $(GRADE_GDB_IN) $(GRADE_QEMU_OUT) cscope* tags\n	-$(RM) -r $(OBJDIR) $(BINDIR)\n\ndist-clean: clean\n	-$(RM) $(HANDIN)\n\nhandin: packall\n	@echo Please visit http://learn.tsinghua.edu.cn and upload $(HANDIN). Thanks!\n\npackall: clean\n	@$(RM) -f $(HANDIN)\n	@tar -czf $(HANDIN) `find . -type f -o -type d | grep -v \'^\\.*$$\' | grep -vF \'$(HANDIN)\'`\n\ntags:\n	@echo TAGS ALL\n	$(V)rm -f cscope.files cscope.in.out cscope.out cscope.po.out tags\n	$(V)find . -type f -name \"*.[chS]\" >cscope.files\n	$(V)cscope -bq \n	$(V)ctags -L cscope.files\n```\n\n\n\n\n## 缁冧範1.2 \n> 涓€涓绯荤粺璁や负鏄鍚堣鑼冪殑纭洏涓诲紩瀵兼墖鍖虹殑鐗瑰緛鏄粈涔堬紵\n\n> 杩欓噷鎴戜滑鍙互鎵撳紑sign.c杩涜鏌ョ湅锛宻ign宸ュ叿瀵筨ootblock杩涜浜嗚鑼冨寲锛屼娇寰楀叾澶у皬涓?12涓瓧鑺傦紝涓旀渶鍚庝袱涓瓧鑺備负0x55,0xAA銆俓n\n# 缁冧範2\n> 浣跨敤qemu鎵ц骞惰皟璇昹ab1涓殑杞欢锛歕n> 1. 浠嶤PU鍔犵數鍚庢墽琛岀殑绗竴鏉℃寚浠ゅ紑濮嬶紝鍗曟璺熻釜BIOS鐨勬墽琛屻€俓n> 2. 鍦ㄥ垵濮嬪寲浣嶇疆0x7c00璁剧疆瀹炲湴鍧€鏂偣锛屾祴璇曟柇鐐规甯搞€俓n> 3. 浠?x7c00寮€濮嬭窡韪唬鐮佽繍琛岋紝灏嗗崟姝ヨ窡韪弽姹囩紪寰楀埌鐨勪唬鐮佷笌bootasm.S鍜宐ootblock.asm杩涜姣旇緝銆俓n> 4. 鑷繁鎵句竴涓猙ootloader鎴栧唴鏍镐腑鐨勪唬鐮佷綅缃紝璁剧疆鏂偣骞惰繘琛屾祴璇曘€俓n\n**鍚姩qemu锛?*\n```\nqemu -S -s -hda bin/ucore.img -monitor stdio\n```\n\n**鍚姩gdb锛?*\n```\ngdb\nset architecture i8086\ntarget remote :1234\n```\n\n**甯哥敤鐨刧db鍛戒护锛?*\n[閾炬帴](https://www.linuxidc.com/Linux/2017-01/139028.htm)\n> 1. 杩愯绋嬪簭\n> - run(r): 杩愯绋嬪簭\n> 2. 鏌ョ湅婧愪唬鐮乗n> - list(l): 鏌ョ湅鏈€杩戝崄琛屼唬鐮?\n> 3. 璁剧疆鏂偣\n> - break(b): 鎵撴柇鐐癸紝鍚庨潰鎺ヨ鍙?鍑芥暟鍚?*鍦板潃\n> 4. 鍗曟璋冭瘯\n> - continue(c): 杩愯鑷充笅涓€涓柇鐐筡n> - next(n): 鍗曟璺熻釜锛屼笉杩涘叆鍑芥暟\n> - step(s): 鍗曟璺熻釜锛屽彲杩涘叆鍑芥暟\n> - nexti(ni): 鍗曟璺熻釜涓€鏉℃満鍣ㄦ寚浠わ紝涓嶈繘鍏ュ嚱鏁癨n> - stepi(si): 鍗曟璺熻釜涓€鏉℃満鍣ㄦ寚浠n> 5. 鏌ョ湅杩愯鏃舵暟鎹甛n> - print(p): 鎵撳嵃鏁版嵁锛屽悗闈㈡帴鍙橀噺鍚?*鍦板潃/$瀵勫瓨鍣╘n> 6. 鏌ョ湅鍐呭瓨\n> - examine(x)/nfu address\n> 	- n: 琛ㄧず鏄剧ず鍐呭瓨闀垮害\n>   - f: 琛ㄧず杈撳嚭鏍煎紡\n> 		- x: 鍗佸叚杩涘埗\n>		- d: 鍗佽繘鍒禱n> 		- u: 鍗佸叚杩涘埗鏃犵鍙锋暣鍨媆n> 		- o: 鍏繘鍒禱n> 		- t: 浜岃繘鍒禱n> 		- a: 鍗佸叚杩涘埗\n> 		- c: 瀛楃\n> 		- f: 娴偣鏁癨n> 		- i: 姹囩紪鎸囦护\n>   - u: 琛ㄧず鍐呭瓨鍗曚綅闀垮害\n> 		- b: 鍗曞瓧鑺俓n> 		- h: 鍙屽瓧鑺俓n> 		- w: 鍥涘瓧鑺俓n> 		- g: 鍏瓧鑺俓n> 7. 缁堟绋嬪簭\n> - kill(k): 缁堟姝ｅ湪璋冭瘯鐨勭▼搴廫n> 8. 閫€鍑鸿皟璇昞n> - quit(q): 閫€鍑篻db\n\n# 缁冧範3\n> 鍒嗘瀽bootloader杩涘叆淇濇姢妯″紡鐨勮繃绋媆n\n**[涓轰綍寮€鍚疉20锛屼互鍙婂浣曞紑鍚疉20锛焆(http://hengch.blog.163.com/blog/static/107800672009013104623747/)**\n> Intel鏃╂湡鐨?086 CPU鎻愪緵浜?0鏍瑰湴鍧€绾匡紝鑳藉鍧€鐨勮寖鍥存槸0--2^20(00000h--fffffh)鍏?MB鐨勫唴瀛樼┖闂达紝\n> 浣嗘槸8086鐨勬暟鎹鐞嗕綅瀹戒负16浣嶏紝鏃犳硶鐩存帴瀵诲潃1MB鐨勫唴瀛樼┖闂达紝鎵€浠?086鎻愪緵浜嗘鍦板潃鍔犲亸绉诲湴鍧€鐨勫湴鍧€杞崲鏈哄埗銆俓n> 璁＄畻鏈虹殑瀵诲潃缁撴瀯涓簊egment:offset锛宻egment鍜宱ffset閮芥槸16浣嶇殑瀵勫瓨鍣紝鏈€澶у€间綅0xffffh锛屾崲绠楁垚鐗╃悊鍦板潃鐨勮绠楁柟娉曟槸\n> 鎶妔egment宸︾Щ鍥涗綅锛屽啀鍔犱笂offset锛屾墍浠ョ悊璁轰笂segment:offset鐨勫鍧€鑳藉姏涓?xffff0+0xffff=0x10ffefh锛屽ぇ姒備负1088KB锛孿n> 涔熷氨鏄锛宻egment:offset杩欑琛ㄧず鏂规硶鐨勫鍧€鑳藉姏瓒呰繃浜嗗疄闄呯殑20浣嶅湴鍧€绾挎墍鑳借〃绀虹殑鐗╃悊鍦板潃澶у皬锛屽洜姝ゅ綋瀵诲潃瓒呰繃1MB鐨刓n> 鍐呭瓨鏃讹紝浼氬彂鐢熲€滃洖鍗封€濓紙涓嶄細浜х敓寮傚父锛夈€備絾涓嬩竴浠ｇ殑鍩轰簬Inter 80286 CPU鐨勮绠楁満绯荤粺鎻愪緵浜?4鏍瑰湴鍧€绾匡紝杩欐牱CPU鐨勫鍧€\n> 鑳藉姏灏辨垚浜?^24=16M锛屽悓鏃朵篃鎻愪緵浜嗕繚鎶ゆā寮忥紝鍙互璁块棶鍒?MB浠ヤ笂鐨勫唴瀛樹簡銆傛鏃跺鏋滆闂?MB浠ヤ笂鐨勫唴瀛橈紝绯荤粺灏变笉浼氬啀\n> 鈥滃洖鍗封€濅簡锛岃繖灏遍€犳垚浜嗗悜涓嬩笉鍏煎銆備负浜嗗悜涓嬪吋瀹癸紙鍗虫彁渚涒€滃洖鍗封€濆姛鑳斤級锛屼簬鏄嚭鐜颁簡A20 Gate銆俓n> \n> 杩欎釜A20鍦板潃绾块粯璁ゆ槸琚睆钄界殑锛堟€讳负0锛夛紝鐩村埌绯荤粺杞欢鍘绘墦寮€瀹冿紝杩欎釜鎵撳紑瀹冪殑寮€鍏冲氨鍙仛A20 Gate銆俓n> 杩欐牱涓€鏉ワ紝鍦ㄥ疄妯″紡涓紝瀵诲潃瓒呰繃1MB鏃朵細琚€滃洖鍗封€濄€傝€屽湪淇濇姢妯″紡涓鍧€1MB浠ヤ笂鐨勫唴瀛樼┖闂存椂锛屽氨闇€瑕佸皢A20 Gate鎵撳紑銆俓n> \n> 閭ｄ箞A20 Gate鍙堟槸鎬庝箞瀹炵幇鐨勫憿锛焅n> 鏃╂湡鐨凱C鏈猴紝鎺у埗閿洏鏈変竴涓崟鐙殑鍗曠墖鏈?042锛岀幇濡備粖杩欎釜鑺墖宸茬粡缁欓泦鎴愬埌浜嗗叾瀹冨ぇ鐗囧瓙涓紝浣嗗叾鍔熻兘鍜屼娇鐢ㄦ柟娉曡繕鏄竴鏍凤紝\n> PC鏈哄垰鍒氬嚭鐜癆20 Gate鐨勬椂鍊欙紝浼拌瀹炲湪鎵句笉鍒版帶鍒跺畠鐨勫湴鏂逛簡锛屽悓鏃朵篃涓嶅€煎緱涓鸿繖鐐瑰皬浜嬪鍔犺姱鐗囷紝浜庢槸宸ョ▼甯堜娇鐢ㄨ繖涓?042\n> 閿洏鎺у埗鍣ㄦ潵鎺у埗A20 Gate锛屼絾鏄疉20 Gate鐪熺殑鍜岄敭鐩樻棤鍏炽€俓n>\n> 濡備綍寮€鍚疉20 Gate鍛紵\n> 8042閿洏鎺у埗鍣ㄧ殑IO绔彛鏄?x60锝?x6f锛屽疄闄呬笂IBM PC/AT浣跨敤鐨勫彧鏈?x60鍜?x64涓や釜绔彛锛?x61銆?x62鍜?x63鐢ㄤ簬涓嶺T鍏煎\n> 鐩殑锛夈€?042閫氳繃杩欎簺绔彛缁欓敭鐩樻帶鍒跺櫒鎴栭敭鐩樺彂閫佸懡浠ゆ垨璇诲彇鐘舵€併€傝緭鍑虹鍙2鐢ㄤ簬鐗瑰畾鐩殑銆備綅0锛圥20寮曡剼锛夌敤浜庡疄鐜癈PU澶峔n> 浣嶆搷浣滐紝浣?锛圥21寮曡剼锛夌敤鎴锋帶鍒禔20淇″彿绾跨殑寮€鍚笌鍚︺€傜郴缁熷悜杈撳叆缂撳啿锛堢鍙?x64锛夊啓鍏ヤ竴涓瓧鑺傦紝鍗冲彂閫佷竴涓敭鐩樻帶鍒跺櫒鍛絓n> 浠ゃ€傚彲浠ュ甫涓€涓弬鏁般€傚弬鏁版槸閫氳繃0x60绔彛鍙戦€佺殑銆?鍛戒护鐨勮繑鍥炲€间篃浠庣鍙?0x60鍘昏銆俓n> \n> 8042鏈?涓瘎瀛樺櫒锛歕n> - 1涓?-bit闀跨殑Input buffer锛沇rite-Only锛沑n> - 1涓?-bit闀跨殑Output buffer锛?Read-Only锛沑n> - 1涓?-bit闀跨殑Status Register锛汻ead-Only锛沑n> - 1涓?-bit闀跨殑Control Register锛汻ead/Write銆俓n>\n>鏈変袱涓鍙ｅ湴鍧€锛?0h鍜?4h锛屾湁鍏冲瀹冧滑鐨勮鍐欐搷浣滄弿杩板涓嬶細\n> - 璇?0h绔彛锛岃output buffer\n> - 鍐?0h绔彛锛屽啓input buffer\n> - 璇?4h绔彛锛岃Status Register\n> 鎿嶄綔Control Register锛岄鍏堣鍚?4h绔彛鍐欎竴涓懡浠わ紙20h涓鸿鍛戒护锛?0h涓哄啓鍛戒护锛夛紝鐒跺悗鏍规嵁鍛戒护浠?0h绔彛璇诲嚭Control\n> Register鐨勬暟鎹垨鑰呭悜60h绔彛鍐欏叆Control Register鐨勬暟鎹紙64h绔彛杩樺彲浠ユ帴鍙楄澶氬叾瀹冪殑鍛戒护锛夈€俓n>\n> 绔彛鐨勬搷浣滈兘鏄€氳繃鍚?4h鍙戦€佸懡浠わ紝鐒跺悗鍦?0h杩涜璇诲啓鐨勬柟寮忓畬鎴愶紝鍏朵腑鏈枃瑕佹搷浣滅殑A20 Gate琚畾涔夊湪Output Port鐨刡it\n> 1涓婏紝鎵€浠ユ湁蹇呰瀵筄utport Port鐨勬搷浣滃強绔彛瀹氫箟鍋氫竴涓鏄庛€俓n> - 璇籓utput Port锛氬悜64h鍙戦€?d0h鍛戒护锛岀劧鍚庝粠60h璇诲彇Output Port鐨勫唴瀹筡n> - 鍐橭utput Port锛氬悜64h鍙戦€?d1h鍛戒护锛岀劧鍚庡悜60h鍐欏叆Output Port鐨勬暟鎹甛n>\n> 鎵撳紑A20 Gate鐨勫叿浣撴楠ゅぇ鑷村涓嬶紙鍙傝€僢ootasm.S锛夛細\n> - 绛夊緟8042 Input buffer涓虹┖锛沑n> - 鍙戦€乄rite 8042 Output Port 锛圥2锛夊懡浠ゅ埌8042 Input buffer锛沑n> - 绛夊緟8042 Input buffer涓虹┖锛沑n> - 灏?042 Output Port锛圥2锛夊緱鍒板瓧鑺傜殑绗?浣嶇疆1锛岀劧鍚庡啓鍏?042 Input buffer锛沑n\n**濡備綍鍒濆鍖朑DT琛紵**\n> [娈垫弿杩扮](https://blog.csdn.net/qq_36916179/article/details/91621947)\n> ![娈垫弿杩扮缁撴瀯鍥綸(https://img-blog.csdnimg.cn/20190612163123572.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM2OTE2MTc5,size_16,color_FFFFFF,t_70)\n>\n> 棣栧厛锛屽０鏄庝笁涓鎻忚堪绗?\n> 1. 绗竴涓负绌烘鎻忚堪绗︼紝鍏ㄩ儴娓呴浂\n> 2. 绗簩涓负浠ｇ爜娈垫弿杩扮锛屽彲鎵ц鍙锛屽熀鍦板潃涓?锛屾鐣岄檺涓?xffffffffh锛岀矑搴︿负4B\n> 3. 绗笁涓负鏁版嵁娈垫弿杩扮锛屽彲鍐欙紝鍩哄湴鍧€涓?锛屾鐣岄檺涓?xfffffffffh锛岀矑搴︿负4B\n>\n> 鍏舵锛屽０鏄庢鎻忚堪绗﹁〃鐨勭晫闄愬拰鍩哄潃锛屽苟鍔犺浇鍒癎DTR涓璡n> - 浣?6浣嶄负娈电晫闄怽n> - 楂?6浣嶄负鍩哄湴鍧€\n\n**濡備綍浣胯兘鍜岃繘鍏ヤ繚鎶ゆā寮忥細**\n> 1. 灞忚斀涓柇锛岃缃覆鍦板潃澧為暱鏂瑰悜涓烘鍚戯紝灏哾s銆乪s銆乻s娓呴浂\n> - cli: 涓柇鍏佽鏍囧織浣?IF)锛?琛ㄧず涓嶅搷搴斿彲灞忚斀涓柇\n> - cld: 鏂瑰悜鏍囧織浣?DF)锛?琛ㄧず閫掑锛?琛ㄧず閫掑噺\n> 2. 寮€鍚疉20\n> - cpu waiting for 8042 are not busy\n> - cpu --write 8042 output port--> 8042\'s input buffer\n> - cpu waiting for 8042 are not busy\n> - cpu --set A20 bit--> 8042\'s input buffer\n> 3. 鍔犺浇鍏ㄥ眬鎻忚堪绗﹁〃\n> - lgdt: load global descriptor table锛屽皢鏁板€煎姞杞藉埌gdtr(鍏ㄥ眬鎻忚堪绗﹁〃瀵勫瓨鍣?涓紝楂?2浣嶄负鍩哄湴鍧€锛屼綆16浣嶄负娈电晫闄怽n> 4. 浠庡疄妯″紡鍒囨崲鍒颁繚鎶ゆā寮廫n> - cr0: 鍚湁鎺у埗澶勭悊鍣ㄦ搷浣滄ā寮忓拰鐘舵€佺殑绯荤粺鎺у埗鏍囧織\n> 	- PE(Protected-Mode Enable Bit): 绗?浣嶃€侾E=0锛孋PU澶勪簬瀹炴ā寮忥紱PE=1锛孋PU澶勪簬淇濇姢妯″紡锛屽苟浣跨敤鍒嗘鏈哄埗\n> 	- PG(Paging Enable Bit): 绗?1浣嶃€侾G=0锛屼笉鍚敤鍒嗛〉鏈哄埗锛汸G=1锛屽惎鐢ㄥ垎椤垫満鍒禱n\n# 缁冧範4\n> 鍒嗘瀽bootloader鍔犺浇ELF鏍煎紡鐨凮S鐨勮繃绋媆n>\n> 閫氳繃闃呰bootmain.c锛屼簡瑙ootloader濡備綍鍔犺浇ELF鏂囦欢銆傞€氳繃鍒嗘瀽婧愪唬鐮佸拰閫氳繃qemu鏉ヨ繍琛屽苟璋冭瘯bootloader&OS銆俓n> - bootloader濡備綍璇诲彇纭洏鎵囧尯鐨勶紵\n> - bootloader鏄浣曞姞杞紼LF鏍煎紡鐨凮S锛焅n\n**bootloader濡備綍璇诲彇纭洏鎵囧尯鐨勶紵**\n> CPU浣跨敤[LBA妯″紡](https://blog.csdn.net/cosmoslife/article/details/9029657)鐨凱IO(Program IO)鏂瑰紡鏉ヨ闂‖鐩榎n> 鐨勶紙鍗虫墍鏈夌殑IO鎿嶄綔鏄€氳繃CPU璁块棶纭洏鐨処O鍦板潃瀵勫瓨鍣ㄥ畬鎴愶級銆俓n>\n> 璇诲彇鐨勬祦绋嬶細\n> 1. 绛夊緟纾佺洏鍑嗗濂絓n> 2. 鍙戝嚭璇诲彇鎵囧尯鐨勫懡浠n> 3. 绛夊緟纾佺洏鍑嗗濂絓n> 4. 鎶婄鐩樻墖鍖烘暟鎹鍒版寚瀹氬唴瀛榎n\n| IO鍦板潃 | 鍔熻兘 |\n| --- | --- |\n| 0x1f0 | 璇绘暟鎹紝褰?x1f7涓嶄负蹇欑姸鎬佹椂锛屽彲浠ヨ銆倈\n| 0x1f2 | 瑕佽鍐欑殑鎵囧尯鏁?|\n| 0x1f3 | 鑻ユ槸LBA妯″紡锛屽垯涓篖BA鐨?-7浣?|\n| 0x1f4 | 鑻ユ槸LBA妯″紡锛屽垯涓篖BA鐨?-15浣?|\n| 0x1f5 | 鑻ユ槸LBA妯″紡锛屽垯涓篖BA鐨?6-23浣?|\n| 0x1f6 | 绗?-3浣嶏紝鑻ユ槸LBA妯″紡锛屽垯涓篖BA鐨?4-27浣嶏紱绗?浣嶏紝涓荤洏涓?锛屼粠鐩樹负1 |\n| 0x1f7 | 鐘舵€佸拰鍛戒护瀵勫瓨鍣ㄣ€傛搷浣滄椂鍏堢粰鍛戒护锛屽啀璇诲彇锛屽鏋滀笉鏄繖鐘舵€佸氨浠?x1f0绔彛璇绘暟鎹?|\n\n**bootloader鏄浣曞姞杞紼LF鏍煎紡鐨凮S锛?*\n> 1. 浠庣‖鐩樿鍙栫涓€椤?4KB)鍒板唴瀛?x10000澶刓n> 2. 妫€鏌ユ槸鍚︿负ELF鏍煎紡锛屽嵆妫€鏌ュ紑澶村洓涓瓧鑺傜殑magic number鏄惁涓?x7f 45 4c 4d\n> 3. 鏍规嵁ELF header鎵惧埌program header锛岀劧鍚庨€愪釜鍔犺浇鍚勪釜娈礬n> 4. 鏍规嵁ELF header涓殑鍏ュ彛淇℃伅锛屾壘鍒板唴鏍稿叆鍙ｏ紝骞舵墽琛孿n\n\n# 缁冧範5\n> 瀹炵幇鍑芥暟璋冪敤璺熻釜鍫嗘爤\n鏍煎紡锛歕n```\nebp:0x00007b28 eip:0x00100992 args:0x00010094 0x00010094 0x00007b58 0x00100096\n    kern/debug/kdebug.c:305: print_stackframe+22\n```\n\n**浠ｇ爜锛?*\n```c\nvoid\nprint_stackframe(void) {\n     /* LAB1 YOUR CODE : STEP 1 */\n     /* (1) call read_ebp() to get the value of ebp. the type is (uint32_t);\n      * (2) call read_eip() to get the value of eip. the type is (uint32_t);\n      * (3) from 0 .. STACKFRAME_DEPTH\n      *    (3.1) printf value of ebp, eip\n      *    (3.2) (uint32_t)calling arguments [0..4] = the contents in address (uint32_t)ebp +2 [0..4]\n      *    (3.3) cprintf(\"\\n\");\n      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.\n      *    (3.5) popup a calling stackframe\n      *           NOTICE: the calling funciton\'s return addr eip  = ss:[ebp+4]\n      *                   the calling funciton\'s ebp = ss:[ebp]\n      */\n      uint32_t ebp;\n      uint32_t eip;\n      uint32_t* p_args;\n\n      ebp = read_ebp();\n      eip = read_eip();\n      \n      int i;\n      int j;\n      for(i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++){\n          cprintf(\"ebp:0x%08x eip:0x%08x args:\", ebp, eip);\n          p_args = (uint32_t*)ebp + 2;\n          for(j = 0; j < 4; j ++){\n            cprintf(\"0x%08x \", p_args[j]);\n          }\n          cprintf(\"\\n\");\n          print_debuginfo(eip - 1);\n          eip = *((uint32_t *)(ebp + 4));\n          ebp = *((uint32_t *)ebp);\n      }\n}\n```\n\n# 缁冧範6\n> 瀹屽杽涓柇鍒濆鍖栧拰澶勭悊\n\n**1. 涓柇鎻忚堪绗﹁〃锛堜篃鍙畝绉颁负淇濇姢妯″紡涓嬬殑涓柇鍚戦噺琛級涓竴涓〃椤瑰崰澶氬皯瀛楄妭锛熷叾涓摢鍑犱綅浠ｈ〃涓柇澶勭悊浠ｇ爜鐨勫叆鍙ｏ紵**\n\n> 涓柇鎻忚堪绗︿竴涓〃椤瑰崰8涓瓧鑺傦紝绗笁鍥涗釜瀛楄妭涓烘閫夋嫨瀛愶紝鏈€浣庣殑涓や釜瀛楄妭鍜屾渶楂樼殑涓や釜瀛楄妭鏋勬垚鍋忕Щ鍊糪n\n**2. 璇风紪绋嬪畬鍠刱ern/trap/trap.c涓涓柇鍚戦噺琛ㄨ繘琛屽垵濮嬪寲鐨勫嚱鏁癷dt_init銆傚湪idt_init鍑芥暟涓紝渚濇瀵规墍鏈変腑鏂叆鍙ｈ繘琛屽垵濮嬪寲銆備娇鐢╩mu.h涓殑SETGATE瀹忥紝濉厖idt鏁扮粍鍐呭銆傛瘡涓腑鏂殑鍏ュ彛鐢眛ools/vectors.c鐢熸垚锛屼娇鐢╰rap.c涓０鏄庣殑vectors鏁扮粍鍗冲彲銆?*\n```c\nvoid\nidt_init(void) {\n     /* LAB1 YOUR CODE : STEP 2 */\n     /* (1) Where are the entry addrs of each Interrupt Service Routine (ISR)?\n      *     All ISR\'s entry a\n      extern uintptr_t __vectors[];ddrs are stored in __vectors. where is uintptr_t __vectors[] ?\n      *     __vectors[] is in kern/trap/vector.S which is produced by tools/vector.c\n      *     (try \"make\" command in lab1, then you will find vector.S in kern/trap DIR)\n      *     You can use  \"extern uintptr_t __vectors[];\" to define this extern variable which will be used later.\n      * (2) Now you should setup the entries of ISR in Interrupt Description Table (IDT).\n      *     Can you see idt[256] in this file? Yes, it\'s IDT! you can use SETGATE macro to setup each item of IDT\n      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using \'lidt\' instruction.\n      *     You don\'t know the meaning of this instruction? just google it! and check the libs/x86.h to know more.\n      *     Notice: the argument of lidt is idt_pd. try to find it!\n      */\n\n      // uintptr_t __vectors[] is defined in vectors.S, so we refer to it using the keyword \'extern\'.\n      extern uintptr_t __vectors[];\n      // the length of IDT.\n      const uint32_t length = sizeof(idt) / sizeof(struct gatedesc);\n      // Setup the entries of ISR in IDT.\n      uint32_t i;\n      for(i = 0; i < length; i ++){\n          SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);\n      }\n      SETGATE(idt[T_SWITCH_TOK], 0, GD_KTEXT, __vectors[T_SWITCH_TOK], DPL_KERNEL);\n      // Tell the CPU where and how long is the IDT,\n      // i.e., load IDT\'s base address and limit into IDTR.\n      lidt(&idt_pd);\n}\n```\n\n**3. 璇风紪绋嬪畬鍠則rap.c涓殑涓柇澶勭悊鍑芥暟trap锛屽湪瀵规椂閽熶腑鏂繘琛屽鐞嗙殑閮ㄥ垎濉啓trap鍑芥暟涓鐞嗘椂閽熶腑鏂殑閮ㄥ垎锛屼娇鎿嶄綔绯荤粺姣忛亣鍒?00娆℃椂閽熶腑鏂悗锛岃皟鐢╬rint_ticks瀛愮▼搴忥紝鍚戝睆骞曚笂鎵撳嵃涓€琛屾枃瀛椻€?00 ticks鈥濄€?*\n```c\nstatic void\ntrap_dispatch(struct trapframe *tf) {\n    char c;\n\n    switch (tf->tf_trapno) {\n    case IRQ_OFFSET + IRQ_TIMER:\n        /* LAB1 YOUR CODE : STEP 3 */\n        /* handle the timer interrupt */\n        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c\n         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().\n         * (3) Too Simple? Yes, I think so!\n         */\n        ticks ++;\n        if (ticks % TICK_NUM == 0) {\n            print_ticks();\n        }\n        break;\n    case IRQ_OFFSET + IRQ_COM1:\n        c = cons_getc();\n        cprintf(\"serial [%03d] %c\\n\", c, c);\n        break;\n    case IRQ_OFFSET + IRQ_KBD:\n        c = cons_getc();\n        cprintf(\"kbd [%03d] %c\\n\", c, c);\n        break;\n    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.\n    case T_SWITCH_TOU:\n    case T_SWITCH_TOK:\n        panic(\"T_SWITCH_** ??\\n\");\n        break;\n    case IRQ_OFFSET + IRQ_IDE1:\n    case IRQ_OFFSET + IRQ_IDE2:\n        /* do nothing */\n        break;\n    default:\n        // in kernel, it must be a mistake\n        if ((tf->tf_cs & 3) == 0) {\n            print_trapframe(tf);\n            panic(\"unexpected trap in kernel.\\n\");\n        }\n    }\n}\n```\n\n# 鎵╁睍缁冧範 1\n> 澧炲姞syscall锛屽嵆澧炲姞涓€鐢ㄦ埛鎬佸嚱鏁帮紝褰撳唴鏍告€佸垵濮嬪寲瀹屾瘯鍚庯紝鍙互浠庡唴鏍告€佽繑鍥炲埌鐢ㄦ埛鎬佺殑鍑芥暟锛岃€岀敤鎴锋€佺殑鍑芥暟鍙堥€氳繃绯荤粺\n> 璋冪敤寰楀埌鍐呮牳鎬佺殑鏈嶅姟銆俓n\n```\n褰搕rap鍙戠敓鏃讹紝浼氬湪鏍堜笂淇濆瓨鐩稿簲鐨勫瘎瀛樺櫒閲岀殑淇℃伅锛屼互渚垮鐞嗗畬trap鍚庢仮澶嶃€俓n\n鐜板湪鎴戜滑鏉ュ垎鏋愪笅褰撶壒鏉冪骇鍙樺寲涓柇鍙戠敓鏃舵爤鐨勫彉鍖栨儏鍐碉紝鍏堝垎鏋愮壒鏉冩€佸埌鐢ㄦ埛鎬佺殑杞彉锛歕n\nint涓柇浣垮緱eflags銆乧s銆乪ip琚帇鏍堬紙娉ㄦ剰锛岃繖閲宻s銆乪sp骞舵病鏈夎鍘嬫爤锛屽洜涓篊PL骞舵病鏈夊彂鐢熷彉鍖栵紝浣嗘槸涔嬪悗瑕佺敤涓婏紝鎵€浠ヨ繖閲岃绌哄嚭涓や釜浣嶇疆浠ュ鐢級\n|            |\n|            |\n|   eflags   |\n|   cs       |\n|   eip      | <----- esp\n\n鐒跺悗鎿嶄綔绯荤粺鏍规嵁涓柇鍚戦噺鍙峰拰IDTR锛屾煡鎵句腑鏂悜閲忚〃锛屾壘鍒颁腑鏂緥绋嬶紝骞惰烦鍒扮浉搴旂殑涓柇渚嬬▼鎵ц銆俓n涓柇渚嬬▼涓張鍘嬪叆浜嗛敊璇俊鎭拰涓柇鍚戦噺鍙凤紝姝ゆ椂鐨勬爤鐪嬭捣鏉ユ槸杩欐牱鐨勶細\n|            |\n|            |\n|   eflags   |\n|   cs       |\n|   eip      |\n|   err      |\n|   num      | <----- esp\n\n涔嬪悗锛岃烦鍒颁腑鏂鐞嗙殑閫氱敤鏂规硶(__alltraps)涓紝鍙堢户缁帇鍏ヤ簡鍏跺畠瀵勫瓨鍣ㄧ殑鍊硷細\n|            |\n|            |\n|   eflags   |\n|   cs       |\n|   eip      |\n|   err      |\n|   num      | \n|   ds       |\n|   es       |\n|   fs       |\n|   gs       |\n|   eax      |\n|   ecx      |\n|   edx      |\n|   ebx      |\n|   esp      | # 姝sp娌＄敤\n|   ebp      |\n|   esi      |\n|   edi      | <----- esp\n\n鎺ョ潃锛屽張鍘嬪叆浜唀sp鐨勫€间綔涓哄弬鏁颁紶閫掔粰trap鍑芥暟锛屾鏃剁殑esp鎸囧悜鐨勬爤姝ｅソ瀵瑰簲涓妕rapframe缁撴瀯浣擄細\n|            |\n|            |\n|   eflags   |\n|   cs       |\n|   eip      |\n|   err      |\n|   num      | \n|   ds       |\n|   es       |\n|   fs       |\n|   gs       |\n|   eax      |\n|   ecx      |\n|   edx      |\n|   ebx      |\n|   esp      | # 姝sp娌＄敤\n|   ebp      |\n|   esi      |\n|   edi      | <--| # tf 鎸囧悜杩欓噷\n|   esp      |  --|\n\n绱ф帴鐫€锛岃皟鐢ㄤ簡trap鍑芥暟锛屽悗闈㈢殑鏍堢殑鍙樺寲灏变笉鐢ㄧ粏鐪嬩簡锛屽洜涓烘垜浠凡缁忓緱鍒拌繖涓猼rapframe缁撴瀯浣撲簡銆俓n鎺ヤ笅鏉ョ殑浠诲姟灏辨槸淇敼I/O鐗规潈绾у拰娈靛瘎瀛樺櫒浜嗐€俓n    stack                                           switchk2u\n|            |                                  |   ss       | --> USER_DS\n|            | <------------------------------- |   esp      |                                  \n|   eflags   |                                  |   eflags   | --> IOPL=3\n|   cs       |                                  |   cs       | --> USER_CS\n|   eip      |                                  |   eip      |\n|   err      |                                  |   err      |\n|   num      |                                  |   num      |\n|   ds       |                                  |   ds       | --> USER_DS\n|   es       |                                  |   es       | --> USER_DS\n|   fs       |                                  |   fs       |\n|   gs       |                                  |   gs       |\n|   eax      |                                  |   eax      |\n|   ecx      |                                  |   ecx      |\n|   edx      |                                  |   edx      |\n|   ebx      |                                  |   ebx      |\n|   esp      | # 姝sp娌＄敤                       |   esp      |\n|   ebp      |                                  |   ebp      |\n|   esi      |                                  |   esi      |\n|   edi      | # tf 鎸囧悜杩欓噷                |--> |   edi      |\n|   esp      | ----------------------------|  \n|   ...      |                        \n\n鐒跺悗灏辨槸涓€璺嚭鏍堬紝灏嗕繚瀛樺湪switchk2u閲岀殑鍐呭寮瑰嚭鍒扮浉搴旂殑瀵勫瓨鍣ㄤ腑锛屾渶鍚巌ret鐨勬椂鍊欓渶瑕佹敞鎰忥紝姝ゆ椂CPL=0锛孌PL=3锛屽彂鐢熶簡鍒囨崲锛屾墍浠ヤ細缁х画寮瑰嚭ss鍜宔sp銆俓n\n鏈€鍚庯紝movl %ebp, %esp锛屾槸灏唀sp鎸囧悜lab1_switch_to_user鍑芥暟鏍堝抚寮€濮嬪锛屼娇寰楀嚱鏁拌兘姝ｅ父鐨勯€€鍥炲埌涓婁竴涓爤甯с€俓n\nint涔嬪墠瀵勫瓨鍣ㄧ殑鐘舵€侊細\neax            0x1e	30\necx            0x0	0\nedx            0x103627	1062439\nebx            0x10094	65684\nesp            0x7b90	0x7b90\nebp            0x7b98	0x7b98\nesi            0x10094	65684\nedi            0x0	0\neip            0x1001d1	0x1001d1 <lab1_switch_to_user+6>\neflags         0x206	[ PF IF ]\ncs             0x8	8\nss             0x10	16\nds             0x10	16\nes             0x10	16\nfs             0x23	35\ngs             0x23	35\n\nint涔嬪悗瀵勫瓨鍣ㄧ殑鐘舵€侊細\neax            0x1e	30\necx            0x0	0\nedx            0x103627	1062439\nebx            0x10094	65684\nesp            0x7b80	0x7b80\nebp            0x7b98	0x7b98\nesi            0x10094	65684\nedi            0x0	0\neip            0x1022c5	0x1022c5 <vector120+2>\neflags         0x6	[ PF ]\ncs             0x8	8\nss             0x10	16\nds             0x10	16\nes             0x10	16\nfs             0x23	35\ngs             0x23	35\n\niret涔嬪墠瀵勫瓨鍣ㄧ殑鐘舵€侊細\neax            0x1e	30\necx            0x0	0\nedx            0x103627	1062439\nebx            0x10094	65684\nesp            0x10f958	0x10f958 <switchk2u+56>\nebp            0x7b98	0x7b98\nesi            0x10094	65684\nedi            0x0	0\neip            0x101e9a	0x101e9a <__trapret+10>\neflags         0x2	[ ]\ncs             0x8	8\nss             0x10	16\nds             0x23	35\nes             0x23	35\nfs             0x23	35\ngs             0x23	35\n\niret涔嬪悗瀵勫瓨鍣ㄧ殑鐘舵€侊細\neax            0x1e	30\necx            0x0	0\nedx            0x103627	1062439\nebx            0x10094	65684\nesp            0x7b90	0x7b90\nebp            0x7b98	0x7b98\nesi            0x10094	65684\nedi            0x0	0\neip            0x1001d3	0x1001d3 <lab1_switch_to_user+8>\neflags         0x3206	[ PF IF #12 #13 ]\ncs             0x1b	27\nss             0x23	35\nds             0x23	35\nes             0x23	35\nfs             0x23	35\ngs             0x23	35\n```\n\n```\n鍒氭墠宸茬粡鍒嗘瀽浜嗕粠鍐呮牳鎬佸埌鐢ㄦ埛鎬佺殑杞崲锛岀幇鍦ㄦ潵鍒嗘瀽浠庣敤鎴锋€佸埌鍐呮牳鎬佺殑杞崲锛屾€濊矾鏄樊涓嶅鐨勩€俓n\nint鍙戠敓鏃讹紝CPL=3,DPL=0锛屼細鍙戠敓鐗规潈绾х殑杞崲锛屾墍浠ヤ細鍘嬪叆esp銆乻s銆乪flags銆乧s鍜宔ip銆俓n|   ss       |\n|   esp      |\n|   eflags   |\n|   cs       |\n|   eip      |\n|   err      |\n|   num      | <----- esp\n\n涔嬪悗鐨勬楠ゅ拰鍓嶉潰涓€鏍穃n|   ss       |\n|   esp      |\n|   eflags   |\n|   cs       |\n|   eip      |\n|   err      |\n|   num      | \n|   ds       |\n|   es       |\n|   fs       |\n|   gs       |\n|   eax      |\n|   ecx      |\n|   edx      |\n|   ebx      |\n|   esp      | # 姝sp娌＄敤\n|   ebp      |\n|   esi      |\n|   edi      | <--| # tf 鎸囧悜杩欓噷\n|   esp      |  --|\n\n绱ф帴鐫€锛岃皟鐢ㄤ簡trap鍑芥暟锛屽悗闈㈢殑鏍堢殑鍙樺寲灏变笉鐢ㄧ粏鐪嬩簡锛屽洜涓烘垜浠凡缁忓緱鍒拌繖涓猼rapframe缁撴瀯浣撲簡銆俓n鎺ヤ笅鏉ョ殑浠诲姟灏辨槸淇敼I/O鐗规潈绾у拰娈靛瘎瀛樺櫒浜嗐€俓n棣栧厛锛宔sp涓繚瀛樼潃鍘熸潵鐨勬爤鐨勪綅缃紝鐒跺悗寰€涓嬬Щ鍔╰rapframe鍘绘帀ss鍜宔sp澶у皬鐨勫唴瀛橈紝iret鐨勬椂鍊欐病鏈夊彂鐢熺壒鏉冪骇鐨勫垏鎹紝鎵€浠n鐢ㄤ笉鐫€杩欎袱涓紝鎵€浠ヤ笉鐢ㄦ嫹璐濄€俓n    temp                                             stack\n|   ss       |                                  |            |\n|   esp      | -------------------------------> |            |                                  \n|   eflags   | --> IOPL=0                       |            | \n|   cs       | --> KERNEL_CS                    |            | \n|   eip      |                                  |            |\n|   err      |                                  |            |\n|   num      |                                  |            |\n|   ds       | --> KERNEL_DS                    |            | \n|   es       | --> KERNEL_DS                    |            | \n|   fs       |                                  |            |\n|   gs       |                                  |            |\n|   eax      |                                  |            |\n|   ecx      |                                  |            |\n|   edx      |                                  |            |\n|   ebx      |                                  |            |\n|   esp      | # 姝sp娌＄敤                       |            |\n|   ebp      |                                  |            |\n|   esi      |                                  |            |\n|   edi      | # tf 鎸囧悜杩欓噷                |--> |            | <-- switchu2k\n|   esp      | ----------------------------|\n|   ...      |   \n\n鐒跺悗鎶婃暟鎹嫹璐濆洖鍘熸潵鐨勬爤涓婏紝鍗冲垏鎹箣鍓嶇殑鏍堜笂锛歕n    temp                                             stack\n|   ss       |                                  |            |\n|   esp      | -------------------------------> |            |                                      \n|   eflags   | --> IOPL=0                       |   eflags   | \n|   cs       | --> KERNEL_CS                    |   cs       | \n|   eip      |                                  |   eip      |\n|   err      |                                  |   err      |\n|   num      |                                  |   num      |\n|   ds       | --> KERNEL_DS                    |   ds       | \n|   es       | --> KERNEL_DS                    |   es       | \n|   fs       |                                  |   fs       |\n|   gs       |                                  |   gs       |\n|   eax      |                                  |   eax      |\n|   ecx      |                                  |   ecx      |\n|   edx      |                                  |   edx      |\n|   ebx      |                                  |   ebx      |\n|   esp      | # 姝sp娌＄敤                       |   esp      |\n|   ebp      |                                  |   ebp      |\n|   esi      |                                  |   esi      |\n|   edi      | # tf 鎸囧悜杩欓噷                |--> |   edi      | <-- switchu2k\n|   esp      | ----------------------------|\n|   ...      |      \n\n鏈€鍚庯紝鎭㈠鍫嗘爤銆俓n\nint涔嬪墠瀵勫瓨鍣ㄧ殑鐘舵€侊細\neax            0x1e	30\necx            0x0	0\nedx            0x103647	1062471\nebx            0x10094	65684\nesp            0x7b98	0x7b98\nebp            0x7b98	0x7b98\nesi            0x10094	65684\nedi            0x0	0\neip            0x1001da	0x1001da <lab1_switch_to_kernel+3>\neflags         0x3206	[ PF IF #12 #13 ]\ncs             0x1b	27\nss             0x23	35\nds             0x23	35\nes             0x23	35\nfs             0x23	35\ngs             0x23	35\n\nint涔嬪悗瀵勫瓨鍣ㄧ殑鐘舵€侊細\neax            0x1e	30\necx            0x0	0\nedx            0x103647	1062471\nebx            0x10094	65684\nesp            0x10fd68	0x10fd68 <stack0+1000>\nebp            0x7b98	0x7b98\nesi            0x10094	65684\nedi            0x0	0\neip            0x1022ce	0x1022ce <vector121+2>\neflags         0x3006	[ PF #12 #13 ]\ncs             0x8	8\nss             0x10	16\nds             0x23	35\nes             0x23	35\nfs             0x23	35\ngs             0x23	35\n\niret涔嬪墠瀵勫瓨鍣ㄧ殑鐘舵€侊細\neax            0x1e	30\necx            0x0	0\nedx            0x103647	1062471\nebx            0x10094	65684\nesp            0x7b8c	0x7b8c\nebp            0x7b98	0x7b98\nesi            0x10094	65684\nedi            0x0	0\neip            0x101e9a	0x101e9a <__trapret+10>\neflags         0x3002	[ #12 #13 ]\ncs             0x8	8\nss             0x10	16\nds             0x10	16\nes             0x10	16\nfs             0x23	35\ngs             0x23	35\n\niret涔嬪悗瀵勫瓨鍣ㄧ殑鐘舵€侊細\neax            0x1e	30\necx            0x0	0\nedx            0x103647	1062471\nebx            0x10094	65684\nesp            0x7b98	0x7b98\nebp            0x7b98	0x7b98\nesi            0x10094	65684\nedi            0x0	0\neip            0x1001dc	0x1001dc <lab1_switch_to_kernel+5>\neflags         0x206	[ PF IF ]\ncs             0x8	8\nss             0x10	16\nds             0x10	16\nes             0x10	16\nfs             0x23	35\ngs             0x23	35\n```\n\n```c\n// init.c\nstatic void\nlab1_switch_to_user(void) {\n    //LAB1 CHALLENGE 1 : TODO\n    asm volatile (\n        \"sub 0x8, %%esp \\n\"\n        \"int %0 \\n\"\n        \"movl %%ebp, %%esp \\n\"\n        :\n        : \"i\" (T_SWITCH_TOK)\n    );\n}\n\nstatic void\nlab1_switch_to_kernel(void) {\n    //LAB1 CHALLENGE 1 :  TODO\n    asm volatile (\n        \"int %0 \\n\"\n        \"movl %%ebp, %%esp \\n\"\n        :\n        : \"i\" (T_SWITCH_TOU))\n    );\n}\n```\n\n```c\n// trap.c\nstatic void\ntrap_dispatch(struct trapframe *tf) {\n    char c;\n\n    switch (tf->tf_trapno) {\n    case IRQ_OFFSET + IRQ_TIMER:\n        /* LAB1 YOUR CODE : STEP 3 */\n        /* handle the timer interrupt */\n        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c\n         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().\n         * (3) Too Simple? Yes, I think so!\n         */\n        ticks ++;\n        if (ticks % TICK_NUM == 0) {\n            print_ticks();\n        }\n        break;\n    case IRQ_OFFSET + IRQ_COM1:\n        c = cons_getc();\n        cprintf(\"serial [%03d] %c\\n\", c, c);\n        break;\n    case IRQ_OFFSET + IRQ_KBD:\n        c = cons_getc();\n        cprintf(\"kbd [%03d] %c\\n\", c, c);\n        break;\n    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.\n    case T_SWITCH_TOU:\n        if (tf->tf_cs != USER_CS) {\n            switchk2u = *tf;\n            switchk2u.tf_cs = USER_CS;\n            switchk2u.tf_ds = switchk2u.tf_es = switchk2u.tf_ss = USER_DS;\n            switchk2u.tf_esp = (uint32_t)tf + sizeof(struct trapframe) - 8;\n		\n            // set eflags, make sure ucore can use io under user mode.\n            // if CPL > IOPL, then cpu will generate a general protection.\n            switchk2u.tf_eflags |= FL_IOPL_MASK;\n		\n            // set temporary stack\n            // then iret will jump to the right stack\n            *((uint32_t *)tf - 1) = (uint32_t)&switchk2u;\n        }\n        break;\n    case T_SWITCH_TOK:\n        if (tf->tf_cs != KERNEL_CS) {\n            tf->tf_cs = KERNEL_CS;\n            tf->tf_ds = tf->tf_es = KERNEL_DS;\n            tf->tf_eflags &= ~FL_IOPL_MASK;\n            switchu2k = (struct trapframe *)(tf->tf_esp - (sizeof(struct trapframe) - 8));\n            memmove(switchu2k, tf, sizeof(struct trapframe) - 8);\n            *((uint32_t *)tf - 1) = (uint32_t)switchu2k;\n        }\n        break;\n    case IRQ_OFFSET + IRQ_IDE1:\n    case IRQ_OFFSET + IRQ_IDE2:\n        /* do nothing */\n        break;\n    default:\n        // in kernel, it must be a mistake\n        if ((tf->tf_cs & 3) == 0) {\n            print_trapframe(tf);\n            panic(\"unexpected trap in kernel.\\n\");\n        }\n    }\n}\n```','2020-03-03 21:55:50.288989','2020-03-17 15:49:55.479625',10),(24,'a','娴嬭瘯-绗簩绡?,'娴嬭瘯-绗簩绡?,'2020-03-03 21:55:50.288989','2020-03-17 13:40:38.333554',1),(25,'a','娴嬭瘯-绗笁绡?,'娴嬭瘯-绗笁绡?,'2020-03-03 21:55:50.288989','2020-03-16 07:46:14.085256',0),(26,'a','娴嬭瘯-绗洓绡?,'娴嬭瘯-绗洓绡?,'2020-03-03 21:55:50.288989','2020-03-16 07:46:14.085256',0),(27,'a','娴嬭瘯-绗簲绡?,'娴嬭瘯-绗簲绡?,'2020-03-03 21:55:50.288989','2020-03-16 07:46:14.085256',0),(28,'a','娴嬭瘯-绗叚绡?,'娴嬭瘯-绗叚绡?,'2020-03-03 21:55:50.288989','2020-03-16 07:46:14.085256',0),(29,'a','娴嬭瘯-绗竷绡?,'娴嬭瘯-绗竷绡?,'2020-03-03 21:55:50.288989','2020-03-16 07:46:14.085256',0),(30,'a','娴嬭瘯-绗叓绡?,'娴嬭瘯-绗叓绡?,'2020-03-03 21:55:50.288989','2020-03-17 15:17:26.764219',1),(31,'a','娴嬭瘯-绗節绡?,'娴嬭瘯-绗節绡?,'2020-03-03 21:55:50.288989','2020-03-16 07:46:14.085256',0),(32,'a','娴嬭瘯-绗崄绡?,'娴嬭瘯-绗崄绡?,'2020-03-03 21:55:50.288989','2020-03-16 07:46:14.085256',0);
/*!40000 ALTER TABLE `blog_blog` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'blog','blog'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-02-25 15:44:14.714027'),(2,'auth','0001_initial','2020-02-25 15:44:16.861509'),(3,'admin','0001_initial','2020-02-25 15:44:22.294762'),(4,'admin','0002_logentry_remove_auto_add','2020-02-25 15:44:23.383724'),(5,'admin','0003_logentry_add_action_flag_choices','2020-02-25 15:44:23.419414'),(6,'contenttypes','0002_remove_content_type_name','2020-02-25 15:44:24.443762'),(7,'auth','0002_alter_permission_name_max_length','2020-02-25 15:44:25.001502'),(8,'auth','0003_alter_user_email_max_length','2020-02-25 15:44:25.576725'),(9,'auth','0004_alter_user_username_opts','2020-02-25 15:44:25.601655'),(10,'auth','0005_alter_user_last_login_null','2020-02-25 15:44:26.052526'),(11,'auth','0006_require_contenttypes_0002','2020-02-25 15:44:26.078443'),(12,'auth','0007_alter_validators_add_error_messages','2020-02-25 15:44:26.117339'),(13,'auth','0008_alter_user_username_max_length','2020-02-25 15:44:26.618668'),(14,'auth','0009_alter_user_last_name_max_length','2020-02-25 15:44:27.125745'),(15,'auth','0010_alter_group_name_max_length','2020-02-25 15:44:27.667616'),(16,'auth','0011_update_proxy_permissions','2020-02-25 15:44:27.691680'),(17,'sessions','0001_initial','2020-02-25 15:44:28.030234'),(18,'blog','0001_initial','2020-03-04 05:57:39.665795'),(19,'blog','0002_remove_blog_path','2020-03-04 16:37:00.629163'),(20,'blog','0003_auto_20200305_2114','2020-03-05 13:14:52.359637'),(21,'blog','0004_auto_20200306_1805','2020-03-06 10:05:26.402281'),(22,'blog','0005_auto_20200316_1545','2020-03-16 07:46:14.908122'),(23,'blog','0006_blog_views_count','2020-03-16 08:30:48.734250');
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
INSERT INTO `django_session` VALUES ('0c7t2mmfi96s2v28chejyf3xira587mi','ZWFmZjZmMTE0YTBlZWVkODc5NjJkZmQ4ODczNjNjMmE4YjczMjgyNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZWE1NmE4ZDhmYTcxZmQyNGMxOTYwYjRlNjYzZjk5YjYyMjcxOGIyIn0=','2020-03-29 17:16:10.931448'),('4mqp36ke21niboj6wnclfk050h1knc0a','ZWFmZjZmMTE0YTBlZWVkODc5NjJkZmQ4ODczNjNjMmE4YjczMjgyNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZWE1NmE4ZDhmYTcxZmQyNGMxOTYwYjRlNjYzZjk5YjYyMjcxOGIyIn0=','2020-03-29 16:00:13.440739'),('jugyfrwp5cb1c1azxpkw5yy55x2mosfv','ZWFmZjZmMTE0YTBlZWVkODc5NjJkZmQ4ODczNjNjMmE4YjczMjgyNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZWE1NmE4ZDhmYTcxZmQyNGMxOTYwYjRlNjYzZjk5YjYyMjcxOGIyIn0=','2020-03-31 13:41:32.761013'),('x8i9y93lfeo9sk2s1au4uf72chkfwteo','ZWFmZjZmMTE0YTBlZWVkODc5NjJkZmQ4ODczNjNjMmE4YjczMjgyNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZWE1NmE4ZDhmYTcxZmQyNGMxOTYwYjRlNjYzZjk5YjYyMjcxOGIyIn0=','2020-03-29 17:23:57.846268');
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

-- Dump completed on 2020-03-18 20:26:13
