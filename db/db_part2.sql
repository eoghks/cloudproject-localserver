use CloudContent  ;

#### ���ο� ī�װ� ���� �Լ� ####
drop procedure if exists insertCategory;
delimiter $$
create procedure insertCategory(in name varchar(100))
begin
	insert into category(category_name) values(name);
end $$
delimiter ;

#### ���ο� content �Է� �Լ� ####
drop procedure if exists insertContent;
delimiter $$
create procedure insertContent(in name varchar(100), in c_name varchar(100))
begin
	declare idx int;
	select category_idx into idx from category where category_name=c_name ;
	insert into content(content_name, category_idx, start_date) values(name, idx, NOW());
	insert into CMS_age(content) values(name); 	
	insert into CMS_sex(content) values(name); 	
end $$
delimiter ;

#### content �Խ� ���� �Լ� ####
drop procedure if exists exitContent;
delimiter $$
create procedure exitContent(in name varchar(100))
begin
	update content set end_date=NOW() where content_name=name; 
end $$
delimiter ;

/***************** ���� ������ db���� ����� �Լ� *********************/

#### ������ �����ϴ��� Ȯ���ϴ� �Լ� ####
drop procedure if exists check_user;
delimiter $$
create procedure check_user(in user_id varchar(100), in user_sex varchar(10), in user_age int )
begin
	declare user_idx int;
	set user_idx =-1;
	select idx into user_idx from user_info where user_id=uid;
	if user_idx=-1 then insert into user_info(uid,sex,age) values (user_id, user_sex, user_age);
	end if;
end $$
delimiter ;

/***************** ���� �ؿ��� CMS���� ����� �Լ� *********************/
###���� ���õ� ī�װ� CMS####
create table sex_category(
		category_name varchar(100) not null primary key,
		���� int default 0,
		���� int default 0
	)engine=InnoDB default charset='utf8';

drop procedure if exists CMS_category_sex_part1;
delimiter $$
create procedure CMS_category_sex_part1()
begin
	
	declare idx int;
	declare i int;
	set i=1;

	select max(category_idx) into idx from category ;
	drop table sex_category; 
	create table sex_category(
		category_name varchar(100) not null primary key,
		���� int default 0,
		���� int default 0
	)engine=InnoDB default charset='utf8';
	
    ####���� ī��Ʈ####
	category_loop:loop
		if i>idx then leave category_loop ;
		end if;
		call CMS_category_sex_part2(i);
		set i = i+1;
	end loop category_loop;
	
	select * from sex_category ;
	
end $$
delimiter ;

/*****/
drop procedure if exists CMS_category_sex_part2;
delimiter $$
create procedure CMS_category_sex_part2(in idx int)
begin
	declare man int;
	declare men_total int;
	declare woman int;
	declare women_total int;
	declare name varchar(100);
	declare c_name varchar(100);
	declare endOfRow boolean default false;
	declare cur1 cursor for select content_name from content where category_idx=idx;
	declare continue handler for not found set endOfRow =true;
	
	set men_total =0 ;
	set women_total =0;
	open cur1;
	cursor_loop:loop
		fetch cur1 into name;
		if endOfRow then leave cursor_loop ;
		end if;
		select ��, �� into man, woman  from CMS_sex where content=name;
		set men_total = men_total + man ;
		set women_total =women_total + woman ;
	end loop cursor_loop;
	
	select category_name into c_name from category where category_idx = idx;
	insert into sex_category (category_name, ����, ����)values (c_name, men_total, women_total);
	
end $$
delimiter ;

#call CMS_category_sex_part1();
select * from sex_category;

###���� ���õ� ī�װ� CMS####
create table age_category(
		category_name varchar(100) not null primary key,
		10�� int default 0,
		20�� int default 0,
		30�� int default 0,
		40�� int default 0,
		50���̻� int default 0
	)engine=InnoDB default charset='utf8';

