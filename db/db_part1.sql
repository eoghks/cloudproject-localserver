create database CloudContent ;
use CloudContent ;
show tables;

/****** table drop */
#drop table category;
#drop table content;
#drop table CMS_age;
#drop table CMS_sex;
#drop table error_log ;
#drop table user_info ;
/*******테이블 *********/
################## 카테고리 #################
create table category(
	category_idx int not null auto_increment,
	category_name varchar(100) not null,
	primary key (category_idx),
	unique (category_name)
)engine=InnoDB default charset='utf8';

################## 컨텐츠 #################
create table content(
	content_idx int not null auto_increment,
	content_name varchar(100) not null,
	category_idx int not null,
	cnt int default 0,
	start_date date not null,
	end_date date ,
	unique(content_name),
	primary key(content_idx)
)engine=InnoDB default charset='utf8'; 

################## 유저테이블 #################
#이미 다른 홈페이지에서 회원가입이 되어있는 점을 가만하여 아이디가 중복되는것을 확인하지는 않는다.
#이름은 별로 중요하지 않다.
create table user_info(
	idx int not null auto_increment ,
	uid varchar(100) not null,
	sex varchar(10) not null,
	age int not null,
	primary key(idx),
	unique(uid)
)engine=InnoDB default charset='utf8'; 

################## CMS #################
create table CMS_age(
	content varchar(100) not null primary key,
	10대 int default  0,
	20대 int default  0,
	30대 int default  0,
	40대 int default  0,
	50대이상 int default  0
)engine=InnoDB default charset='utf8'; 

create table CMS_sex(
	content varchar(100) not null primary key,
	남 int default 0,
	여 int default 0
)engine=InnoDB default charset='utf8'; 

################## 오류 #################

create table error_log(
	idx int not null auto_increment ,
	error_date varchar(100) not null,
	sqlmessage varchar(300) not null,
	pos varchar(100) not null,
	primary key(idx)
) engine=InnoDB default charset='utf8'; 

##오류 테이블에 집어넣는건 visual code에서 해야하는 일







