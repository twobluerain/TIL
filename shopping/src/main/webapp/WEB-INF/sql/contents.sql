use webtest;
CREATE TABLE IF NOT EXISTS `webtest`.`category` (
  `cateno` INT NOT NULL AUTO_INCREMENT, -- 분류번호
  `catename` VARCHAR(50) NOT NULL,      -- 분류명
  `categrpno` INT NULL, -- 상위번호
  PRIMARY KEY (`cateno`),
  FOREIGN KEY (`categrpno`) REFERENCES category(`cateno`)
);
 
insert into category(catename, categrpno)
values('Jean', null);
insert into category(catename, categrpno)
values('Bag', null);
insert into category(catename, categrpno)
values('Shoes', null);
        
select cateno, catename
from category
where categrpno is null;
   
   
CREATE TABLE IF NOT EXISTS `webtest`.`contents` (
  `contentsno` INT NOT NULL AUTO_INCREMENT, -- 상품번호
  `cateno` INT NULL,                        -- 분류번호
  `pname` VARCHAR(50) NOT NULL,             -- 상품명
  `price` INT NOT NULL,                     -- 가격
  `filename` VARCHAR(100) NULL,             -- 상품이미지
  `detail` LONGTEXT NOT NULL,               -- 상세내용
  `rdate` DATE NOT NULL,                    -- 등록일
  `stock` INT NOT NULL DEFAULT 0,           -- 재교량
  PRIMARY KEY (`contentsno`),
  FOREIGN KEY (`cateno`) REFERENCES category (`cateno`)
 );
 
insert into contents(cateno, pname, price, filename, detail, rdate, stock)
values(1, 'Ripped Skinny Jeans', 
50000, 'jeans2.jpg','찢어진 스키니 청바지 입니다.',sysdate(),10);   

insert into contents(cateno, pname, price, filename, detail, rdate, stock)
values(1, '스키니 찢어진 청바지', 
40000, 'jeans1.jpg','슬립한 스키니를 입으면 날씬하고 예쁩니다. 여름에서 시원한 청바지로 맵시를 돋보일 수 있습니다.',sysdate(),10); 

insert into contents(cateno, pname, price, filename, detail, rdate, stock)
values(1, '옅은색 청바지', 
50000, 'jeans3.jpg','부드러운 촉감의 청바지 입니다. 색상이 옅은 청색으로 고급스럽게 코디하여 입을 수 있습니다.',sysdate(),10); 

insert into contents(cateno, pname, price, filename, detail, rdate, stock)
values(1, '기본형 청바지', 
30000, 'jeans4.jpg','기본형 청바지는 다양한 셔츠와 잘 어울립니다. 기본형 청바지로 편하게 코디하세요',sysdate(),10); 

insert into contents(cateno, pname, price, filename, detail, rdate, stock)
values(1, '찢어진 고급 청바지', 
50000, 'jeans4.jpg','고급 청바지는 외출시 맵시를 자랑할 수 있습니다. 어떠한 옷과도 잘 어울립니다.',sysdate(),10); 

insert into contents(cateno, pname, price, filename, detail, rdate, stock)
values(1, '스키니 청바지', 
40000, 'jeans1.jpg','스키니 청바지로 편하게 코디하세요, 외출시 가볍게 입을 수 있어 좋습니다.',sysdate(),10); 

insert into contents(cateno, pname, price, filename, detail, rdate, stock)
values(2, '명품 핸드백', 
50000, 'bag1.jpg','고풍스럽런 명품핸드백 너무 예쁩니다. 인기만점 핸드백을 겟 하세요',sysdate(),10); 

insert into contents(cateno, pname, price, filename, detail, rdate, stock)
values(2, '귀여운 숄더백', 
40000, 'bag2.jpg','캐쥬얼 복장과 잘 어울립니다. 귀엽고 예쁜 가방입니다.',sysdate(),10); 

insert into contents(cateno, pname, price, filename, detail, rdate, stock)
values(2, '미니 숄더백', 
40000, 'bag3.jpg','너무 귀엽고 사랑스러운 숄더백 입니다. 귀엽고 예쁜게 코디하세요.',sysdate(),10); 

insert into contents(cateno, pname, price, filename, detail, rdate, stock)
values(2, '고풍스런 복조리 가방', 
50000, 'bag4.jpg','토드백처럼 편하게 사용할 수 있습니다. 내용물이 많이 들어갑니다. 너무 예쁜 가방입니다.',sysdate(),10); 

insert into contents(cateno, pname, price, filename, detail, rdate, stock)
values(2, '멋장이 가방', 
60000, 'bag5.jpg','즐거운 여행에 멋내기 좋은 가방입니다. 멋진 여행동안 우화하게 코디하세요',sysdate(),10); 

insert into contents(cateno, pname, price, filename, detail, rdate, stock)
values(2, '라탄 가방', 
60000, 'bag6.png','인기만점 라탄 가방입니다. 여름에 예쁘게 코디하세요',sysdate(),10);

select contentsno, cateno, pname, price, filename, detail, stock 
from contents ;

update contents
set filename = 'bag6.png'
where contentsno = 12;
