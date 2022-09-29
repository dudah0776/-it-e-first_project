-- FK����ɸ��͵� ������ ����� ���� ������
alter table member drop primary key cascade;
alter table product drop primary key cascade;
alter table orders drop primary key cascade;
--�̹� �����Ǿ��ٸ� ����
DROP TABLE CART_DETAIL PURGE;
DROP TABLE cart PURGE;
DROP TABLE cs PURGE;
DROP TABLE ORDERS_DETAIL PURGE;
DROP TABLE ORDERS PURGE;
DROP TABLE PRODUCT PURGE;
DROP TABLE MEMBER PURGE;
DROP SEQUENCE c_seq;
DROP SEQUENCE cd_seq;
DROP SEQUENCE cs_seq;
DROP SEQUENCE m_seq;
DROP SEQUENCE o_seq;
DROP SEQUENCE od_seq;
DROP SEQUENCE p_seq;

--��ٱ���
CREATE SEQUENCE c_seq
    INCREMENT BY 1
    START WITH 1
    NOCYCLE
    NOCACHE;
    
CREATE TABLE cart (
    cart_no       NUMBER,
    cart_amount NUMBER DEFAULT 1,
    product_prod_no NUMBER NOT NULL,
    member_mem_id   VARCHAR2(30) NOT NULL
);

ALTER TABLE cart ADD CONSTRAINT cart_pk PRIMARY KEY (cart_no);
--������
CREATE SEQUENCE cs_seq
    INCREMENT BY 1
    START WITH 1
    NOCYCLE
    NOCACHE;

CREATE TABLE cs (
    cs_no         NUMBER,
    cs_title      VARCHAR2(100) NOT NULL,
    cs_date       DATE DEFAULT SYSDATE,
    cs_content    CLOB NOT NULL,
    cs_reply      CLOB,
    cs_check      CHAR(1) DEFAULT '0',
    member_mem_id   VARCHAR2(30) NOT NULL
);
ALTER TABLE cs ADD CONSTRAINT cs_pk PRIMARY KEY (cs_no );

--ȸ��

CREATE TABLE member (
    mem_id       VARCHAR2(30),
    mem_pw       VARCHAR2(30) NOT NULL,
    mem_name     VARCHAR2(15) NOT NULL,
    mem_gender varchar2(10) not null,
    mem_regdate    DATE DEFAULT SYSDATE,
    mem_birth    DATE NOT NULL,
    mem_passport VARCHAR2(15) NOT NULL,
    mem_phone    VARCHAR2(15) NOT NULL
);

ALTER TABLE member ADD CONSTRAINT member_pk PRIMARY KEY (mem_id );

--�ֹ�
CREATE SEQUENCE o_seq
    INCREMENT BY 1
    START WITH 1
    NOCYCLE
    NOCACHE;

CREATE TABLE orders (
    orders_no       NUMBER,
    orders_pay      CHAR(1) DEFAULT 0, --0�̸� ī�� 1�̸� ������ü(�������Ա�)
    orders_date     DATE DEFAULT SYSDATE,
    member_mem_id   VARCHAR2(30) NOT NULL,
    orders_shipping CHAR(1) DEFAULT 0 --0�̸� ����� 1�̸� �ε��� 2�̸� �ε��Ϸ�
);

ALTER TABLE orders ADD CONSTRAINT order_pk PRIMARY KEY ( orders_no );

--�ֹ���
CREATE SEQUENCE od_seq
    INCREMENT BY 1
    START WITH 1
    NOCYCLE
    NOCACHE;

CREATE TABLE orders_detail (
    odetail_no       NUMBER,
    odetail_amount   NUMBER DEFAULT 1,
    product_prod_no  NUMBER NOT NULL,
    orders_orders_no NUMBER NOT NULL
);

ALTER TABLE orders_detail ADD CONSTRAINT order_detail_pk PRIMARY KEY ( orders_orders_no,
                                                                       product_prod_no );
--��ǰ
CREATE SEQUENCE p_seq
    INCREMENT BY 1
    START WITH 1
    NOCYCLE
    NOCACHE;
    
