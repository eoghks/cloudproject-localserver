use CloudContent  ;
/*******���̺� �Է��ϱ� *********/
################## ī�װ� #################
call insertCategory("cosmetic");
call insertCategory ("fashion");
call insertCategory ("sport");
call insertCategory ("accessory");

################## ������ #################
call insertContent("earing", "accessory");
call insertContent("neckless", "accessory");
call insertContent("foundation", "cosmetic");
call insertContent("perfume", "cosmetic");
call insertContent("bottom", "fashion");
call insertContent("top", "fashion");
call insertContent("leisure", "sport");
call insertContent("outdoor", "sport");


##content �Խ� ����##
#call exitContent("���"); ##����� ������ ������ ������ �Խ�����ð� �Է�


################## ���� #################
insert into user_info (uid, sex, age) values("jhon", "��", 15);
insert into user_info (uid, sex, age) values("ryze", "��", 43);

insert into user_info (uid, sex, age) values("hailee", "��", 39);
insert into user_info (uid, sex, age) values("eddile", "��", 52);

call check_user("diana","��", 24);
call check_user("aaron", "��", 50);

################## CMS�� �׽�Ʈ #################
/*
update CMS_sex set ��=1 where content="�ٳ���";
update CMS_age set 20��=1 where content="�ٳ���";
update content set cnt=1 where content_name="�ٳ���";
*/




/*******���̺� select *********/
select * from category ;
select * from content;
#select category_idx, path from content  where content_name="���" ; //���ν��� ���߽� Ȯ�ο� �ڵ�
#select category_name from category  where category_idx=1; //���ν��� ���߽� Ȯ�ο� �ڵ�
select * from user_info;
select *from error_log;
select * from CMS_age;
select * from CMS_sex;
select * from age_category;
select * from sex_category;




/***************** *********************/

/*
##test##
create table date_test(
	idx int not null auto_increment,
	test varchar(100) not null,
	primary key(idx)
)engine=InnoDB default charset='utf8'; 
set @a=NOW();
select @a;

insert into date_test (test) values (@a);

select *from date_test ;

drop table date_test;

*/



/*****�߰��Ȱ�*****/
/***********CMS*****************/
call CMS_category_age_part1();
call CMS_category_sex_part1();
###���� �Լ� ���� �Ұ� ###
/*****�̸� sql �ۼ� �� ���� �ϴ� ��� ****/ 

#���� ��ȣ ������ ##���� ���� ����
select ��/**/,content from CMS_sex order by �� desc;
#���̴뺰 ��ȣ ������  ##20�븦 ���ϴ� ���̴�� ����
select 20��/**/,content from CMS_age order by 20�� desc;
#���� ��ȣ ������
select cnt/**/,content_name from content order by cnt desc;
#���� ��ȣ ī�װ� ##������ �������� ����
select ����,category_name from sex_category order by ���� desc;
#���̴뺰 ��ȣ ī�װ� ##20�븦 ���ϴ� ���̴�� ����
select 20��/**/,category_name from age_category order by 20�� desc;
