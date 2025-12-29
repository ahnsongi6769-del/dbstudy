select 
    NAME 이름 , 
    SUBSTR(BIRTHDAY,1,2)년도,
    SUBSTR(BIRTHDAY,4,2)월, 
    SUBSTR(BIRTHDAY,7,2)일
from student;

select 
NAME , TEL , INSTR(TEL,')')괄호위치
from student
where deptno1 = 201;

select 
NAME , TEL , INSTR(TEL,'3')첫3위치
from student
where deptno1 = 101;


select 
NAME , TEL , 
RTRIM(SUBSTR(TEL,1,3),')')지역번호,
SUBSTR(tel,1,INSTR(tel,')')-1)지역번호1
from student
where deptno1 =201;


