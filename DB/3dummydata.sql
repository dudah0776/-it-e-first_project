--ȸ�� ���̵�����
insert into member (mem_id, mem_pw, mem_name, mem_birth, mem_passport, mem_phone, mem_gender)
values ('gahee', '1234', '�谡��', '1997-02-17', 'M12345678', '010-1111-2222','����');
insert into member (mem_id, mem_pw, mem_name, mem_birth, mem_passport, mem_phone, mem_gender)
values ('nadong', '1234', '�質��', '1999-12-23', 'M12345678', '010-6666-2222','����');
insert into member (mem_id, mem_pw, mem_name, mem_birth, mem_passport, mem_phone, mem_gender)
values ('minseon', '1234', '��μ�', '1996-01-01', 'M12345678', '010-2222-3333','����');
insert into member (mem_id, mem_pw, mem_name, mem_birth, mem_passport, mem_phone, mem_gender)
values ('0mo', '1234', '������', '1997-11-17', 'M12345678', '010-3424-6345','����');
insert into member (mem_id, mem_pw, mem_name, mem_birth, mem_passport, mem_phone, mem_gender)
values ('jinsoo',  '1234', '������', '1995-05-27', 'M12345678', '010-5656-2323','����');

insert into member (mem_id, mem_pw, mem_name, mem_birth, mem_passport, mem_phone, mem_gender)
values ('admin', 'admin', ' ', '2100-01-01', ' ', ' ',' ');
select * from member;

select * from cart;

--������ ���̵�����
insert into cs(cs_no,cs_title, cs_content, member_mem_id) values (cs_seq.nextval,'�����־��', '�̰� ��� �ϳ���', 'minseon');
insert into cs(cs_no,cs_title, cs_content, member_mem_id) values (cs_seq.nextval,'����2', '�̰� ��� �ϳ���2', 'nadong');
insert into cs(cs_no,cs_title, cs_content, member_mem_id) values (cs_seq.nextval,'����3', '�̰� ��� �ϳ���3', 'jinsoo');
insert into cs(cs_no,cs_title, cs_content, member_mem_id) values (cs_seq.nextval,'����4', '�̰� ��� �ϳ���4', '0mo');

select * from cs;

--�ֹ� ���̵�����
INSERT into orders(orders_no,member_mem_id) VALUES (o_seq.nextval,'gahee');
INSERT into orders(orders_no,member_mem_id) VALUES (o_seq.nextval,'nadong');
INSERT into orders(orders_no,member_mem_id) VALUES (o_seq.nextval,'minseon');
INSERT into orders(orders_no,member_mem_id) VALUES (o_seq.nextval,'0mo');
INSERT into orders(orders_no,member_mem_id) VALUES (o_seq.nextval,'jinsoo');

select * from orders;



select * from product;

--�ֹ��� ���̵�����
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
----��ٱ��ϻ� ���̵�����
--INSERT INTO cart_detail VALUES(cd_seq.nextval,1,1,1);
--INSERT INTO cart_detail VALUES(cd_seq.nextval,2,1,2);
--INSERT INTO cart_detail VALUES(cd_seq.nextval,3,1,3);
--INSERT INTO cart_detail VALUES(cd_seq.nextval,4,1,4);
--
--select * from cart_detail;

--�ֹ��� Ȯ��
select * from orders_view;
--��ٱ��Ϻ� Ȯ��
select * from carts_view;

commit