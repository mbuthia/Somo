-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jun 14, 2017 at 12:25 PM
-- Server version: 5.7.16-0ubuntu0.16.04.1
-- PHP Version: 7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `somo`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$36000$DNkGet38pBj7$9D1YWvBv1KFKrhTa1sAObi/86oQm2B4TBabh8fdi+mM=', '2017-05-10 10:19:23.381286', 0, 'test', '', '', 'test3@test.com', 0, 1, '2017-05-10 10:19:17.480905');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2017-05-07 06:00:36.995524'),
(2, 'auth', '0001_initial', '2017-05-07 06:00:48.554939'),
(3, 'admin', '0001_initial', '2017-05-07 06:00:50.904180'),
(4, 'admin', '0002_logentry_remove_auto_add', '2017-05-07 06:00:51.062278'),
(5, 'contenttypes', '0002_remove_content_type_name', '2017-05-07 06:00:52.540187'),
(6, 'auth', '0002_alter_permission_name_max_length', '2017-05-07 06:00:52.697795'),
(7, 'auth', '0003_alter_user_email_max_length', '2017-05-07 06:00:52.872079'),
(8, 'auth', '0004_alter_user_username_opts', '2017-05-07 06:00:52.938434'),
(9, 'auth', '0005_alter_user_last_login_null', '2017-05-07 06:00:53.752808'),
(10, 'auth', '0006_require_contenttypes_0002', '2017-05-07 06:00:53.794108'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2017-05-07 06:00:53.852497'),
(12, 'auth', '0008_alter_user_username_max_length', '2017-05-07 06:00:54.324193'),
(13, 'sessions', '0001_initial', '2017-05-07 06:00:55.154836'),
(14, 'somoapp', '0001_initial', '2017-05-07 06:01:13.974065'),
(15, 'somoapp', '0002_auto_20170419_0110', '2017-05-07 06:01:21.154020'),
(16, 'somoapp', '0003_book_upload', '2017-05-07 06:01:21.903022'),
(17, 'somoapp', '0004_auto_20170422_2105', '2017-05-07 06:01:24.034320');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('9fl5zepdxn0ydzh1fu6cm3a2f23ot1je', 'ZjJjZGI0NGM2NWM1YWQ5YzIxMmMxMzNkZmEzYWYzZWE4OTEyZGY2Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjYyMTE5MDEzYmUyM2UzYzE3ZmJkY2Y5MDQyYmQwMTc5MGE1OGNjYmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-05-24 10:19:23.529445');

-- --------------------------------------------------------

--
-- Table structure for table `somoapp_book`
--

CREATE TABLE `somoapp_book` (
  `id` int(11) NOT NULL,
  `isbn` varchar(80) NOT NULL,
  `title` varchar(80) NOT NULL,
  `description` varchar(80) NOT NULL,
  `year` varchar(7) NOT NULL,
  `semester` varchar(7) NOT NULL,
  `unit` varchar(80) NOT NULL,
  `size` varchar(80) NOT NULL,
  `file_type` varchar(80) NOT NULL,
  `upload` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `somoapp_book_course`
--

CREATE TABLE `somoapp_book_course` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `somoapp_book_user`
--

CREATE TABLE `somoapp_book_user` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `somoapp_course`
--

CREATE TABLE `somoapp_course` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `somoapp_mydownload`
--

CREATE TABLE `somoapp_mydownload` (
  `id` int(11) NOT NULL,
  `date` varchar(80) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `somoapp_mydownload_book`
--

CREATE TABLE `somoapp_mydownload_book` (
  `id` int(11) NOT NULL,
  `mydownload_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `somoapp_myrequest`
--

CREATE TABLE `somoapp_myrequest` (
  `id` int(11) NOT NULL,
  `date` varchar(80) NOT NULL,
  `title` varchar(80) NOT NULL,
  `description` varchar(80) NOT NULL,
  `year` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `unit` varchar(80) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `somoapp_myrequest_course`
--

CREATE TABLE `somoapp_myrequest_course` (
  `id` int(11) NOT NULL,
  `myrequest_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `somoapp_system`
--

CREATE TABLE `somoapp_system` (
  `id` int(11) NOT NULL,
  `app_name` varchar(80) NOT NULL,
  `app_desc` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `somoapp_useraccount`
--

CREATE TABLE `somoapp_useraccount` (
  `id` int(11) NOT NULL,
  `profile` int(11) NOT NULL,
  `mobile` varchar(13) NOT NULL,
  `reg` varchar(50) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `somoapp_useraccount_course_id`
--

CREATE TABLE `somoapp_useraccount_course_id` (
  `id` int(11) NOT NULL,
  `useraccount_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `somoapp_book`
--
ALTER TABLE `somoapp_book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `somoapp_book_course`
--
ALTER TABLE `somoapp_book_course`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `somoapp_book_course_book_id_course_id_37b80608_uniq` (`book_id`,`course_id`),
  ADD KEY `somoapp_book_course_course_id_de6341df_fk_somoapp_course_id` (`course_id`);

--
-- Indexes for table `somoapp_book_user`
--
ALTER TABLE `somoapp_book_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `somoapp_book_user_book_id_user_id_bec53de7_uniq` (`book_id`,`user_id`),
  ADD KEY `somoapp_book_user_user_id_90e7d789_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `somoapp_course`
--
ALTER TABLE `somoapp_course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `somoapp_mydownload`
--
ALTER TABLE `somoapp_mydownload`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `somoapp_mydownload_book`
--
ALTER TABLE `somoapp_mydownload_book`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `somoapp_mydownload_book_mydownload_id_book_id_87929a7c_uniq` (`mydownload_id`,`book_id`),
  ADD KEY `somoapp_mydownload_book_book_id_876f9f29_fk_somoapp_book_id` (`book_id`);

--
-- Indexes for table `somoapp_myrequest`
--
ALTER TABLE `somoapp_myrequest`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `somoapp_myrequest_course`
--
ALTER TABLE `somoapp_myrequest_course`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `somoapp_myrequest_course_myrequest_id_course_id_be0cd34e_uniq` (`myrequest_id`,`course_id`),
  ADD KEY `somoapp_myrequest_course_course_id_2ee44e99_fk_somoapp_course_id` (`course_id`);

--
-- Indexes for table `somoapp_system`
--
ALTER TABLE `somoapp_system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `somoapp_useraccount`
--
ALTER TABLE `somoapp_useraccount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `somoapp_useraccount_course_id`
--
ALTER TABLE `somoapp_useraccount_course_id`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `somoapp_useraccount_cour_useraccount_id_course_id_644a518c_uniq` (`useraccount_id`,`course_id`),
  ADD KEY `somoapp_useraccount__course_id_9e5ce5f5_fk_somoapp_c` (`course_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `somoapp_book`
--
ALTER TABLE `somoapp_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `somoapp_book_course`
--
ALTER TABLE `somoapp_book_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `somoapp_book_user`
--
ALTER TABLE `somoapp_book_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `somoapp_course`
--
ALTER TABLE `somoapp_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `somoapp_mydownload`
--
ALTER TABLE `somoapp_mydownload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `somoapp_mydownload_book`
--
ALTER TABLE `somoapp_mydownload_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `somoapp_myrequest`
--
ALTER TABLE `somoapp_myrequest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `somoapp_myrequest_course`
--
ALTER TABLE `somoapp_myrequest_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `somoapp_system`
--
ALTER TABLE `somoapp_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `somoapp_useraccount`
--
ALTER TABLE `somoapp_useraccount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `somoapp_useraccount_course_id`
--
ALTER TABLE `somoapp_useraccount_course_id`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
