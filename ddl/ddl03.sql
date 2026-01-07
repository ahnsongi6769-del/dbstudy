/********************************/
DDL 제약조건 KEY

PK (Primary Key) 기본키 (테이블에 한개만 설정 가능)
FK (Foreign Key) 외래키 

CREATE TABLE tt03
(
    no NUMBER(3) PRIMARY KEY, --> 기본키 설정 ->NOT NULL UNIQUE/ 기본키 설정은 한개만 가능
    name VARCHAR2(16),
    birth DATE
);

insert into tt03 values (1,'n1',sysdate);
insert into tt03 values (1,'n1',sysdate); -- no 중복 XX
insert into tt03 values (null,'n1',sysdate); -- no null XX 

CREATE TABLE tt04
(
    no NUMBER(3) PRIMARY KEY,    --기본키 (PK) 설정  PK는 테이블에 1개만 존재 제약
    id VARCHAR2(32) PRIMARY KEY, --기본키 (PK) 설정  PK는 테이블에 1개만 존재 제약
    name VARCHAR2(16) NOT NULL,
    birth DATE
);

CREATE TABLE tt04
(
    no NUMBER(3) ,    --기본키 (PK) 설정  PK는 테이블에 1개만 존재 제약
    id VARCHAR2(32) , --기본키 (PK) 설정  PK는 테이블에 1개만 존재 제약
    name VARCHAR2(16) NOT NULL,
    birth DATE,
    CONSTRAINT tt04_pk PRIMARY KEY (no,id) -- 두개의 컬럼을 조합해서 pk로 설정
);

/**********************************/
student ->(profno) -> professor

외래키 설정 fk : 다른 테이블에 있는 키 값 참조하는 컬럼 
- 참조하는 테이블에 존재하는 값만 사용 가능 (+null 값 가능)
- 외래키 대상으로 설정된 부모테이블에서 자신을 참조하는 
  자식테이블의 데이터 참조가 존재하면, 기본적으로 삭제가 불가하다

외래키 삭제하는 조건 

ON DELETE CASCADE; -- 부모데이터 삭제시, 그 값을 참조하는 자식데이터도 같이 삭제 
ON DELETE SET NULL; -- 부모데이터 삭제시, 그 값을 참조하는 자식데이터를 null 값을 변경

CREATE TABLE T_CLUB
(
    id NUMBER(3) PRIMARY KEY,
    name VARCHAR(32)
    
);
DROP TABLE T_MEMBER;

CREATE TABLE T_MEMBER
(
    id NUMBER(3) PRIMARY KEY,
    name VARCHAR(32),
    --club_id REFERENCES T_CLUB(id)-- 외래키(FK) 설정 
    --club_id REFERENCES T_CLUB(id) ON DELETE CASCADE -- 외래키(FK) 설정 
    club_id REFERENCES T_CLUB(id) ON DELETE SET NULL -- 외래키(FK) 설정 
    
);

select * from T_CLUB;

insert into T_CLUB values(1,'독서');
insert into T_CLUB values(2,'게임');
insert into T_CLUB values(3,'등산');
insert into T_CLUB values(4,'낚시');

commit;

insert into T_MEMBER values(1,'이름1',2);
insert into T_MEMBER values(2,'이름2',1);
insert into T_MEMBER values(3,'이름3',1);

select * from T_MEMBER;
select * 
from T_MEMBER m , T_club c
where m.club_id = c.id(+);

insert into T_MEMBER values(1,'이름4',3); --MEMBER PK id 중복
insert into T_MEMBER values(null,'이름4',3); --MEMBER PK noy null
insert into T_MEMBER values(4,'이름4',5); 
-- fk 설정 참조하는 부모테이블 id 값에 5가 존재하지 않음 (1~4까지만 존재)
insert into T_MEMBER values(4,'이름4',null); 
insert into T_MEMBER values(5,'이름5',3); 

commit;

select *
from T_MEMBER;

select *
--delete
from t_club -- id가 3인 데이터를 외부(자식테이블)에서 참조하는 데이터가 존재하면 삭제 불가 
where id =3;


select *
--delete
from T_MEMBER
where club_id = 3;
-- 삭제하고 싶을때는 참조하는 자식테이블 데이터 먼저 삭제 

select *
--delete
from t_club  --참조하는 외부 테이블데이터가 없으면 삭제 가능 
where id =4;