drop procedure if exists CMS_category_age_part1;
delimiter $$
create procedure CMS_category_age_part1()
begin
	
	declare idx int;
	declare i int;
	set i=1;

	select max(category_idx) into idx from category ;
	drop table age_category;
	create table age_category(
		category_name varchar(100) not null primary key,
		10�� int default 0,
		20�� int default 0,
		30�� int default 0,
		40�� int default 0,
		50���̻� int default 0
	)engine=InnoDB default charset='utf8';
	
    ####���� ī��Ʈ####
	category_loop:loop
		if i>idx then leave category_loop ;
		end if;
		call CMS_category_age_part2(i);
		set i = i+1;
	end loop category_loop;
	
	select * from age_category ;
	 
end $$
delimiter ;

drop procedure if exists CMS_category_age_part2;
delimiter $$
create procedure CMS_category_age_part2(in idx int)
begin
	declare teenage int;
	declare teenage_total int;
	declare twenty int;
	declare twenty_total int;
	declare thirty int;
	declare thirty_total int;
	declare forty int;
	declare forty_total int;
	declare fifty_over int;
	declare fifty_over_total int;
	declare name varchar(100);
	declare c_name varchar(100);
	declare endOfRow boolean default false;
	declare cur1 cursor for select content_name from content where category_idx=idx;
	declare continue handler for not found set endOfRow =true;
	
	set teenage_total =0 ;
	set twenty_total =0;
	set thirty_total =0 ;
	set forty_total =0;
	set fifty_over_total =0;
	open cur1;
	cursor_loop:loop
		fetch cur1 into name;
		if endOfRow then leave cursor_loop ;
		end if;
		select 10��,20��, 30��, 40��, 50���̻� into teenage, twenty, thirty, forty, fifty_over  from CMS_age where content=name;
		set teenage_total = teenage_total + teenage ;
		set twenty_total = twenty_total + twenty ;
		set thirty_total = thirty_total + thirty ;
		set forty_total = forty_total + forty ;
		set fifty_over_total = fifty_over_total + fifty_over ;
	end loop cursor_loop;
	
	select category_name into c_name from category where category_idx = idx;
	insert into age_category values (c_name, teenage_total, twenty_total ,thirty_total, forty_total , fifty_over_total);
	
end $$
delimiter ;

#call CMS_category_age_part1();
select * from age_category;


/************CMS ���� �Լ�*************/
/**visual code���� ���**/
drop procedure if exists UpdateCMS;
delimiter $$
create procedure UpdateCMS(in contentname varchar(100), in userid varchar(100))
begin
	declare uage int; 
	declare usex varchar(10);
	declare ageCnt int;
	declare sexCnt int;
	update content set cnt=cnt+1 where content_name=contentname; 
	select sex, age into usex, uage from user_info ui where uid=userid;
	#���� 
	if usex="��" THEN select �� into sexCnt from CMS_sex  where content=contentname;
		update CMS_sex set ��=sexCnt+1 where content=contentname; 
	else select �� into sexCnt from CMS_sex where content=contentname;
		update CMS_sex set ��=sexCnt+1 where content=contentname; 
	end if;
	#����
	
	if uage>=50 then select 50���̻� into ageCnt from CMS_age  where content=contentname;
		 update CMS_age set 50���̻�=ageCnt+1 where content=contentname; 
	elseif uage>=40 then select 40�� into ageCnt from CMS_age  where content=contentname;
		 update CMS_age set 40��=ageCnt+1 where content=contentname;
	elseif uage>=30 then select 30�� into ageCnt from CMS_age  where content=contentname;
		 update CMS_age set 30��=ageCnt+1 where content=contentname; 
	elseif uage>=20 then select 20�� into ageCnt from CMS_age  where content=contentname;
		 update CMS_age set 20��=ageCnt+1 where content=contentname;
	elseif uage>=10 then select 10�� into ageCnt from CMS_age  where content=contentname;
		 update CMS_age set 10��=ageCnt+1 where content=contentname;
	end if;
end $$
delimiter ;