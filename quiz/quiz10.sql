select 
    deptno,
    name,
    DECODE( name, 'Audie Murphy', DECODE(deptno, '101','BEST!') ) as "DECODE"
from professor;

select
    deptno,
    name,
    DECODE( name, 'Audie Murphy', DECODE(deptno, '101','BEST!'), DECODE(deptno, '101', 'GOOD!', null)) as "비고"
from professor;

select
    deptno,
    name,
    DECODE( name, 'Audie Murphy',  DECODE(deptno, '101','BEST!'), DECODE(deptno, '101', 'GOOD!', 'N/A')) as "비고",
    CASE
        WHEN deptno = 101 AND name = 'Audie Murphy' THEN 'BEST!'
        WHEN deptno = 101 THEN 'GOOD!'
        else 'N/A'
    END DECODE
    
from professor;


select
    name,
    jumin,
    DECODE(SUBSTR(jumin,7,1),'1','남자','2','여자') 성별,
    
    CASE SUBSTR(jumin,7,1)
        WHEN '1' THEN '남자'
        WHEN '2' THEN '여자'
    END 성별2,
     CASE 
        WHEN SUBSTR(jumin,7,1) IN ('1','3') THEN '남자'
        WHEN SUBSTR(jumin,7,1) IN ('2','4') THEN '여자'
    END 성별3
from student
where deptno1 = 101;


select
    name,
    tel,
    DECODE(SUBSTR(tel,1,3),
    '031','GYEONGGI','051','BUSAN','052', 'ULSAN','055','GYEONGNAM',
    DECODE(SUBSTR(tel,1,2),'02','SEOUL')) 지역명,
    
    SUBSTR(tel,1, INSTR(tel,')')-1) 지역번호,
    DECODE(
        SUBSTR(tel,1,INSTR(tel,')')-1),
        '02','SEOUL',
        '031','GYEONGGI',
        '051','BUSAN',
        '052', 'ULSAN',
        '055','GYEONGNAM'
        ) 지역명

from student
where deptno1 = 101;

