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
/*******���̺� *********/
################## ī�װ� #################
create table category(
	category_idx int not null auto_increment,
	category_name varchar(100) not null,
	primary key (category_idx),
	unique (category_name)
)engine=InnoDB default charset='utf8';

################## ������ #################
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

################## �������̺� #################
#�̹� �ٸ� Ȩ���������� ȸ�������� �Ǿ��ִ� ���� �����Ͽ� ���̵� �ߺ��Ǵ°��� Ȯ�������� �ʴ´�.
#�̸��� ���� �߿����� �ʴ�.
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
	10�� int default  0,
	20�� int default  0,
	30�� int default  0,
	40�� int default  0,
	50���̻� int default  0
)engine=InnoDB default charset='utf8'; 

create table CMS_sex(
	content varchar(100) not null primary key,
	�� int default 0,
	�� int default 0
)engine=InnoDB default charset='utf8'; 

################## ���� #################

create table error_log(
	idx int not null auto_increment ,
	error_date varchar(100) not null,
	sqlmessage varchar(300) not null,
	pos varchar(100) not null,
	primary key(idx)
) engine=InnoDB default charset='utf8'; 

##���� ���̺� ����ִ°� visual code���� �ؾ��ϴ� ��







