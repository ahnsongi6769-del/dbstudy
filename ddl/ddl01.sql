/***************************************/
DDL 
테이블에 관련된 명령어

-- 테이블 생성 방법

CREATE TABLE 테이블 명
( 
    컬럼명  컬럼 타입 기타속성 / 제약,
    컬럼명  컬럼 타입 기타속성 / 제약,
    컬럼명  컬럼 타입 기타속성 / 제약,
    컬럼명  컬럼 타입 기타속성 / 제약,
    컬럼명  컬럼 타입 기타속성 / 제약,
    컬럼명  컬럼 타입 기타속성 / 제약,
    컬럼명  컬럼 타입 기타속성 / 제약
);


CREATE TABLE new_table      -- 테이블 스키마
(
    no NUMBER(3),           -- 숫자형 3자리수
    name VARCHAR2(16),       -- 문자형 16바이트
    birth DATE              -- 날짜형
);

select *from new_table;

CREATE TABLE new_table2      -- 테이블 스키마
(
    no NUMBER(3),           -- 숫자형 3자리수
    name VARCHAR2(16),       -- 문자형 16바이트
    birth DATE              -- 날짜형
);

select *from new_table2;
select *from tab; -- 내가 가진 모든 테이블을 조회 할때 
select *
from tab
where tname LIKE '%NEW%';


-- 테이블 복사 
select * from dept2;

CREATE TABLE dept3
AS 
SELECT * FROM dept2;  --dept2 테이블 구조 + 데이터복사 -> 새로운 테이블 생성

select * from dept3;

CREATE TABLE dept4
AS 
SELECT dcode,dname FROM dept2;  --dept2 컬럼 이부 테이블 구조 + 데이터복사 -> 새로운 테이블 생성

select * from dept4;


-- 컬럼구조 ( 테이블 구조 ) 만 동일하게 데이터 없이 복사를 하는 경우 -> 새로운 테이블 생성
CREATE TABLE dept5
AS
SELECT * FROM dept2
where 1=2;  -- 데이터가 조회되지 않도록 거짓조건을 추가 

select * from dept5;


--- 테이블 변경 (수정) -> 애초에 기획단계부터 제대로 만드는게 중요 

select * from dept4;

-- 컬럼 추가 
ALTER TABLE dept4
ADD (loc VARCHAR2(32));

ALTER TABLE dept4
ADD (lv NUMBER(3) DEFAULT 1 );

--컬럼삭제 

ALTER TABLE dept4
DROP COLUMN lv;

-- 테이블 삭제 (ROLLBACK 불가 / 자동 COMMIT)
DROP TABLE 테이블명;

-- 테이블 내부 데이터 삭제 (ROLLBACK 불가 / 자동 COMMIT)
TRUNCATE TABLE 테이블 명 ;

select * from dept4;

TRUNCATE TABLE dept4;
DROP TABLE dept4;



