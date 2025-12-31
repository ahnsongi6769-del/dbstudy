select 
name, jumin, birthday,
 CASE 
        WHEN SUBSTR(jumin,3,2) IN ('01','02','03') THEN '1분기'
        WHEN SUBSTR(jumin,3,2) IN ('04','05','06') THEN '2분기'
        WHEN SUBSTR(jumin,3,2) IN ('07','08','09') THEN '3분기'
        WHEN SUBSTR(jumin,3,2) IN ('10','11','12') THEN '4분기'
    END 분기,
     CASE 
        WHEN TO_CHAR(birthday,'MM') IN ('01','02','03') THEN '1분기'
        WHEN TO_CHAR(birthday,'MM') IN (4,5,6) THEN '2분기'
        WHEN SUBSTR(jumin,3,2) IN ('07','08','09') THEN '3분기'
        WHEN SUBSTR(jumin,3,2) IN ('10','11','12') THEN '4분기'
    END 분기
from student;

select 
empno, ename, sal,
 CASE 
        WHEN sal BETWEEN 1 AND 1000 THEN 'LEVEL1'
        WHEN sal BETWEEN 1001 AND 2000 THEN 'LEVEL2'
        WHEN sal BETWEEN 2001 AND 3000 THEN 'LEVEL3'
        WHEN sal BETWEEN 3001 AND 4000 THEN 'LEVEL4'
        ELSE 'LEVEL5'
    END 급여등급
from emp
order by 급여등급;