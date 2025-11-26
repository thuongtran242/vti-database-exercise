create database testing_system; 
use testing_system;
create table department(
	department_id int auto_increment primary key,
    department_name varchar(50)
);
create table `position`(
	position_id int auto_increment primary key,
    position_name enum('Dev', 'Test', 'Scrum Master', 'PM')
);
create table `account`(
	account_id int auto_increment primary key,
    email varchar(50),
    user_name varchar(50),
    full_name varchar(50),
    department_id int,
    position_id int,
    create_date date
);
create table `group`(
	group_id int auto_increment primary key,
    group_name varchar(50),
    creator_id int,
    create_date date
);
create table group_account(
	group_id int,
    account_id int,
    join_date date
);
create table type_question(
	type_id int auto_increment primary key,
    type_name enum('Essay', 'Multiple-Choice')
);
create table category_question(
	category_id int auto_increment primary key,
    category_name varchar(50)
);
create table question(
	question_id int auto_increment primary key,
    content text,
    category_id int,
    type_id int,
    creator_id int,
    create_date date
);

create table answer(
	answer_id int auto_increment primary key,
    content text,
    question_id int,
    isCorrect boolean
);
create table exam(
	exam_id int auto_increment primary key,
    `code` int,
    title varchar(50),
    category_id int,
    duration varchar(50),
    creator_id int,
    create_date date
);
create table exam_question(
	exam_id int,
    question_id int
)