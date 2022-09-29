--회원 더미데이터
insert into member (mem_id, mem_pw, mem_name, mem_birth, mem_passport, mem_phone, mem_gender)
values ('gahee', '1234', '김가희', '1997-02-17', 'M12345678', '010-1111-2222','여성');
insert into member (mem_id, mem_pw, mem_name, mem_birth, mem_passport, mem_phone, mem_gender)
values ('nadong', '1234', '김나형', '1999-12-23', 'M12345678', '010-6666-2222','여성');
insert into member (mem_id, mem_pw, mem_name, mem_birth, mem_passport, mem_phone, mem_gender)
values ('minseon', '1234', '김민선', '1996-01-01', 'M12345678', '010-2222-3333','여성');
insert into member (mem_id, mem_pw, mem_name, mem_birth, mem_passport, mem_phone, mem_gender)
values ('0mo', '1234', '구영모', '1997-11-17', 'M12345678', '010-3424-6345','남성');
insert into member (mem_id, mem_pw, mem_name, mem_birth, mem_passport, mem_phone, mem_gender)
values ('jinsoo',  '1234', '박진수', '1995-05-27', 'M12345678', '010-5656-2323','남성');

insert into member (mem_id, mem_pw, mem_name, mem_birth, mem_passport, mem_phone, mem_gender)
values ('admin', 'admin', ' ', '2100-01-01', ' ', ' ',' ');
select * from member;

select * from cart;

--고객센터 더미데이터
insert into cs(cs_no,cs_title, cs_content, member_mem_id) values (cs_seq.nextval,'질문있어요', '이건 어떻게 하나요', 'minseon');
insert into cs(cs_no,cs_title, cs_content, member_mem_id) values (cs_seq.nextval,'질문2', '이건 어떻게 하나요2', 'nadong');
insert into cs(cs_no,cs_title, cs_content, member_mem_id) values (cs_seq.nextval,'질문3', '이건 어떻게 하나요3', 'jinsoo');
insert into cs(cs_no,cs_title, cs_content, member_mem_id) values (cs_seq.nextval,'질문4', '이건 어떻게 하나요4', '0mo');

select * from cs;

--주문 더미데이터
INSERT into orders(orders_no,member_mem_id) VALUES (o_seq.nextval,'gahee');
INSERT into orders(orders_no,member_mem_id) VALUES (o_seq.nextval,'nadong');
INSERT into orders(orders_no,member_mem_id) VALUES (o_seq.nextval,'minseon');
INSERT into orders(orders_no,member_mem_id) VALUES (o_seq.nextval,'0mo');
INSERT into orders(orders_no,member_mem_id) VALUES (o_seq.nextval,'jinsoo');

select * from orders;



select * from product;

--주문상세 더미데이터
insert into orders_detail(odetail_no,product_prod_no, orders_orders_no) values(od_seq.nextval,1,1);
insert into orders_detail(odetail_no,product_prod_no, orders_orders_no) values(od_seq.nextval,4,2);
insert into orders_detail(odetail_no,product_prod_no, orders_orders_no) values(od_seq.nextval,3,3);
insert into orders_detail(odetail_no,product_prod_no, orders_orders_no) values(od_seq.nextval,2,4);
insert into orders_detail(odetail_no,product_prod_no, orders_orders_no) values(od_seq.nextval,5,5);

select * from orders_detail;

INSERT INTO cart(cart_no, cart_amount, product_prod_no, member_mem_id) 
VALUES(c_seq.nextval,1,1,'gahee');
INSERT INTO cart(cart_no, cart_amount, product_prod_no, member_mem_id) 
VALUES(c_seq.nextval,2,2,'gahee');
INSERT INTO cart(cart_no, cart_amount, product_prod_no, member_mem_id) 
VALUES(c_seq.nextval,3,3,'gahee');
INSERT INTO cart(cart_no, cart_amount, product_prod_no, member_mem_id) 
VALUES(c_seq.nextval,4,4,'gahee');
----장바구니상세 더미데이터
--INSERT INTO cart_detail VALUES(cd_seq.nextval,1,1,1);
--INSERT INTO cart_detail VALUES(cd_seq.nextval,2,1,2);
--INSERT INTO cart_detail VALUES(cd_seq.nextval,3,1,3);
--INSERT INTO cart_detail VALUES(cd_seq.nextval,4,1,4);
--
--select * from cart_detail;

--주문뷰 확인
select * from orders_view;
--장바구니뷰 확인
select * from carts_view;

commit