CREATE TABLE product (
    prod_no       NUMBER,
    prod_name     VARCHAR2(100) NOT NULL,
    prod_brand    VARCHAR2(50) NOT NULL,
    prod_category VARCHAR2(50) NOT NULL,
    prod_price    NUMBER NOT NULL,
    prod_pricedc NUMBER(10,1) generated always as (prod_price * ((100 - prod_discount)/100)),
    prod_pricewon NUMBER(10,1) generated always as ((prod_price * ((100 - prod_discount)/100))* 1374.8),
    prod_discount NUMBER,
    prod_stock    NUMBER NOT NULL,
    prod_regdate  DATE DEFAULT SYSDATE,
    prod_image    VARCHAR2(100) NOT NULL,
    prod_detail   CLOB
);

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( prod_no );

ALTER TABLE cart
    ADD CONSTRAINT cart_member_fk FOREIGN KEY ( member_mem_id )
        REFERENCES member ( mem_id ) ON DELETE CASCADE;
        
ALTER TABLE cart
    ADD CONSTRAINT cart_product_fk FOREIGN KEY ( product_prod_no )
        REFERENCES product ( prod_no ) ON DELETE CASCADE;

ALTER TABLE cs
    ADD CONSTRAINT cs_member_fk FOREIGN KEY ( member_mem_id )
        REFERENCES member ( mem_id ) ON DELETE CASCADE;

ALTER TABLE orders_detail
    ADD CONSTRAINT orders_detail_orders_fk FOREIGN KEY ( orders_orders_no )
        REFERENCES orders ( orders_no) ON DELETE CASCADE;

ALTER TABLE orders_detail
    ADD CONSTRAINT orders_detail_product_fk FOREIGN KEY ( product_prod_no )
        REFERENCES product ( prod_no );

ALTER TABLE orders
    ADD CONSTRAINT orders_member_fk FOREIGN KEY ( member_mem_id )
        REFERENCES member ( mem_id ) ON DELETE CASCADE;


--�ֹ���
drop view orders_view;

create or replace view orders_view
as
select d.odetail_no od_no, o.orders_no o_no, o.orders_date o_date, p.prod_no p_no, p.prod_name p_name, d.odetail_amount od_amount, m.mem_id m_id, 
p.prod_price p_price, p.prod_discount p_dc, o.orders_shipping o_shipping,
p.prod_image p_image, p.prod_pricedc p_pdc, p.prod_pricewon p_pwon, p.prod_detail p_detail,  p.prod_brand p_brand
from orders o, orders_detail d, member m, product p 
where o.orders_no=d.orders_orders_no and o.member_mem_id = m.mem_id and d.product_prod_no = p.prod_no;



--��ٱ��Ϻ�
create or replace view carts_view
as
select m.mem_id m_id, c.cart_no c_no, p.prod_no p_no, p.prod_name p_name,
    c.cart_amount c_amount, 
    p.prod_price p_price, p.prod_discount p_discount, p.prod_brand p_brand,
    p.prod_image p_image, p.prod_pricedc p_pdc, p.prod_pricewon p_pwon
from member m, cart c,  product p
where m.mem_id=c.member_mem_id  and p.prod_no=c.product_prod_no;

-- �ֹ� trigger
-- (order_detail�� �����Ǹ� ��ǰ���(prod_stock)-����(odetail_amount)���� ��� update�ϴ� Ʈ����, ���� ������� �ֹ������� ������ �����߻���Ŵ)
create or replace trigger od_trigger
before
insert on orders_detail
for each row
declare
    vqty number;
begin
    select prod_stock into vqty
    from product
    where prod_no = :NEW.product_prod_no;
    
    if vqty>= :NEW.odetail_amount then
        update product
        set prod_stock = prod_stock - :NEW.odetail_amount
        where prod_no = :NEW.product_prod_no;
    else
       raise_application_error(-20007, '������ �������� �Ǹ� �Ұ�');
    end if;
end;