/***************************************/
DDL 테이블 제약조건

select * from new_table3;

DEFAULT : 기본값 저장되는 기본 값이 없을때 저장하는 기본값 


CREATE TABLE new_table3      -- 테이블 스키마
(
    no NUMBER(3) DEFAULT 0,           -- 숫자형 3자리수
    name VARCHAR2(16) DEFAULT 'NONAME',       -- 문자형 16바이트
    birth DATE  DEFAULT sysdate            -- 날짜형
);

INSERT INTO new_table3
values (1,'name1',TO_DATE('2020-01-05'));

select * from new_table3;

INSERT INTO new_table3
values (2,null,TO_DATE('2020-01-05'));

INSERT INTO new_table3 (no,birth)
values (3,TO_DATE('2020-01-05'));

UNIQUE : 중복되지 않는 유일한 값
NOT NULL : null 저장이 불가 (Nullable No)
무결성 ( 중복 x , NOT NULL ) : 데이터가 올바르게 , 일관되게 유지 되어있어야한다
    -> 정확성 : 키 171.5 -> 1715 
    -> 일관성 : 동일의미 데이터 일관  식당 포스기 15,000 주문내역 13,000
    -> 완전성 : 데이터가 존재 O 회원가입 전화번호 필수 ! ( null X )
    -> 신뢰성 : 믿을 수 있어야 함 

CHECK : 저장 가능한 범위를 설정하는 속성

CREATE TABLE tt01
(
    no NUMBER(3) UNIQUE,           
    name VARCHAR2(16) NOT NULL,       
    birth DATE         
);

insert into tt01
values (1,'name1', sysdate);

select * from tt01;

insert into tt01
values (2,null, sysdate); -- XX 

insert into tt01
values (2,'name2', sysdate);

insert into tt01
values (2,'name1', sysdate); -- XX no 중복

insert into tt01
values (3,sysdate);  -- XX , name이  null

insert into tt01 (name,birth)
values ('name1', sysdate);

commit;

CREATE TABLE tt02
(
    no NUMBER(3) 
        CONSTRAINT tt02_no_uq UNIQUE, -- CONSTRAINT 제약이름 제약속성  
    name VARCHAR2(16) 
        CONSTRAINT tt02_name_nn  NOT NULL,       
    birth DATE,
    score NUMBER(3)
        CONSTRAINT tt02_score_ck CHECK ( score BETWEEN 0 AND 100),
    pass VARCHAR2(2) 
        CONSTRAINT tt02_pass_ck CHECK (pass IN ('Y','N'))
);

Oracle 데이터 타입
숫자 / 문자 / 날짜  NUMBER / VARCHAR2 / DATE

NUMBER(자리수)
NUMBER(자리수,소수점자리수)
NUMBER(3) : 3자리 수 
NUMBER(6) : 6자리 수 
NUMBER(6,3) : 전체 자리수 6자리 , 소수점 3자리 123.456 O 10.551 O 1234.56 X
NUMBER만 표기 : 38자리 숫자까지 가능 

VARCHAR2 (바이트수)
VARCHAR2 (6) : 6자리글자가 아니라, 6바이트를 의미 

Oracle 에는 boolean True / false XX 
'true' /'faluse' 
1/0 
T/F
Y/N
이런 방식으로 치환에서 사용해야함 

INSERT INTO TT02
VALUES (1,'name1',sysdate,60,'Y');

select * from TT02;

INSERT INTO TT02
VALUES (1,'name1',sysdate,60,'Y'); -- 중복 unique 제약

INSERT INTO TT02
VALUES (2,null,sysdate,60,'Y'); -- 이름 not null 제약

INSERT INTO TT02
VALUES (2,'name2',sysdate,600,'Y'); -- score 점수 범위(1~100) 제약

INSERT INTO TT02
VALUES (2,'name2',sysdate,70,'T'); -- pass 가능범위('Y','N') 제약

INSERT INTO TT02
VALUES (2,'name2',sysdate,70,'N');

commit;
select * from tt02;


