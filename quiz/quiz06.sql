select 
ename,
REPLACE(ename,SUBSTR(ename,3,2),'--')replace
from emp
where deptno = 20;
--replace (대상,기존값,바꿀값)

select 
name,
replace (jumin,substr(jumin,7,7),'-/-/-/-') 주민뒷자리숨김
from student
where deptno1 = 101;

select 
name,
tel,
replace(tel,substr(tel,5,3),'***') REPLACE,

SUBSTR(tel,1,instr(tel,')'))||
rpad('*',instr(tel,'-')-1-instr(tel,')'),'*')||
SUBSTR(tel,instr(tel,'-')) 응용

from student;


select 
name,
tel,
replace(tel,substr(tel,-4,4),'****')REPLACE,
substr(tel,1,instr(tel,'-')) || '****'
from student
where deptno1 = 101;
