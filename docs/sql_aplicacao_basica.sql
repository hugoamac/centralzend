-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.29-0ubuntu0.12.04.1 - (Ubuntu)
-- Server OS:                    debian-linux-gnu
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2013-01-22 23:34:21
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for zend
CREATE DATABASE IF NOT EXISTS `zend` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `zend`;


-- Dumping structure for table zend.log_operacao
CREATE TABLE IF NOT EXISTS `log_operacao` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `operacao` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table zend.log_operacao: ~3 rows (approximately)
/*!40000 ALTER TABLE `log_operacao` DISABLE KEYS */;
INSERT INTO `log_operacao` (`id`, `operacao`) VALUES
	(1, 'Cadastro'),
	(2, 'Edição'),
	(3, 'Exclusão');
/*!40000 ALTER TABLE `log_operacao` ENABLE KEYS */;


-- Dumping structure for table zend.log_transacao
CREATE TABLE IF NOT EXISTS `log_transacao` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_operacao` int(10) NOT NULL DEFAULT '0',
  `id_usuario` int(10) NOT NULL DEFAULT '0',
  `tabela` varchar(50) DEFAULT NULL,
  `dados` mediumtext,
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK1_log_operacao_log_transacao` (`id_operacao`),
  KEY `FK2_usu_usuario_log_transacao` (`id_usuario`),
  CONSTRAINT `FK1_log_operacao_log_transacao` FOREIGN KEY (`id_operacao`) REFERENCES `log_operacao` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK2_usu_usuario_log_transacao` FOREIGN KEY (`id_usuario`) REFERENCES `usu_usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;

