CREATE TABLE IF NOT EXISTS `webtest`.`member` (
  `id` VARCHAR(10) NOT NULL,
  `passwd` VARCHAR(20) NOT NULL,
  `mname` VARCHAR(20) CHARACTER SET 'big5' NOT NULL,
  `tel` VARCHAR(14) NULL,
  `email` VARCHAR(50) NOT NULL,
  `zipcode` VARCHAR(7) NULL,
  `address1` VARCHAR(150) NULL,
  `address2` VARCHAR(50) NULL,
  `job` VARCHAR(20) NOT NULL,
  `mdate` DATE NOT NULL,
  `fname` VARCHAR(50) NOT NULL DEFAULT 'member.jpg',
  `grade` VARCHAR(1) NOT NULL DEFAULT 'H',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;

-- create 
INSERT INTO member(id, passwd, mname, tel, email, zipcode,  
address1,address2, job, mdate, fname, grade) 
VALUES('user1', '1234', '개발자1', '123-1234', 'email1@mail.com',  
'123-123','인천시', '남동구' ,'A01', sysdate(), 'member.jpg', 'H'); 
 
INSERT INTO member(id, passwd, mname, tel, email, zipcode,  
address1,address2, job, mdate, fname, grade) 
VALUES('user2', '1234', '개발자2', '123-1234', 'email2@mail.com',  
'123-123','광명시','남동구' ,'A01', sysdate(), 'man.jpg', 'H'); 
 
INSERT INTO member(id, passwd, mname, tel, email, zipcode,  
address1,address2, job, mdate, fname, grade) 
VALUES('user3', '1234', '개발자3', '123-1234', 'email3@mail.com',  
'123-123','용인시','남동구' ,'A01', sysdate(), 'myface.jpg', 'H'); 
 
-- 관리자 계정
INSERT INTO member(id, passwd, mname, tel, email, zipcode,  
address1,address2, job, mdate, fname, grade) 
VALUES('admin', '1234', '관리자', '02-1234-1234', 'admin@mail.com',  
'123-123','서울시 서초구','남부터미널' ,'A01', sysdate(), 'member.jpg', 'A');  
 
-- 중복 아이디 검사 관련 SQL 
-- 0: 중복 아님, 1: 중복  
SELECT COUNT(id)  
FROM member  
WHERE id='user1'; 
 
 
-- 이메일 중복 확인
SELECT COUNT(email) as cnt  
FROM member  
WHERE email='email3@mail.com'; 
 
 
-- user1 회원 정보 보기 
SELECT id, passwd, mname, tel, email, zipcode, address1, address2, 
    job, mdate, fname, grade 
FROM member  
WHERE id='user1'; 
 
 
-- 회원 사진 이미지의 수정
UPDATE member 
SET fname='' 
WHERE id='user1'; 
 
 
-- 패스워드 변경
UPDATE member
SET passwd='1234'
WHERE id='';
 
 
-- 회원 정보 수정 
UPDATE member  
SET passwd='TEST',
tel='123-123', 
email='email10',
zipcode='TEST',  
    address1='수원', 
    address2='팔달구', 
    job='TEST'
WHERE id = 'user3'; 
 
 
-- 'user3' 회원 삭제 
DELETE FROM member WHERE id='user3';
 
 
-- 로그인 관련 SQL 
SELECT COUNT(id) as cnt 
FROM member 
WHERE id = 'user1' AND passwd = '1234';  
 
 
 
-- list 
SELECT id, mname, tel, email, zipcode, address1, 
address2, fname
FROM member
where mname like '%홍%'
ORDER BY mdate DESC 
limit 0,3;