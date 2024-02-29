/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : zixun

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 29/02/2024 10:37:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `starid` int DEFAULT NULL,
  `catid` int DEFAULT NULL COMMENT '分类ID',
  `zancount` int NOT NULL COMMENT '点赞量',
  `hitcount` int NOT NULL COMMENT '点击量',
  `postdate` datetime NOT NULL COMMENT '发布时间',
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of articles
-- ----------------------------
BEGIN;
INSERT INTO `articles` VALUES ('林丹带6岁儿子参观科技馆', '近日，奥运冠军林丹的妻子谢杏芳上传了一段带儿子参观科技馆的视频。视频中，林丹头戴棒球帽着装休闲，身旁的儿子背着小书包很是可爱。', '中国娱乐网综合', '1648432272.jpg', 20, 1, 6, 4, '2022-03-28 09:51:22', 9);
INSERT INTO `articles` VALUES ('乒乓球奥运冠军李晓霞在沈阳做核酸筛查志愿者', '导读： 乒乓球奥运冠军李晓霞在微博晒出在沈阳第五轮全员核酸检测当志愿者的照片\n3月26日，乒乓球奥运冠军李晓霞在微博晒出在沈阳第五轮全员核酸检测当志愿者的照片，写道：“抗疫有我，共克时艰。尽自己微薄之力，愿疫情早日过去！”照片中的她在防护服上写着自己的名字，还写着：“抗战疫情，沈阳加油。”', '中国娱乐网综合', '1648439390.jpg', 21, 1, 0, 4, '2022-03-28 11:49:52', 10);
INSERT INTO `articles` VALUES ('《人生第二次》今日开播，央视网“人生三部曲”展现平凡中国人坚韧底色', '       由央视网、SMG、哔哩哔哩联合出品的纪录片《人生第二次》将于今晚（5月19日）19:00登陆央视网和哔哩哔哩，并将于5月24日在东方卫视播出。作为央视网“人生三部曲”IP第二部，节目不同于《人生第一次》春风和煦、波澜不惊的走向，将以推开生活之门的“第二次”为切入口呈现更深刻复杂的中国人故事。四组对立关键词，八幅人生图景，《人生第二次》将用多维度视角展现中国人面对困境的勇气和坚韧。\n\n       近日，“《人生第二次》定档519”的消息引发热议登陆热搜，不少喜欢《人生第一次》的网友隔着屏幕尖叫。时隔两年多，原班人马携第二次归来，网友激动之余更是期待。《人生第一次》以婴儿的新生初见开题，收割了不少网友的眼泪。而《人生第二次》则以寻亲家庭的重聚开篇，从目前官方释放的预告来看，比第一次破防点更密集，预计又将成为一部年度“好哭”佳作。\n\n开局之篇《圆》，讲述的是一场失散18年后的久别重逢。18年前，卫卓被人贩子王浩文拐卖，18年后在公安部的不懈努力下，卫卓和亲生父母相认团圆。在官方释出的第一集海报中，已然年迈的母亲牵着久别重逢的儿子，而小巷路灯投射出影子，却是当年年轻的她牵着年幼的卫卓。18年无数个寻亲日夜虽已佝偻了母亲的腰板，但既然风雨已经散去，走出离散痛苦的母子，未来漫漫人生路定然充满温暖与明亮。虽然《圆》今晚才正式开播，观众还未能看见故事全貌，也多少能从这张海报上窥见些故事走向了。团圆，是一段故事的结局，也是另一段故事的开始，那些重逢后的酸甜苦辣，不妨今晚跟着卫卓一起去经历体悟一番。\n\n以“人生”为题以“人文”为舵 《人生第二次》绘平凡中国人坚韧底色\n\n　　除了开篇《圆》，《人生第二次》还会聚焦另外七个对立关键词“缺”“纳” “拒”“是”“非”“破”“立”。节目将用这八个两两对立的主题，洞察在人生山海面前，那些关于平凡中国人“人生第二次”的勇气故事。\n\n　　《圆》，一次失散18年后的久别重逢\n\n　　《缺》，一轮对命运说不的逆风长跑\n\n　　《纳》，一趟与自己和解的轮椅进藏之旅\n\n　　《拒》，一段不甘被容貌左右的修整人生\n\n　　《是》，一册法理与人情相融的检察案卷\n\n　　《非》，一场走出高墙后的自我救赎\n\n　　《破》，一回冲破婚姻围城的重新出发\n\n　　《立》，一本流水线女工的进阶日记\n\n　　《人生第二次》通过镜头描绘出了八幅“独一无二”的人生图景，记录了主人公们推开人生之门后，面对生活疾风暴雨的决定性瞬间。和其他国内系列纪录片平行延展的逻辑不同，《人生第二次》坚持以“人生”为题，以“人文”为舵，深度挖掘了平凡中国人骨子里的不屈和韧性。据悉，在《人生第一次》、《人生第二次》后，央视网“人生三部曲”IP将迎来最终章，继续诠释当代中国人的生活智慧和哲学精神。\n\n生活时会搁浅时有磨砺，但我们终能在人生海海中迎来光亮。今晚19:00《人生第二次》准时登陆央视网、哔哩哔哩，5月24日起每周二22:00东方卫视播出，敬请期待！', '中国娱乐网', '1652927848.jpg', NULL, 3, 4, 37, '2022-05-18 02:31:25', 16);
INSERT INTO `articles` VALUES ('周杰伦线上演唱会超1200万人预约', '本报讯（记者高爽）记者从腾讯音乐获悉，周杰伦“奇迹现场重映计划” 线上视频演唱会将于5月20日、21日在QQ音乐、酷狗音乐、酷我音乐、微信视频号等平台播出。截至记者发稿时，两场演唱会的预约人数已经突破1200万人。\n　　5月20日将播出周杰伦摩天轮2013演唱会视频，曲目方面包括《龙拳》《一路向北》《不能说的秘密》《双截棍》等23首经典歌曲。5月21日播出的“地表最强”2019演唱会视频则囊括了《七里香》《半岛铁盒》《鞋子特大号》等25首现场演出。', '今晚报', '1652945292.jpg', 25, 4, 6, 83, '2022-05-19 07:53:00', 22);
INSERT INTO `articles` VALUES ('霉获纽约大学艺术荣誉博士学位 戴博士帽拍照留念', '       歌手Taylor Swift获纽约大学艺术荣誉博士学位，穿上博士服戴上博士帽的霉霉晒视频开心分享，歌迷赞：“好美的女博士！”', '新浪娱乐讯', '1652948867.jpg', 26, 1, 0, 18, '2022-05-16 22:45:15', 23);
INSERT INTO `articles` VALUES ('周杰伦“喜提三胎”,ins晒新歌歌词,画饼大师终于兑现', '       近日周杰伦在ins上晒了三胎女儿的照片，并发文：“母女两位都辛苦了”，还艾特了老婆昆凌，表示感谢。昆凌也发文庆祝三胎的到来，据说周杰伦还送了房产等给昆凌作为生产的奖励。\n        三胎不仅到来，新专辑也随后发布了！距离上次周杰伦新歌是什么时候？哪位网友跟我说说~自从2016年的《周杰伦的床边故事》后，2017年后一直都对外宣称自己正在些新专辑，很快也会发布，直到现在才有点消息~不少网友都说周杰伦就知道画大饼。可不是嘛，画了这么多年！\n        可能是听到了歌迷们的“骂声”，前几天周杰伦还在社交平台上发文：“如果我说我六七月发新专辑，你们是不是又不信了”。还配了张疑似MV拍摄图。这......杰伦我想“抽你个大嘴巴子~”要是真的，估计六七月份就是出完整的专辑了。', '新浪网', '1652948766.jpg', 25, 1, 0, 2, '2022-05-17 03:23:00', 24);
INSERT INTO `articles` VALUES ('第一次测试', '测试资讯添加功能', '陈佳', '1652949176.jpg', 19, 1, 0, 10, '2022-03-25 10:06:20', 25);
INSERT INTO `articles` VALUES ('测试时间设置', '测试时间设置功能', '陈佳', '1652949287.JPG', 19, 1, 0, 4, '2022-04-01 16:00:00', 26);
INSERT INTO `articles` VALUES ('测试换行', '第一行\n\n第三行\n  两个空格', '陈佳', '1652949341.JPG', 19, 1, 0, 2, '2022-04-11 00:00:00', 27);
INSERT INTO `articles` VALUES ('甄子丹新《天龙八部》将拍 选女主拒绝人工美女', '        新浪娱乐讯 据香港媒体报道，甄子丹将接拍武侠片《天龙八部之乔峰传》，为了营造不一样的感觉，他花了大量时间做前期工作，并于国内多个城市勘景。女主角方面，甄子丹坚拒“人工美女”，希望找到有演技、气质清纯的女演员，不排除海选捧新人。\n甄子丹早前决定接拍由王晶及郑伟文执导的电影《天龙八部之乔峰传》。他除了饰演男主角乔峰，还会担任监制及总制片人。昨日（18日）该片官方概念海报正式曝光。据知，该片投资额接近2亿元。\n\n　　甄子丹接受港媒采访，坦言考虑了数月才接拍，被老搭档王晶的诚意与胸襟打动：“之前我客串过《倚天屠龙记》的张三丰，其实我对他的拍摄不是最满意，所以这次他找我拍戏，我和他说要放手让我做。他之前看到我监制很多电影，很放心，所以就达成了这次合作。”\n\n　　电影由经典武侠小说改编，甄子丹之前与老婆汪诗诗到大理、青城山等地游玩，除了趁放假陪老婆外，更四处勘景搜集灵感。\n\n　　故事以乔峰主干，女主角阿朱由谁参演则暂未有定案。甄子丹已向王晶约法三章，坚拒“假面女星”演出，他说：“女主角一定要以演技行先，而且要真实的面孔，模样不能假，咖位反而不那么重要，只要有演技、气质合适就可以。”被问到如果圈中没有合适的，会不会考虑海选？甄子丹表示有可能。\n\n　　电影将于7月在横店开机，之后到山西雁门关、镜湖等地取景。', '新浪娱乐', '1652949478.jpg', NULL, 2, 0, 15, '2022-05-19 07:37:00', 28);
INSERT INTO `articles` VALUES ('恐龙来了！《侏罗纪世界3》定档6月10日同步北美', '新浪娱乐讯 《侏罗纪世界3》宣布中国内地定档6月10日，同步北美。\n\n　　这部是《侏罗纪世界》系列的完结篇，克里斯·帕拉特、布莱丝·达拉斯·霍华德继续主演，《侏罗纪公园》主演劳拉·邓恩、杰夫·高布伦、山姆·尼尔也回归，由《侏罗纪世界1》导演科林·特莱沃若执导。', '新浪娱乐', '1652949621.jpg', NULL, 2, 0, 0, '2022-05-16 17:06:00', 29);
INSERT INTO `articles` VALUES ('再次延长！《新蝙蝠侠》将上映至6月17日', '新浪娱乐讯 5月10日，DC超级英雄电影《新蝙蝠侠》宣布中国内地再次延长上映，至6月17日。\n\n　　该片于2022年3月18日在内地上映，上映第54天，票房累计达1.57亿元。', '新浪娱乐', '1652949712.jpg', NULL, 2, 0, 0, '2022-05-10 10:18:00', 30);
INSERT INTO `articles` VALUES ('汤唯将携电影《分手的决心》出席戛纳国际电影节', '新浪娱乐讯 5月4日，据韩媒报道，朴赞郁导演新电影《分手的决心》主演汤唯、朴海日将出席第75届戛纳国际电影节红毯。其他主演李贞贤、高庚杓、朴勇宇因其他作品的拍摄及个人日程安排而缺席。\n\n　　据悉，电影《分手的决心》已入围本届戛纳电影节主竞赛单元。', '新浪娱乐', '1652949815.jpg', 27, 2, 0, 1, '2022-05-04 05:02:00', 31);
INSERT INTO `articles` VALUES ('《长津湖之水门桥》香港定档5月12日', '新浪娱乐讯 由吴京、易烊千玺等主演的电影《长津湖之水门桥》发布港版海报，宣布定档5月12日在中国香港上映。\n\n　　该片自2022年春节期间在内地上映，目前票房已突破40.56亿人民币。', '新浪娱乐', '1652951477.jpg', NULL, 2, 0, 0, '2022-04-20 11:12:00', 32);
INSERT INTO `articles` VALUES ('为体育·燃青春丨勇于挑战极限！回顾谷爱凌冬奥会“超神”一跳', '山东电视体育频道消息，这场比赛无疑是2022年北京冬奥会上最惊心动魄的一场比赛，这是女子自由式滑雪大跳台的决赛现场，也是谷爱凌的成名之战。经过前两跳的稳定表现，谷爱凌暂列第三，已经确保获得一枚奖牌。1620是谷爱凌从未尝试过的动作，最后一跳是选择求稳还是挑战极限，谷爱凌面临艰难的抉择。\n“我准备做1620这个动作的时候，我妈前一天晚上跟我说，不要做这个动作，太危险了，但我第二跳跳完之后，我已经知道我要挑战了。”谷爱凌回忆道。\n最终，谷爱凌成功做出1620并稳稳落地，逆转夺冠，收获了个人冬奥会第一枚金牌。“我做1620的时候，是我人生感觉最美最自信时刻，我不怕失误，因为我爱的是过程，爱的是滑雪本身。”\n自由式滑雪大跳台项目是2022年北京冬奥会新增设项目之一，而中国女子在该项上的基础几乎为零，为了实现此次冬奥会全面参赛的目标，一年前谷爱凌就临危受命，为中国国家队承担起这一重任。在本届冬奥会上，年仅18岁的谷爱凌最终代表中国队夺得两金一银，成为冬奥会上首个参赛三项均登上领奖台的选手。\n这名18岁的冰雪少女，未来有无限的可能。而她也将用自己的经历去感染更多的年轻人。“通过滑雪我找到了友谊，通过滑雪我找到了自信。”通过滑雪，我变成了最好的自己。”谷爱凌说，“我一直就想，让更多的青少年们，尤其是女孩，去接触并爱上冰雪运动，通过运动找到自信，打破自己的界限，变成最好的自己。”\n\n山东电视体育频道 孙东昊', '齐鲁网', '1654077884.jpeg', 29, 5, 17, 20, '2022-05-04 09:23:05', 34);
COMMIT;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
BEGIN;
INSERT INTO `categories` VALUES (1, '明星资讯');
INSERT INTO `categories` VALUES (2, '电影资讯');
INSERT INTO `categories` VALUES (3, '电视资讯');
INSERT INTO `categories` VALUES (4, '音乐资讯');
INSERT INTO `categories` VALUES (5, '体育资讯');
COMMIT;