-- Dumping data for table zend.log_transacao: ~137 rows (approximately)
/*!40000 ALTER TABLE `log_transacao` DISABLE KEYS */;
INSERT INTO `log_transacao` (`id`, `id_operacao`, `id_usuario`, `tabela`, `dados`, `data_criacao`) VALUES
	(1, 1, 1, 'usu_usuario', 'Dados inserido: </br>\n                            Id: 5</br>\n                            Dados:</br>id_grupo : 3<br/>nome : leitao<br/>login : leitao<br/>email : leitao@hugo.com<br/>senha : 123456<br/>', '2012-11-04 19:12:40'),
	(2, 1, 1, 'usu_recurso_transacao', 'Dados inserido: </br>\n                            Id: 22</br>\n                            Dados:</br>id_recurso : 6<br/>transacao : teste<br/>', '2012-11-04 19:15:41'),
	(3, 1, 1, 'usu_recurso', 'Dados inserido: </br>\n                            Id: 6</br>\n                            Dados:</br>area : teste<br/>nome : teste<br/>transacao : Array<br/>', '2012-11-04 19:15:41'),
	(4, 3, 1, 'usu_usuario', 'Dados excluidos: </br>\n                            Id: 5</br>\n                            Dados:</br>id : 5<br/>id_grupo : 3<br/>nome : leitao<br/>login : leitao<br/>senha : e10adc3949ba59abbe56e057f20f883e<br/>email : leitao@hugo.com<br/>', '2012-11-04 19:23:23'),
	(5, 3, 1, 'usu_usuario', 'Dados excluidos: </br>\n                            Id: 4</br>\n                            Dados:</br>id : 4<br/>id_grupo : 3<br/>nome : paulo<br/>login : paulo<br/>senha : e10adc3949ba59abbe56e057f20f883e<br/>email : paulo@bredi.com<br/>', '2012-11-04 19:23:27'),
	(6, 1, 1, 'usu_usuario', 'Dados inserido: </br>\n                            Id: 6</br>\n                            Dados:</br>id_grupo : 3<br/>nome : Paulo Viegas<br/>login : paulo<br/>email : paulo@bredi.com.br<br/>', '2012-11-04 19:23:49'),
	(7, 2, 1, 'usu_usuario', 'Os Dados:<br/>id : 6<br/>id_grupo : 3<br/>nome : Paulo Viegas<br/>login : paulo<br/>senha : e10adc3949ba59abbe56e057f20f883e<br/>email : paulo@bredi.com.br<br/>Foram alterados para:<br/>id_grupo : 3<br/>nome : Paulo Viegas<br/>login : paulo<br/>email : paulo@bredi.com.br<br/>id : 6<br/>', '2012-11-04 19:24:25'),
	(8, 2, 1, 'usu_usuario', 'Os Dados:<br/>id : 6<br/>id_grupo : 3<br/>nome : Paulo Viegas<br/>login : paulo<br/>email : paulo@bredi.com.br<br/>Foram alterados para:<br/>id_grupo : 3<br/>nome : Paulo Viegas<br/>login : paulo<br/>email : paulo@bredi.com.br<br/>id : 6<br/>', '2012-11-04 19:26:33'),
	(9, 3, 1, 'usu_usuario', 'Dados excluidos: </br>\n                            Id: 6</br>\n                            Dados:</br>id : 6<br/>id_grupo : 3<br/>nome : Paulo Viegas<br/>login : paulo<br/>email : paulo@bredi.com.br<br/>', '2012-11-04 21:55:30'),
	(10, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 19</br>\n                            Dados:</br>nome : Guest<br/>', '2012-11-04 21:56:46'),
	(11, 2, 1, 'usu_grupo', 'Os Dados:<br/><br/>id : 19<br/>nome : Guest<br/><br/>Foram alterados para:<br/><br/>nome : Guests<br/>id : 19<br/>', '2012-11-04 21:57:21'),
	(12, 3, 1, 'usu_grupo', 'Dados excluidos: </br>\n                            Id: 19</br>\n                            Dados:</br>id : 19<br/>nome : Guests<br/>', '2012-11-04 22:01:06'),
	(13, 1, 1, 'usu_recurso_transacao', 'Dados inserido: </br>\n                            Id: 23</br>\n                            Dados:</br>id_recurso : 7<br/>transacao : index<br/>', '2012-11-04 22:04:41'),
	(14, 1, 1, 'usu_recurso_transacao', 'Dados inserido: </br>\n                            Id: 24</br>\n                            Dados:</br>id_recurso : 7<br/>transacao : detalhe<br/>', '2012-11-04 22:04:41'),
	(15, 1, 1, 'usu_recurso', 'Dados inserido: </br>\n                            Id: 7</br>\n                            Dados:</br>area : admin<br/>nome : log<br/>transacao : Array<br/>', '2012-11-04 22:04:42'),
	(16, 3, 1, 'usu_recurso', 'Dados excluidos: </br>\n                            Id: 6</br>\n                            Dados:</br>id : 6<br/>area : teste<br/>nome : teste<br/>', '2012-11-04 22:05:07'),
	(17, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 4</br>\n                            Dados:</br>nome : \' OR username IS NOT NULL OR username = \'<br/>', '2012-11-09 22:13:38'),
	(18, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 5</br>\n                            Dados:</br>nome : 1\' OR \'1\'=\'1<br/>', '2012-11-09 22:13:38'),
	(19, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 6</br>\n                            Dados:</br>nome : 1 UNI/**/ON SELECT ALL FROM WHERE<br/>', '2012-11-09 22:13:39'),
	(20, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 7</br>\n                            Dados:</br>nome : 1 UNION ALL SELECT 1,2,3,4,5,6,name FROM sysObjects WHERE xtype = \'U\' --<br/>', '2012-11-09 22:13:39'),
	(21, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 8</br>\n                            Dados:</br>nome : 1 AND ASCII(LOWER(SUBSTRING((SELECT TOP 1 name FROM sysobjects WHERE xtype=\'U\'), 1, 1))) > 116<br/>', '2012-11-09 22:13:39'),
	(22, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 9</br>\n                            Dados:</br>nome : 1\' AND non_existant_table = \'1<br/>', '2012-11-09 22:13:39'),
	(23, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 10</br>\n                            Dados:</br>nome : 1\'1<br/>', '2012-11-09 22:13:39'),
	(24, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 11</br>\n                            Dados:</br>nome : 1 AND USER_NAME() = \'dbo\'<br/>', '2012-11-09 22:13:40'),
	(25, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 12</br>\n                            Dados:</br>nome : \'; DESC users; --<br/>', '2012-11-09 22:13:40'),
	(26, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 13</br>\n                            Dados:</br>nome : 1\' AND 1=(SELECT COUNT(*) FROM tablenames); --<br/>', '2012-11-09 22:13:40'),
	(27, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 14</br>\n                            Dados:</br>nome : 1 AND 1=1<br/>', '2012-11-09 22:13:40'),
	(28, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 15</br>\n                            Dados:</br>nome : 1 EXEC XP_<br/>', '2012-11-09 22:13:40'),
	(29, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 16</br>\n                            Dados:</br>nome : 1\'1<br/>', '2012-11-09 22:13:41'),
	(30, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 17</br>\n                            Dados:</br>nome : 1\' OR \'1\'=\'1<br/>', '2012-11-09 22:13:41'),
	(31, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 18</br>\n                            Dados:</br>nome : 1\' OR \'1\'=\'1<br/>', '2012-11-09 22:22:40'),
	(32, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 19</br>\n                            Dados:</br>nome : 1 UNI/**/ON SELECT ALL FROM WHERE<br/>', '2012-11-09 22:22:40'),
	(33, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 20</br>\n                            Dados:</br>nome : 1 UNION ALL SELECT 1,2,3,4,5,6,name FROM sysObjects WHERE xtype = \'U\' --<br/>', '2012-11-09 22:22:40'),
	(34, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 21</br>\n                            Dados:</br>nome : 1 AND ASCII(LOWER(SUBSTRING((SELECT TOP 1 name FROM sysobjects WHERE xtype=\'U\'), 1, 1))) > 116<br/>', '2012-11-09 22:22:40'),
	(35, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 22</br>\n                            Dados:</br>nome : 1\' AND non_existant_table = \'1<br/>', '2012-11-09 22:22:40'),
	(36, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 23</br>\n                            Dados:</br>nome : \' OR username IS NOT NULL OR username = \'<br/>', '2012-11-09 22:22:40'),
	(37, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 24</br>\n                            Dados:</br>nome : \'; DESC users; --<br/>', '2012-11-09 22:22:41'),
	(38, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 25</br>\n                            Dados:</br>nome : 1\'1<br/>', '2012-11-09 22:22:41'),
	(39, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 26</br>\n                            Dados:</br>nome : 1\' AND 1=(SELECT COUNT(*) FROM tablenames); --<br/>', '2012-11-09 22:22:41'),
	(40, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 27</br>\n                            Dados:</br>nome : 1 AND USER_NAME() = \'dbo\'<br/>', '2012-11-09 22:22:41'),
	(41, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 28</br>\n                            Dados:</br>nome : 1 AND 1=1<br/>', '2012-11-09 22:22:41'),
	(42, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 29</br>\n                            Dados:</br>nome : 1 EXEC XP_<br/>', '2012-11-09 22:22:42'),
	(43, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 30</br>\n                            Dados:</br>nome : 1\'1<br/>', '2012-11-09 22:22:42'),
	(44, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 31</br>\n                            Dados:</br>nome : 1\' OR \'1\'=\'1<br/>', '2012-11-09 22:22:42'),
	(45, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 32</br>\n                            Dados:</br>nome : 1 UNION ALL SELECT 1,2,3,4,5,6,name FROM sysObjects WHERE xtype = \'U\' --<br/>', '2012-11-09 22:34:17'),
	(46, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 33</br>\n                            Dados:</br>nome : 1 AND ASCII(LOWER(SUBSTRING((SELECT TOP 1 name FROM sysobjects WHERE xtype=\'U\'), 1, 1))) > 116<br/>', '2012-11-09 22:34:17'),
	(47, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 34</br>\n                            Dados:</br>nome : \' OR username IS NOT NULL OR username = \'<br/>', '2012-11-09 22:34:17'),
	(48, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 35</br>\n                            Dados:</br>nome : 1\' AND non_existant_table = \'1<br/>', '2012-11-09 22:34:17'),
	(49, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 36</br>\n                            Dados:</br>nome : 1\' OR \'1\'=\'1<br/>', '2012-11-09 22:34:18'),
	(50, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 37</br>\n                            Dados:</br>nome : 1 UNI/**/ON SELECT ALL FROM WHERE<br/>', '2012-11-09 22:34:18'),
	(51, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 38</br>\n                            Dados:</br>nome : 1\'1<br/>', '2012-11-09 22:34:18'),
	(52, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 39</br>\n                            Dados:</br>nome : \'; DESC users; --<br/>', '2012-11-09 22:34:18'),
	(53, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 40</br>\n                            Dados:</br>nome : 1 AND USER_NAME() = \'dbo\'<br/>', '2012-11-09 22:34:18'),
	(54, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 41</br>\n                            Dados:</br>nome : 1 AND 1=1<br/>', '2012-11-09 22:34:19'),
	(55, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 42</br>\n                            Dados:</br>nome : 1\' AND 1=(SELECT COUNT(*) FROM tablenames); --<br/>', '2012-11-09 22:34:19'),
	(56, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 43</br>\n                            Dados:</br>nome : 1 EXEC XP_<br/>', '2012-11-09 22:34:19'),
	(57, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 44</br>\n                            Dados:</br>nome : 1\'1<br/>', '2012-11-09 22:34:19'),
	(58, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 45</br>\n                            Dados:</br>nome : 1\' OR \'1\'=\'1<br/>', '2012-11-09 22:34:19'),
	(59, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 46</br>\n                            Dados:</br>nome : 1 UNION ALL SELECT 1,2,3,4,5,6,name FROM sysObjects WHERE xtype = \'U\' --<br/>', '2012-11-09 22:36:04'),
	(60, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 47</br>\n                            Dados:</br>nome : 1 AND ASCII(LOWER(SUBSTRING((SELECT TOP 1 name FROM sysobjects WHERE xtype=\'U\'), 1, 1))) > 116<br/>', '2012-11-09 22:36:05'),
	(61, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 48</br>\n                            Dados:</br>nome : 1\' OR \'1\'=\'1<br/>', '2012-11-09 22:36:05'),
	(62, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 49</br>\n                            Dados:</br>nome : \' OR username IS NOT NULL OR username = \'<br/>', '2012-11-09 22:36:05'),
	(63, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 50</br>\n                            Dados:</br>nome : 1 UNI/**/ON SELECT ALL FROM WHERE<br/>', '2012-11-09 22:36:05'),
	(64, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 51</br>\n                            Dados:</br>nome : 1\' AND non_existant_table = \'1<br/>', '2012-11-09 22:36:05'),
	(65, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 52</br>\n                            Dados:</br>nome : 1\'1<br/>', '2012-11-09 22:36:05'),
	(66, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 53</br>\n                            Dados:</br>nome : \'; DESC users; --<br/>', '2012-11-09 22:36:05'),
	(67, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 54</br>\n                            Dados:</br>nome : 1 AND USER_NAME() = \'dbo\'<br/>', '2012-11-09 22:36:06'),
	(68, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 55</br>\n                            Dados:</br>nome : 1\' AND 1=(SELECT COUNT(*) FROM tablenames); --<br/>', '2012-11-09 22:36:06'),
	(69, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 56</br>\n                            Dados:</br>nome : 1 AND 1=1<br/>', '2012-11-09 22:36:06'),
	(70, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 57</br>\n                            Dados:</br>nome : 1 EXEC XP_<br/>', '2012-11-09 22:36:06'),
	(71, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 58</br>\n                            Dados:</br>nome : 1\'1<br/>', '2012-11-09 22:36:06'),
	(72, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 59</br>\n                            Dados:</br>nome : 1\' OR \'1\'=\'1<br/>', '2012-11-09 22:36:07'),
	(73, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 60</br>\n                            Dados:</br>nome : 1 OR 1=1<br/>', '2012-11-09 22:36:07'),
	(74, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 61</br>\n                            Dados:</br>nome : 1\\&amp;#039; OR \\&amp;#039;1\\&amp;#039;=\\&amp;#039;1<br/>', '2012-11-09 23:28:47'),
	(75, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 62</br>\n                            Dados:</br>nome : 1 UNION ALL SELECT 1,2,3,4,5,6,name FROM sysObjects WHERE xtype = \\&amp;#039;U\\&amp;#039; --<br/>', '2012-11-09 23:28:47'),
	(76, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 63</br>\n                            Dados:</br>nome : \\&amp;#039; OR username IS NOT NULL OR username = \\&amp;#039;<br/>', '2012-11-09 23:28:47'),
	(77, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 64</br>\n                            Dados:</br>nome : 1 AND ASCII(LOWER(SUBSTRING((SELECT TOP 1 name FROM sysobjects WHERE xtype=\\&amp;#039;U\\&amp;#039;), 1, 1))) &amp;gt; 116<br/>', '2012-11-09 23:28:47'),
	(78, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 65</br>\n                            Dados:</br>nome : 1\\&amp;#039; AND non_existant_table = \\&amp;#039;1<br/>', '2012-11-09 23:28:47'),
	(79, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 66</br>\n                            Dados:</br>nome : 1 UNI/**/ON SELECT ALL FROM WHERE<br/>', '2012-11-09 23:28:48'),
	(80, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 67</br>\n                            Dados:</br>nome : 1\\&amp;#039; AND 1=(SELECT COUNT(*) FROM tablenames); --<br/>', '2012-11-09 23:28:48'),
	(81, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 68</br>\n                            Dados:</br>nome : 1\\&amp;#039;1<br/>', '2012-11-09 23:28:48'),
	(82, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 69</br>\n                            Dados:</br>nome : 1 AND 1=1<br/>', '2012-11-09 23:28:48'),
	(83, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 70</br>\n                            Dados:</br>nome : 1 AND USER_NAME() = \\&amp;#039;dbo\\&amp;#039;<br/>', '2012-11-09 23:28:48'),
	(84, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 71</br>\n                            Dados:</br>nome : \\&amp;#039;; DESC users; --<br/>', '2012-11-09 23:28:48'),
	(85, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 72</br>\n                            Dados:</br>nome : 1 EXEC XP_<br/>', '2012-11-09 23:28:49'),
	(86, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 73</br>\n                            Dados:</br>nome : 1\\&amp;#039;1<br/>', '2012-11-09 23:28:49'),
	(87, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 74</br>\n                            Dados:</br>nome : 1\\&amp;#039; OR \\&amp;#039;1\\&amp;#039;=\\&amp;#039;1<br/>', '2012-11-09 23:28:49'),
	(88, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 75</br>\n                            Dados:</br>nome : 1 OR 1=1<br/>', '2012-11-09 23:28:49'),
	(89, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 76</br>\n                            Dados:</br>nome : &amp;lt;script&amp;gt;alert(\\&amp;quot;ola\\&amp;quot;)&amp;lt;/script&amp;gt;<br/>', '2012-11-09 23:30:21'),
	(90, 3, 1, 'usu_grupo', 'Dados excluidos: </br>\n                            Id: 76</br>\n                            Dados:</br>id : 76<br/>nome : &amp;lt;script&amp;gt;alert(\\&amp;quot;ola\\&amp;quot;)&amp;lt;/script&amp;gt;<br/>', '2012-11-09 23:31:36'),
	(91, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 77</br>\n                            Dados:</br>nome : \\"teste\\"<br/>', '2012-11-10 00:01:18'),
	(92, 3, 1, 'usu_grupo', 'Dados excluidos: </br>\n                            Id: 77</br>\n                            Dados:</br>id : 77<br/>nome : \\"teste\\"<br/>', '2012-11-10 00:01:35'),
	(93, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 78</br>\n                            Dados:</br>nome : alert(\\"olá\\")<br/>', '2012-11-10 00:01:51'),
	(94, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 79</br>\n                            Dados:</br>nome : 1 UNION ALL SELECT 1,2,3,4,5,6,name FROM sysObjects WHERE xtype = \\\'U\\\' --<br/>', '2012-11-10 00:02:38'),
	(95, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 80</br>\n                            Dados:</br>nome : 1 UNI/**/ON SELECT ALL FROM WHERE<br/>', '2012-11-10 00:02:38'),
	(96, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 81</br>\n                            Dados:</br>nome : 1 AND ASCII(LOWER(SUBSTRING((SELECT TOP 1 name FROM sysobjects WHERE xtype=\\\'U\\\'), 1, 1))) > 116<br/>', '2012-11-10 00:02:39'),
	(97, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 82</br>\n                            Dados:</br>nome : \\\' OR username IS NOT NULL OR username = \\\'<br/>', '2012-11-10 00:02:39'),
	(98, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 83</br>\n                            Dados:</br>nome : 1\\\' OR \\\'1\\\'=\\\'1<br/>', '2012-11-10 00:02:39'),
	(99, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 84</br>\n                            Dados:</br>nome : 1\\\' AND non_existant_table = \\\'1<br/>', '2012-11-10 00:02:39'),
	(100, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 85</br>\n                            Dados:</br>nome : \\\'; DESC users; --<br/>', '2012-11-10 00:02:40'),
	(101, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 86</br>\n                            Dados:</br>nome : 1\\\'1<br/>', '2012-11-10 00:02:40'),
	(102, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 87</br>\n                            Dados:</br>nome : 1\\\' AND 1=(SELECT COUNT(*) FROM tablenames); --<br/>', '2012-11-10 00:02:40'),
	(103, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 88</br>\n                            Dados:</br>nome : 1 AND USER_NAME() = \\\'dbo\\\'<br/>', '2012-11-10 00:02:40'),
	(104, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 89</br>\n                            Dados:</br>nome : 1 AND 1=1<br/>', '2012-11-10 00:02:40'),
	(105, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 90</br>\n                            Dados:</br>nome : 1 EXEC XP_<br/>', '2012-11-10 00:02:40'),
	(106, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 91</br>\n                            Dados:</br>nome : 1\\\'1<br/>', '2012-11-10 00:02:41'),
	(107, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 92</br>\n                            Dados:</br>nome : 1\\\' OR \\\'1\\\'=\\\'1<br/>', '2012-11-10 00:02:41'),
	(108, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 93</br>\n                            Dados:</br>nome : 1 OR 1=1<br/>', '2012-11-10 00:02:41'),
	(109, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 94</br>\n                            Dados:</br>nome : \'\\\\\\"teste\\\\\\"\'<br/>', '2012-11-10 00:28:17'),
	(110, 3, 1, 'usu_grupo', 'Dados excluidos: </br>\n                            Id: 94</br>\n                            Dados:</br>id : 94<br/>nome : \'\\\\\\"teste\\\\\\"\'<br/>', '2012-11-10 00:29:53'),
	(111, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 95</br>\n                            Dados:</br>nome : \'\\\\\\\\\\\\\\"teste\\\\\\\\\\\\\\"\'<br/>', '2012-11-10 00:29:59'),
	(112, 3, 1, 'usu_grupo', 'Dados excluidos: </br>\n                            Id: 95</br>\n                            Dados:</br>id : 95<br/>nome : \'\\\\\\\\\\\\\\"teste\\\\\\\\\\\\\\"\'<br/>', '2012-11-10 00:30:06'),
	(113, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 96</br>\n                            Dados:</br>nome : \'1\\\\\\\\\\\\\\\' OR \\\\\\\\\\\\\\\'1\\\\\\\\\\\\\\\'=\\\\\\\\\\\\\\\'1\'<br/>', '2012-11-10 00:30:19'),
	(114, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 97</br>\n                            Dados:</br>nome : \'1 UNI/**/ON SELECT ALL FROM WHERE\'<br/>', '2012-11-10 00:30:20'),
	(115, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 98</br>\n                            Dados:</br>nome : \'1\\\\\\\\\\\\\\\' AND non_existant_table = \\\\\\\\\\\\\\\'1\'<br/>', '2012-11-10 00:30:20'),
	(116, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 99</br>\n                            Dados:</br>nome : \'1 AND ASCII(LOWER(SUBSTRING((SELECT TOP 1 name FROM sysobjects WHERE xtype=\\\\\\\\\\\\\\\'U\\\\\\\\\\\\\\\'), 1, 1))) > 116\'<br/>', '2012-11-10 00:30:20'),
	(117, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 100</br>\n                            Dados:</br>nome : \'\\\\\\\\\\\\\\\' OR username IS NOT NULL OR username = \\\\\\\\\\\\\\\'\'<br/>', '2012-11-10 00:30:20'),
	(118, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 101</br>\n                            Dados:</br>nome : \'1 UNION ALL SELECT 1,2,3,4,5,6,name FROM sysObjects WHERE xtype = \\\\\\\\\\\\\\\'U\\\\\\\\\\\\\\\' --\'<br/>', '2012-11-10 00:30:20'),
	(119, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 102</br>\n                            Dados:</br>nome : \'1\\\\\\\\\\\\\\\'1\'<br/>', '2012-11-10 00:30:20'),
	(120, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 103</br>\n                            Dados:</br>nome : \'\\\\\\\\\\\\\\\'; DESC users; --\'<br/>', '2012-11-10 00:30:21'),
	(121, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 104</br>\n                            Dados:</br>nome : \'1 AND 1=1\'<br/>', '2012-11-10 00:30:21'),
	(122, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 105</br>\n                            Dados:</br>nome : \'1 EXEC XP_\'<br/>', '2012-11-10 00:30:21'),
	(123, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 106</br>\n                            Dados:</br>nome : \'1\\\\\\\\\\\\\\\' AND 1=(SELECT COUNT(*) FROM tablenames); --\'<br/>', '2012-11-10 00:30:21'),
	(124, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 107</br>\n                            Dados:</br>nome : \'1 AND USER_NAME() = \\\\\\\\\\\\\\\'dbo\\\\\\\\\\\\\\\'\'<br/>', '2012-11-10 00:30:21'),
	(125, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 108</br>\n                            Dados:</br>nome : \'1\\\\\\\\\\\\\\\'1\'<br/>', '2012-11-10 00:30:21'),
	(126, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 109</br>\n                            Dados:</br>nome : teste<br/>', '2012-11-10 00:32:31'),
	(127, 3, 1, 'usu_grupo', 'Dados excluidos: </br>\n                            Id: 109</br>\n                            Dados:</br>id : 109<br/>nome : teste<br/>', '2012-11-10 00:32:33'),
	(128, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 110</br>\n                            Dados:</br>nome : \\\\\\\' OR username IS NOT NULL OR username = \\\\\\\'<br/>', '2012-11-10 00:43:40'),
	(129, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 111</br>\n                            Dados:</br>nome : 1\\\\\\\' OR \\\\\\\'1\\\\\\\'=\\\\\\\'1<br/>', '2012-11-10 00:43:40'),
	(130, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 112</br>\n                            Dados:</br>nome : 1 AND ASCII(LOWER(SUBSTRING((SELECT TOP 1 name FROM sysobjects WHERE xtype=\\\\\\\'U\\\\\\\'), 1, 1))) > 116<br/>', '2012-11-10 00:43:41'),
	(131, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 113</br>\n                            Dados:</br>nome : 1 UNION ALL SELECT 1,2,3,4,5,6,name FROM sysObjects WHERE xtype = \\\\\\\'U\\\\\\\' --<br/>', '2012-11-10 00:43:41'),
	(132, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 114</br>\n                            Dados:</br>nome : 1\\\\\\\' AND non_existant_table = \\\\\\\'1<br/>', '2012-11-10 00:43:41'),
	(133, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 115</br>\n                            Dados:</br>nome : 1 UNI/**/ON SELECT ALL FROM WHERE<br/>', '2012-11-10 00:43:41'),
	(134, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 116</br>\n                            Dados:</br>nome : 1\\\\\\\'1<br/>', '2012-11-10 00:43:41'),
	(135, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 117</br>\n                            Dados:</br>nome : 1 AND USER_NAME() = \\\\\\\'dbo\\\\\\\'<br/>', '2012-11-10 00:43:42'),
	(136, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 118</br>\n                            Dados:</br>nome : \\\\\\\'; DESC users; --<br/>', '2012-11-10 00:43:42'),
	(137, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 119</br>\n                            Dados:</br>nome : 1\\\\\\\' AND 1=(SELECT COUNT(*) FROM tablenames); --<br/>', '2012-11-10 00:43:42'),
	(138, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 120</br>\n                            Dados:</br>nome : 1 AND 1=1<br/>', '2012-11-10 00:43:42'),
	(139, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 121</br>\n                            Dados:</br>nome : 1 EXEC XP_<br/>', '2012-11-10 00:43:42'),
	(140, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 122</br>\n                            Dados:</br>nome : 1\\\\\\\'1<br/>', '2012-11-10 00:43:43'),
	(141, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 123</br>\n                            Dados:</br>nome : 1 OR 1=1<br/>', '2012-11-10 00:43:43'),
	(142, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 124</br>\n                            Dados:</br>nome : 1\\\\\\\' OR \\\\\\\'1\\\\\\\'=\\\\\\\'1<br/>', '2012-11-10 00:43:43'),
	(143, 1, 1, 'usu_grupo', 'Dados inserido: </br>\n                            Id: 125</br>\n                            Dados:</br>nome : \\\\\\"teste\\\\\\"<br/>', '2012-11-10 00:49:19'),
	(144, 3, 1, 'usu_grupo', 'Dados excluidos: </br>\n                            Id: 125</br>\n                            Dados:</br>id : 125<br/>nome : \\\\\\"teste\\\\\\"<br/>', '2012-11-10 00:49:34'),
	(145, 2, 1, 'usu_recurso', 'Os Dados:<br/><br/>id : 1<br/>area : admin<br/>nome : recurso<br/><br/>Foram alterados para:<br/><br/>area : admin<br/>recurso : recurso<br/>id : 1<br/>id_transacao : Array<br/>transacao : Array<br/>', '2013-01-13 16:59:28'),
	(146, 2, 1, 'usu_recurso_transacao', 'Os Dados:<br/><br/>id : 1<br/>id_recurso : 1<br/>transacao : index<br/><br/>Foram alterados para:<br/><br/>id : 1<br/>id_recurso : 1<br/>transacao : index<br/>', '2013-01-13 16:59:30'),
	(147, 2, 1, 'usu_recurso_transacao', 'Os Dados:<br/><br/>id : 2<br/>id_recurso : 1<br/>transacao : add<br/><br/>Foram alterados para:<br/><br/>id : 2<br/>id_recurso : 1<br/>transacao : add<br/>', '2013-01-13 16:59:31'),
	(148, 2, 1, 'usu_recurso_transacao', 'Os Dados:<br/><br/>id : 3<br/>id_recurso : 1<br/>transacao : edit<br/><br/>Foram alterados para:<br/><br/>id : 3<br/>id_recurso : 1<br/>transacao : edit<br/>', '2013-01-13 16:59:31'),
	(149, 2, 1, 'usu_recurso_transacao', 'Os Dados:<br/><br/>id : 4<br/>id_recurso : 1<br/>transacao : delete<br/><br/>Foram alterados para:<br/><br/>id : 4<br/>id_recurso : 1<br/>transacao : delete<br/>', '2013-01-13 16:59:32');
/*!40000 ALTER TABLE `log_transacao` ENABLE KEYS */;


-- Dumping structure for table zend.usu_grupo
CREATE TABLE IF NOT EXISTS `usu_grupo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(160) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table zend.usu_grupo: ~2 rows (approximately)
/*!40000 ALTER TABLE `usu_grupo` DISABLE KEYS */;
INSERT INTO `usu_grupo` (`id`, `nome`) VALUES
	(1, 'Administrador'),
	(3, 'Convidado');
/*!40000 ALTER TABLE `usu_grupo` ENABLE KEYS */;


-- Dumping structure for table zend.usu_grupo_permissao
CREATE TABLE IF NOT EXISTS `usu_grupo_permissao` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_grupo` int(10) NOT NULL DEFAULT '0',
  `id_transacao` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_grupo` (`id_grupo`),
  KEY `id_privilegio` (`id_transacao`),
  CONSTRAINT `FK1_grupo_permissao` FOREIGN KEY (`id_grupo`) REFERENCES `usu_grupo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK2_transacao_permissao` FOREIGN KEY (`id_transacao`) REFERENCES `usu_recurso_transacao` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=970 DEFAULT CHARSET=utf8;

-- Dumping data for table zend.usu_grupo_permissao: ~23 rows (approximately)
/*!40000 ALTER TABLE `usu_grupo_permissao` DISABLE KEYS */;
INSERT INTO `usu_grupo_permissao` (`id`, `id_grupo`, `id_transacao`) VALUES
	(97, 3, 5),
	(98, 3, 20),
	(99, 3, 21),
	(100, 3, 1),
	(101, 3, 9),
	(952, 1, 5),
	(953, 1, 6),
	(954, 1, 7),
	(955, 1, 8),
	(956, 1, 20),
	(957, 1, 21),
	(958, 1, 23),
	(959, 1, 24),
	(960, 1, 18),
	(961, 1, 19),
	(962, 1, 1),
	(963, 1, 2),
	(964, 1, 3),
	(965, 1, 4),
	(966, 1, 9),
	(967, 1, 12),
	(968, 1, 16),
	(969, 1, 17);
/*!40000 ALTER TABLE `usu_grupo_permissao` ENABLE KEYS */;


-- Dumping structure for table zend.usu_recurso
CREATE TABLE IF NOT EXISTS `usu_recurso` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `area` varchar(160) NOT NULL,
  `nome` varchar(160) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table zend.usu_recurso: ~6 rows (approximately)
/*!40000 ALTER TABLE `usu_recurso` DISABLE KEYS */;
INSERT INTO `usu_recurso` (`id`, `area`, `nome`) VALUES
	(1, 'admin', 'recurso'),
	(2, 'admin', 'grupo'),
	(3, 'admin', 'usuario'),
	(4, 'admin', 'permissao'),
	(5, 'admin', 'index'),
	(7, 'admin', 'log');
/*!40000 ALTER TABLE `usu_recurso` ENABLE KEYS */;


-- Dumping structure for table zend.usu_recurso_transacao
CREATE TABLE IF NOT EXISTS `usu_recurso_transacao` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_recurso` int(10) NOT NULL,
  `transacao` varchar(160) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_recurso` (`id_recurso`),
  CONSTRAINT `FK1_recurso_transacao` FOREIGN KEY (`id_recurso`) REFERENCES `usu_recurso` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Dumping data for table zend.usu_recurso_transacao: ~18 rows (approximately)
/*!40000 ALTER TABLE `usu_recurso_transacao` DISABLE KEYS */;
INSERT INTO `usu_recurso_transacao` (`id`, `id_recurso`, `transacao`) VALUES
	(1, 1, 'index'),
	(2, 1, 'add'),
	(3, 1, 'edit'),
	(4, 1, 'delete'),
	(5, 2, 'index'),
	(6, 2, 'add'),
	(7, 2, 'edit'),
	(8, 2, 'delete'),
	(9, 3, 'index'),
	(12, 3, 'add'),
	(16, 3, 'edit'),
	(17, 3, 'delete'),
	(18, 4, 'index'),
	(19, 4, 'add'),
	(20, 5, 'index'),
	(21, 5, 'logout'),
	(23, 7, 'index'),
	(24, 7, 'detalhe');
/*!40000 ALTER TABLE `usu_recurso_transacao` ENABLE KEYS */;


-- Dumping structure for table zend.usu_usuario
CREATE TABLE IF NOT EXISTS `usu_usuario` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_grupo` int(10) NOT NULL,
  `nome` varchar(160) DEFAULT NULL,
  `login` varchar(160) DEFAULT NULL,
  `senha` varchar(100) NOT NULL,
  `email` varchar(160) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `id_grupo` (`id_grupo`),
  CONSTRAINT `FK1_grupo_usuario` FOREIGN KEY (`id_grupo`) REFERENCES `usu_grupo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table zend.usu_usuario: ~2 rows (approximately)
/*!40000 ALTER TABLE `usu_usuario` DISABLE KEYS */;
INSERT INTO `usu_usuario` (`id`, `id_grupo`, `nome`, `login`, `senha`, `email`) VALUES
	(1, 1, 'Hugo Machado', 'hugoamac', 'e10adc3949ba59abbe56e057f20f883e', 'hugoamac@live.com'),
	(3, 3, 'Convidado', 'Convidado', 'e10adc3949ba59abbe56e057f20f883e', 'convidado@ok.com');
/*!40000 ALTER TABLE `usu_usuario` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
