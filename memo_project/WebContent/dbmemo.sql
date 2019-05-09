CREATE TABLE member(
       id VARCHAR2(15),
       pass VARCHAR2(10),
       name VARCHAR2(15),
       age NUMBER,
       gender VARCHAR2(10),
       email VARCHAR2(30),
       status NUMBER default 0,
       PRIMARY Key(id)
   );

 insert into member(id, pass, name, age, gender, email, status) 
   values('abcd','1111',＇KIM',44,'여자', 'aaa@aaa.com', 0);

 insert into member(id, pass, name, age, gender, email, status) 
   values('admin','1111',＇LEE',23,'남자', 'bbb@bbb.com', 0);
   
    insert into member(id, pass, name, age, gender, email, status) 
   values('aaa','1111',＇LEE',23,'남자', 'bbb@bbb.com', 0);

 insert into member(id, pass, name, age, gender, email, status) 
   values('bbb','1111',＇LEE',23,'남자', 'bbb@bbb.com', 0);


select * from member;
   
   
drop table memo_Test;

create table memo_Test (
  num number,
  name varchar2(15),
  title varchar2(100),
  pass varchar2(10),
  indate date default sysdate,	
  primary key(num)
  );
  
CREATE SEQUENCE AUTO_SEQ_NUMBER
     INCREMENT BY 1
     START WITH 1
     MAXVALUE  1000
     NOCACHE
     NOCYCLE;

INSERT INTO memo_Test(num, name, title, pass) VALUES(AUTO_SEQ_NUMBER.NEXTVAL,'aaaa', 'TEST','1111');
INSERT INTO memo_Test(num, name, title, pass) VALUES(AUTO_SEQ_NUMBER.NEXTVAL,'admin', 'admin','admin');
INSERT INTO memo_Test(num, name, title, pass) VALUES(AUTO_SEQ_NUMBER.NEXTVAL,'aaaa', 'TEST1','1111');
INSERT INTO memo_Test(num, name, title, pass) VALUES(AUTO_SEQ_NUMBER.NEXTVAL,'admin', 'admin1','admin');
INSERT INTO memo_Test(num, name, title, pass) VALUES(AUTO_SEQ_NUMBER.NEXTVAL,'aaaa', 'TEST2','1111');
INSERT INTO memo_Test(num, name, title, pass) VALUES(AUTO_SEQ_NUMBER.NEXTVAL,'admin', 'admin2','admin');
INSERT INTO memo_Test(num, name, title, pass) VALUES(AUTO_SEQ_NUMBER.NEXTVAL,'aaaa', 'TEST3','1111');
INSERT INTO memo_Test(num, name, title, pass) VALUES(AUTO_SEQ_NUMBER.NEXTVAL,'admin', 'admin3','admin');
INSERT INTO memo_Test(num, name, title, pass) VALUES(AUTO_SEQ_NUMBER.NEXTVAL,'aaaa', 'TEST4','1111');
INSERT INTO memo_Test(num, name, title, pass) VALUES(AUTO_SEQ_NUMBER.NEXTVAL,'admin', 'admin4','admin');




select * from memo_Test;
select * from member;