-- ----------------------------
-- Table structure for feedbacks
-- ----------------------------
DROP TABLE IF EXISTS `feedbacks`;
CREATE TABLE `feedbacks` (
  `articleid` int NOT NULL COMMENT '文章id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `adddate` datetime NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of feedbacks
-- ----------------------------
BEGIN;
INSERT INTO `feedbacks` VALUES (9, 'user1', 'haobang', '2022-04-19 14:37:23', 14);
INSERT INTO `feedbacks` VALUES (8, '123', '测试', '2022-05-12 19:06:38', 15);
INSERT INTO `feedbacks` VALUES (12, 'admin', 'ceshi ', '2022-05-12 20:02:22', 16);
INSERT INTO `feedbacks` VALUES (22, 'user1', '好棒啊！', '2022-05-19 17:29:47', 17);
INSERT INTO `feedbacks` VALUES (22, '张三', '太好了', '2022-05-19 17:30:40', 18);
INSERT INTO `feedbacks` VALUES (27, '陈佳', '和\n', '2022-06-17 23:22:19', 30);
COMMIT;

-- ----------------------------
-- Table structure for shoucangs
-- ----------------------------
DROP TABLE IF EXISTS `shoucangs`;
CREATE TABLE `shoucangs` (
  `articleid` int NOT NULL,
  `userid` int NOT NULL,
  `adddate` datetime NOT NULL COMMENT '3',
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of shoucangs
-- ----------------------------
BEGIN;
INSERT INTO `shoucangs` VALUES (12, 41, '2022-05-12 20:01:27', 38);
INSERT INTO `shoucangs` VALUES (22, 43, '2022-06-02 17:29:59', 46);
COMMIT;

-- ----------------------------
-- Table structure for stars
-- ----------------------------
DROP TABLE IF EXISTS `stars`;
CREATE TABLE `stars` (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `desc` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of stars
-- ----------------------------
BEGIN;
INSERT INTO `stars` VALUES ('林丹', '1648432236.jpg', 20, '中国羽毛球运动员、世界羽毛球名将\n林丹，汉族，1983年10月14日出生于福建省龙岩市上杭县临江镇，中国羽毛球男单运动员，2008年北京奥运会、2012年伦敦奥运会羽毛球男单冠军，羽毛球史上第一位集奥运会、世锦赛、世界杯、苏迪曼杯、汤姆斯杯、亚运会、亚锦赛、全英赛、全运会及多座世界羽联超级系列赛冠军于一身的双圈全满贯选手，被誉为中国羽毛球一哥，21世纪初期世界羽毛球四大天王之一。\n1988年，5岁开始接触羽毛球。 [1]  2000年进入国家队。 [1]  2002年8月，首次登上羽毛球世界排名第一的位置。 [2]  2005年12月，获羽毛球世界杯男单冠军，并于2006年卫冕。 [3] \n2008年北京奥运会羽毛球男单冠军。2009年实现世锦赛三连冠。2010年广州亚运会羽毛球男单冠军，实现全满贯。 [4] \n2012年伦敦奥运会成功卫冕，成为首位在奥运会羽毛球男单项目中实现卫冕的运动员。 [5]  2013年8月，第五次获得羽毛球世锦赛男单冠军（2006、2007、2009、2011、2013），连续三年在世界大赛决赛中战胜李宗伟 [6]  。2014年仁川亚运会男单冠军，成功卫冕并实现了双圈全满贯。 [7]  2016年3月，第六次获全英赛男单冠军。 [8]  8月第四次征战奥运会。 [9] \n2017年4月，获马来西亚羽毛球公开赛冠军，终结东南亚巡回赛赛事生涯无冠纪录。 [10]  10月，实现全运会羽毛球男单四连冠并夺得个人首个全运会男团冠军。 [11-12]  2018年5月5日，获新西兰羽毛球公开赛男单冠军 [13]  。5月27日，凭借汤姆斯杯获得第20个世界冠军 [14]  。8月，获雅加达亚运会羽毛球男团冠军 [15]  。2019年4月，获马来西亚羽毛球公开赛男单冠军 [16]  。\n2020年7月4日，林丹正式宣布退役 [17]  。\n');
INSERT INTO `stars` VALUES ('李晓霞', '1648439190.jpg', 21, '中国女子乒乓球队队员\n李晓霞，1988年6月21日出生于中国辽宁省鞍山市，前中国女子乒乓球队运动员，中国国家乒乓球队队员，已退役 [1-2]  。\n1998年，李晓霞入选山东体工队。2001年，中国国家乒乓球队二队。2002年，进入中国国家乒乓球队一队 [3]  。2008年，获得乒乓球世界杯女单冠军。2010年，获得亚运会乒乓球女单冠军 [4]  。2012年，获得伦敦奥运会乒乓球女单、女团冠军 [5]  。2013年，获得第52届世界乒乓球锦标赛乒乓球女单冠军、成为大满贯得主 [6]  ；9月10日，获得中华人民共和国第十二届运动会冠军、成为全满贯得主 [7]  ；12月，当选中国女子乒乓球队队长。2014年11月7日，被评为2012年伦敦奥运会最佳女运动员奖 [8]  。2015年，获得科威特乒乓球公开赛乒乓球女单冠军 [9]  。2016年3月，获得第53届世界乒乓球锦标赛乒乓球女团冠军、并被评为最有价值球员 [10]  ；8月11日，获得里约奥运会乒乓球女单亚军；8月17日，获得里约奥运会乒乓球女团冠军，同日在微博上宣布退出国家队 [11-12]  。\n2020年9月，李晓霞二胎产女 [13]  。');
INSERT INTO `stars` VALUES ('周杰伦', '1652942450.jpg', 25, ' 英文名：Chow, Jay\n国籍：中国\n地区：香港\n职业：歌手\n血型：O型\n生肖：羊\n星座：天蝎座\n性别：男\n生日：1979年1月18日\n身高：173 (cm)\n体重：60 (kg)\n详情个人简介：\n      周杰伦（Jay Chou，1979年1月18日），绰号“周董”或“小天王周杰伦”，是来自台湾的流行曲歌手、作曲人、作词人。他在很大程度上提升了词曲原创人在华人音乐界的地位，而周杰伦自己也与另外数位知名的华语音乐制作人如王力宏和陶喆等并列成为近五年来影响华语音乐最深的新人之一。周杰伦自己作曲和主唱的作品，多数由方文山作词，内容比一般流行曲勇于涉猎前所未见的题材，如《爸我回来了》的家庭暴力、《双截棍》的武术、《爱在西元前》的世界历史、《梯田》的环保、《四面楚歌》的狗仔队等，这为当代华语乐坛造成冲击。一些说法认为周杰伦是受罗大佑及歌神张学友的影响而开始喜欢并创作流行音乐，这两位华语歌坛的重量级人物在无形当中成为了周杰伦进入流行歌坛的启蒙老师。\n      周杰伦的的音乐风格亦十分多样化，他的专长是节奏蓝调（R&B）和说唱（Rap)。他创新地在歌曲里使用西方古典音乐：如在“双截棍”中的莫札特奏鸣曲风格的过场；在“蓝色风暴”开端的格列高利圣咏（Gregorian chant），也有富中国武术（如“双截棍”、“龙拳”和“霍元甲”）或中国音乐特色的（在“娘子”中，过场的吉他就用了琵琶的轮指奏法；使用民乐乐器：“乱舞春秋”、“发如雪”等）。周杰伦融合中西音乐的风格创造了一种新鲜的声音，这和台湾的主流音乐很不同。他有些歌曲渗入了自然环境或日常物件的录音，这加强了音乐的故事性（例如“将军”的下棋情景、“四面楚歌”的照相机咔察声、“蓝色风暴”的电话拨号声、“三年二班”的乒乓球撞击声）。在编曲方面，他的歌曲和音丰富：很多时候主旋律、和音、说唱（rap）、对旋律（countermelody）会一层一层的加上,并在结尾时逐层淡出，颇有层次；同一旋律录两条音轨同时在左右耳播放,很有立体的合唱效果。他刻意不清楚的咬字使歌曲的说唱部份更有节奏感。\n出演电影:\n<头文字D>-藤原拓海(2005)\n<满城尽带黄金甲>(2006)\n专辑：\n2000/11/7《周杰伦》1.可爱女人2.完美主义3.星晴4.娘子5.斗牛6.黑色幽默7.伊斯坦堡8.印地安老斑鸠9.龙卷风10.反方向的钟\n2001/9/1《范特西》1.爱在西元前2.爸我回来了3.简单爱4.忍者5.开不了口6.上海 一九四三7对不起8.威廉古堡9.双截棍10.安静11.世界末日\n2002/7/19《八度空间》1.半兽人2.半岛铁盒3.暗号4.龙拳5.火车叨位去6.分裂7.爷爷泡的茶8.回到过去9.米兰的小铁匠10.最后的战役\n2003-7-31《叶惠美》1.以父之名2.懦夫3.晴天4.三年二班5.东风破6.你听得到7.同一种调调8.她的睫毛9.爱情悬崖10.梯田11.双刀\n2004/08/03《七里香》1.我的地盘2七里香3.借口4.外婆5.将军6.搁浅7.乱舞春秋 8.困兽之斗9.园游会10.止战之殇\n2005.11.1《十一月的肖邦》1.夜曲2.蓝色风暴3.发如雪4.黑色毛衣5.四面楚歌6.枫7.浪漫手机8.逆鳞9.麦芽糖10.珊瑚海11.飘移12.一路向北\n2006.9.5 《依然范特西》1.夜的第七章 2.听妈妈的话 3.千里之外 4.本草纲目 5.退后 6.红模仿 7.心雨 8.白色风车 9.迷迭香 10.菊花台\n非专辑收录的 但为Jay唱的（或唱过）歌曲：对不起BAby 你比从前快乐 世界末日 蜗牛 断了的弦 轨迹 霍元甲 你怎么连话都说不清楚 算命 瓦解 消失 屋顶 爱我别走 献世 大头贴');
INSERT INTO `stars` VALUES ('汤唯', '1652951123.png', 27, '性别：	女\n国籍：	中国\n职业：	导演,演员,歌手\n生日：	1979-10-7\n身高：	172cm \n汤唯，1979年10月7日出生于浙江省杭州市，中国影视女演员。2000年考入中央戏剧学院导演系本科。 \n2007年主演华人导演李安执导的电影《色·戒》中女主角王佳芝，该片在威尼斯国际电影节荣获最佳影片“金狮奖”，因此片她一举成名，但也引起相当大的争议。其后赴英国学习短期的戏剧表演，通过香港政府的“优秀人才入境计划”获取香港居民身份证。2010年，她出演小成本电影《月满轩尼诗》在内地上映成功“解禁”，并获得第11届华语电影传媒大奖最佳女演员称号。2011年，汤唯凭借电影《晚秋》分别在韩国百想艺术大赏、韩国影评奖、釜山影评家奖等十余个评选中荣获最佳女主角奖。2013年，汤唯主演的《北京遇上西雅图》成为华语爱情片票房冠军，并荣获了第22届上海影评人奖最佳女主角、第5届中国电影导演协会年度女演员、第21届北京大学生电影节最佳女演员等荣誉。汤唯主演的反映民国女作家萧红一生的传记电影《黄金时代》将于2014年10月1日上映。 \n2014年7月2日汤唯宣布与《晚秋》导演金泰勇喜结连理。\n获得奖项：\n韩国百想艺术大赏最佳女主角\n华语电影传媒大奖最佳女主角\n北京大学生电影节最佳女主角\n中国电影导演协会年度女演员\n台湾电影金马奖最佳新演员奖');
INSERT INTO `stars` VALUES ('丁真珍珠', '1653815676.png', 28, '（汉语名：丁真），藏族，四川文化旅游宣传推广大使 [50]  、中国内地男歌手 [74-75]  ，生活在四川省甘孜藏族自治州理塘县 [1-2]  。\n2020年11月，丁真因为一脸纯真朴素的笑容意外走红网络，成为“新晋顶流”。走红后的丁真已成为理塘县的旅游大使，为当地旅游贡献力量。11月25日，丁真为家乡拍摄的宣传片《丁真的世界》正式上线 [3]  。\n2021年2月4日，丁真加盟《中央广播电视总台2021网络春晚》任表演嘉宾 [4-5]  ；同日，丁真发布单曲《1376心想事成》，用藏语献礼新年 [6]  。2月12日，丁真加盟《春满东方 幸福牛年·2021东方卫视春节晚会》任表演嘉宾 [7]  。3月23日，丁真随四川甘孜州民族歌舞团参加《脱贫攻坚感恩致谢——甘孜州赴广州市群众文艺交流演出》 [29]  ；2021年6月，受聘四川文旅宣传推广大使 [50]  ，担任首批四川生态环境保护大使 [51]  ；2021年7月20日，由丁真发起的中国扶贫基金会小马第一爱心基金成立，首笔善款将用于为理塘的山地播种树木 [165]  ；10月15日，参加《抖音美好奇妙夜》。 [79]  10月12日，在中国蚌埠古民居博览园参加太湖世界文化论坛第六届年会。 [80]  2021年12月5日丁真被评选为2021年度微博最具文化传播力红人和2021年度微博新锐红人 [164]  ；微博2021最具人气颜值红人 [206]  。\n\n\n中文名\n丁真珍珠\n外文名\nTenzin Tsundue [205] \n别    名\n丁真\n国    籍\n中国\n民    族\n藏族\n出生地\n四川省甘孜藏族自治州理塘县\n出生日期\n2001年5月7日 [141-142] \n职    业\n旅游大使、歌手\n代表作品\n丁真的世界、丁真的自然笔记、风的使者\n主要成就\n四川文化旅游宣传推广大使 [50]  \n四川生态环境保护大使 [51]  \n2020中国文旅年度新锐影响力人物 [39]  \n中华民族大赛马形象大使 [138]  \n2020年度中国国家旅游区域旅游特别贡献奖 [22] \n网络昵称\n甜野男孩、赛马王子 [25]  [41] \n爱    好\n骑马、唱歌、锅庄舞');
INSERT INTO `stars` VALUES ('谷爱凌', '1653815794.png', 29, '2003年9月3日出生于美国加利福尼亚州圣弗朗西斯科，昵称“青蛙公主”，中国女子自由式滑雪运动员。 [43-44]  [53]  [79]  [81]  [84]  [87]  [117]  她是国际雪联第一位自由式滑雪女子U型场地大满贯 [125]  ，也是中国首位在世界极限运动会夺金的运动员。 [126-127] \n2019年8月16日，谷爱凌获得自由式滑雪坡面障碍技巧公开赛冠军；2021年3月，在2021年自由式滑雪世锦赛女子自由式滑雪U型场地，自由式滑雪坡面障碍技巧，自由式滑雪大跳台三项比赛中斩获2金1铜； [30]  在2022年北京冬奥会中，谷爱凌获得自由式滑雪女子大跳台和自由式滑雪女子U型场地2枚金牌，1枚自由式滑雪坡面障碍技巧银牌的成绩。');
INSERT INTO `stars` VALUES ('刘德华', '1653816149.png', 30, '1961年9月27日出生于中国香港，籍贯广东新会，中国香港影视男演员、歌手、制片人、作词人。\n1981年出演电影处女作《彩云曲》。1983年主演的武侠剧《神雕侠侣》在香港取得62点的收视纪录 [1-2]  。1985年发行首张个人专辑《只知道此刻爱你》 [11]  。1990年凭借专辑《可不可以》在歌坛获得关注 [12]  。1991年创办天幕电影公司 [3]  。1994年获得十大劲歌金曲最受欢迎男歌星奖；同年担任剧情片《天与地》的制片人 [4]  。1995年在央视春晚上演唱其代表作《忘情水》 [13]  。2000年凭借警匪片《暗战》获得金像奖最佳男主角奖 [5]  ；同年被《吉尼斯世界纪录大全》评为获奖最多的香港男歌手 [14]  。\n2004年凭借剧情片《大块头有大智慧》获得金像奖最佳男主角奖 [271]  ；同年凭借警匪片《无间道3：终极无间》获得金马奖最佳男主角奖 [6]  ；同年第六次获得十大劲歌金曲最受欢迎男歌星奖。2005年获得香港UA院线颁发的全港最高累积票房香港男演员奖 [7]  。2006年获得釜山国际电影节亚洲最有贡献电影人奖 [8]  。2012年凭借剧情片《桃姐》获得金马奖、金像奖最佳男主角奖 [9]  ；同年担任第49届台湾电影金马奖评审团主席 [10]  。2015年第5次登上央视春晚并演唱歌曲《回家的路》 [15]  。2020年发行个人首张数字专辑《演·唱》 [261]  。\n演艺事业外，刘德华关心公益慈善。1994年创立刘德华慈善基金会。2000年被评为世界十大杰出青年 [16]  。2005年发起亚洲新星导计划 [17]  。2008年被委任为香港非官守太平绅士 [18]  。2010年获得第12届世界杰出华人奖 [19]  。2016年连任中国残疾人福利基金会副理事长 [16]  。\n中文名 刘德华 外文名 Andy Lau \nLau Tak Wah 别    名 华仔、华Dee、华哥 国    籍中国 民    族汉族 出生地 中国香港新界大埔镇泰亨村 出生日期 1961年9月27日 星    座天秤座 血    型 AB型 身    高 174 cm 体    重 68 kg [298]  毕业院校可立中学、第十期无线艺员训练班 职    业 演员、歌手、制片人、作词人 经纪公司东亚唱片、映艺娱乐 代表作品无间道、天若有情、天下无贼、旺角卡门、暗战、阿虎、十面埋伏、大块头有大智慧、桃姐、天与地、投名状、失孤、五亿探长雷洛传、法外情、拆弹专家2、来生缘、忘情水、谢谢你的爱、冰雨、练习、笨小孩、男人哭吧不是罪、17岁、今天、暗里着迷、真情难收、世界第一等、中国人、真我的风采、爱你一万年 主要成就 三届香港电影金像奖最佳男主角奖 \n两届台湾电影金马奖最佳男主角奖 \n中国电影华表奖优秀男演员奖 \n香港电影金像奖最佳男配角奖 \n华语电影传媒大奖最佳男演员奖 \n妻    子 朱丽倩 \n女    儿 刘向蕙 \n全球粉丝会 华仔天地 \n信    仰 佛教 \n籍    贯 广东新会 \n职    务中国残疾人福利基金会副理事长 \n性    别 男');
INSERT INTO `stars` VALUES ('杨幂', '1653817525.png', 31, '1986年9月12日出生于北京市，中国内地影视女演员、流行乐歌手、影视制片人。\n2005年，杨幂进入北京电影学院表演系本科班就读。2006年，因出演金庸武侠剧《神雕侠侣》崭露头角。2008年，凭借古装剧《王昭君》获得第24届中国电视金鹰奖观众喜爱的电视剧女演员奖提名 [1]  。2009年，在“80后新生代娱乐大明星”评选中被评为“四小花旦” [2]  。2011年，凭借穿越剧《宫锁心玉》赢得广泛关注 [3]  ，并获得了第17届上海电视节白玉兰奖观众票选最具人气女演员奖 [4]  。2012年，不仅成立杨幂工作室，还凭借都市剧《北京爱情故事》获得了多项荣誉 [5-6]  。\n2015年，主演的《小时代》系列电影票房突破18亿人民币 [7]  。2016年，其主演的职场剧《亲爱的翻译官》取得全国年度电视剧收视冠军 [8]  。2017年，杨幂主演的神话剧《三生三世十里桃花》获得颇高关注；同年，她还凭借科幻片《逆时营救》获得休斯顿国际电影节最佳女主角奖 [9]  。2018年，凭借古装片《绣春刀Ⅱ：修罗战场》获得北京大学生电影节最受大学生欢迎女演员奖 [10]  ；同年，她还获得了第五届中国电视好演员奖绿宝石女演员奖 [11]  。2021年，首次参加央视春节联欢晚会 [12]  。\n中文名 杨幂 外文名 Yang Mi，Mini 别    名 紫曦、幂幂、狐狸、小幂、狐小幂、大幂幂 国    籍中国 民    族 汉族 出生地 北京市 出生日期 1986年9月12日 星    座处女座 血    型 B型 身    高 166.5 cm 体    重 45 kg(2020年数据) [459]  毕业院校北京电影学院 职    业 演员、歌手、制片人 经纪公司 嘉行杨幂工作室 代表作品三生三世十里桃花、宫锁心玉、小时代、仙剑奇侠传三、亲爱的翻译官、我是证人、古剑奇谭、王昭君、北京爱情故事 主要成就第9届中国金鹰电视艺术节最具人气女演员 \n第17届上海电视节白玉兰奖最具人气女演员 \n第50届休斯敦国际电影节最佳女主角 \n第25届北京大学生电影节最受欢迎女演员 \n第16届广州大学生电影节最受欢迎女主角 粉丝名 蜜蜂 唱片公司少城时代');
INSERT INTO `stars` VALUES ('泰勒·斯威夫特（Taylor Swift）', '1652947665.png', 32, '中文名：泰勒·艾莉森·斯威夫特 \n外文名：Taylor Alison Swift \n别    名：T-Swizzle、Tay、霉霉 [198]  \n国    籍：美国 \n民    族：美利坚民族 \n出生地：美国宾夕法尼亚州雷丁 \n出生日期：1989年12月13日 \n星    座：射手座 \n血    型：B型 \n身    高：180 cm\n职    业：歌手、音乐制作人、演员 \n经纪公司：环球唱片\n代表作品：Love Story、You Belong With Me、Sparks Fly、Enchanted、Safe & Sound、Red、I Knew You Were Trouble.、22、Shake It Off、Blank Space、Wildest Dreams、Look What You Made Me Do、Delicate、ME!、Cruel Summer、Lover、cardigan、exile、willow、All Too Well (10 Minute Version)\n泰勒·斯威夫特（Taylor Swift），1989年12月13日出生于美国宾夕法尼亚州，美国女歌手、词曲作者、音乐制作人、演员。\n2006年，发行个人首张音乐专辑《Taylor Swift》，该专辑获得美国唱片业协会认证5倍白金唱片销量。2008年，发行音乐专辑《Fearless》，该专辑在美国公告牌专辑榜上获11周冠军，认证7倍白金唱片销量，并获得第52届格莱美奖年度专辑奖 [1]  。2010年，发行音乐专辑《Speak Now》，单曲《Mean》获2座格莱美奖。同年，获创作人名人堂“哈尔·大卫星光大奖” [2]  。2011年，凭借三张实体专辑销量，获得中国区“五白金唱片”销量认证 [3]  。2012年，开始向流行乐歌手转型，并发行音乐专辑《Red》 [4]  ，该专辑实体版本获得中国区“双白金唱片”销量认证 [5]  。2013年，获得第47届乡村音乐协会奖巅峰奖 [6]  。\n2014年，发行音乐专辑《1989》，该专辑获得第58届格莱美奖年度专辑奖，国际唱片业协会（IFPI）宣布该专辑为“年度全球唱片销量冠军” [7]  。同年，获得第42届全美音乐奖迪克·克拉克成就奖 [8]  ，并入围《时代周刊（美国版）》年度人物 [9]  。2015年4月，获第50届乡村音乐学院奖50周年里程碑奖 [10]  。2017年，发行音乐专辑《reputation》，凭借美国首周123.8万张销量，成为拥有四张首周百万销量专辑的歌手 [11]  。同年，被《时代周刊》选为年度人物。2019年，发行音乐专辑《Lover》 [12]  ；同年，获得国际唱片业协会（IFPI）“年度全球最佳唱片艺术家奖” [13]  。2020年，发行音乐专辑《folklore》《evermore》，前者获第63届格莱美奖年度专辑奖 [178]  。');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `isadmin` bit(1) DEFAULT b'0' COMMENT '是否是管理员',
  `pinglun` bit(1) DEFAULT b'1' COMMENT '是否允许评论',
  `dianzan` bit(1) DEFAULT b'1' COMMENT '是否允许点赞',
  `shoucang` bit(1) DEFAULT b'1' COMMENT '是否允许收藏',
  `jianjie` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (41, 'admin', '123', '', 0, '', b'1', b'1', b'1', b'1', NULL);
INSERT INTO `users` VALUES (43, '张三', '123456', '女', 19, '12323212312', b'0', b'1', b'1', b'1', '没什么好介绍的');
INSERT INTO `users` VALUES (46, '李四', '123', '女', 0, '', b'0', b'1', b'1', b'1', NULL);
INSERT INTO `users` VALUES (48, '王五', '12333', '', 0, '', b'0', b'1', b'1', b'1', NULL);
INSERT INTO `users` VALUES (49, '陈佳', '666', '女', 22, '15903538062', b'1', b'1', b'1', b'1', NULL);
INSERT INTO `users` VALUES (50, '甲甲', '11', '', 0, '', b'0', b'1', b'1', b'1', NULL);
INSERT INTO `users` VALUES (52, '123', '123', '', 0, '', b'0', b'1', b'1', b'1', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
