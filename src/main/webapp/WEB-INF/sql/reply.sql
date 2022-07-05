 create table reply(
   rnum int not null auto_increment primary key,
   content varchar(500) not null,
   regdate date not null,
   id varchar(10) not null,
   contentsno int(7) not null,
   foreign key (contentsno) references contents(contentsno)
);
select * from reply;

insert into reply(content, regdate, id, contentsno)
values('의견입니다.',sysdate(),'user1',2);