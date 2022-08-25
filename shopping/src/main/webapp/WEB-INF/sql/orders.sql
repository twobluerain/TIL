use webtest;
drop table order_detail  ;
drop table orders  ;
/**********************************/
/* Table Name: 주문 */
/**********************************/
CREATE TABLE orders(
orderno                      int    NOT NULL  PRIMARY KEY auto_increment,  -- 주문번호
id                           VARCHAR(10)  NOT NULL,                      -- 아이디(F)
mname                        VARCHAR(20)  NOT NULL,                      -- 주문자 이름
odate                        DATE         NOT NULL,                     -- 주문날짜
ostate                       VARCHAR(50) default '배송준비중' NOT NULL ,   -- 주문상태
total                        int  NOT NULL,                     -- 총합금액
payment                      VARCHAR(50)  NOT NULL,             -- 결제정보
reqtext                      varchar(50)  not null,             -- 요청메세지

  FOREIGN KEY (id) REFERENCES member(id)
);


/**********************************/
/* Table Name: 주문 상세 */
/**********************************/
CREATE TABLE order_detail(
odno                         int  NOT NULL  PRIMARY KEY auto_increment, -- 주문상세번호
orderno                      int  NOT NULL,                     -- 주문번호(F)     
contentsno                   int  NULL ,                        -- 상품번호(F)
quantity                     int  NOT NULL,                     -- 수량
pname                        VARCHAR(50)  NOT NULL,             -- 상품이름
size                         Varchar(3)  not null,                     -- 사이즈
  FOREIGN KEY (contentsno) REFERENCES contents (contentsno),
  FOREIGN KEY (orderno) REFERENCES orders (orderno)
);

select * from member;
-- 주문1
insert into orders(id, mname, odate , total, payment,reqtext)
values('user1','개발자1',sysdate(), 153000,'신용카드', '문앞에 놓아주세요');

select * from orders;

insert into order_detail(
orderno , contentsno, quantity,  pname ,size)
values(1,1,2,'Mega Ripped Jeans', 'M');

insert into order_detail(
orderno,  contentsno,  quantity,  pname, size)
values(1,2,1,'Crocodile bag', '0');

-- 주문 2
-- SELECT DATE_ADD(sysdate(), INTERVAL 1 DAY); 
insert into orders(id, mname, odate, total, payment,reqtext)
values('user1','개발자1',DATE_ADD(sysdate(), INTERVAL 1 DAY)
,153000,'신용카드','문앞에 놓아주세요');

SELECT LAST_INSERT_ID();
select * from orders;

insert into order_detail(
orderno , contentsno, quantity,   pname, size)
values(2,1,2,'Mega Ripped Jeans', 'S');

insert into order_detail(
orderno,  contentsno,  quantity,  pname, size)
values(2,1,1,'Crocodile bag', '0');

select * from order_detail;

-- 3개 테이블의 조인문 작성

select  m.id, m.mname, m.fname, m.zipcode, m.address1, m.address2,
         o.orderno,o.odate,o.total,o.ostate,o.reqtext, d.quantity,d.contentsno,d.pname
 from  member m left outer join orders o
    on  m.id = o.id left outer join order_detail d
    on  o.orderno = d.orderno
where  m.id='user1';

SELECT LAST_INSERT_ID();

delete from order_detail;
delete from orders;

-- 2개 조인
select o.id,o.mname, o.orderno,o.odate,o.total,o.ostate,o.reqtext, d.quantity,d.contentsno,d.pname, d.size
 from  orders o inner join order_detail d
    on  o.orderno = d.orderno
 order by orderno desc
 limit 0, 10;