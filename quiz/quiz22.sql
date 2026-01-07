--emp2 dept2 테이블을 참고하여,

--'AL Pacino'와 "같은 지역"에서
--근무하는 직원들의 평균 연봉보다
--많이 받는 직원들의 사번, 이름, 부서번호, 부서이름, 근무지역, 급여 를 출력하세요.


select 
        empno,
        name,
        deptno,
        dname,
        area,
        pay
from emp2 e , dept2 d
where e.deptno = d.dcode
and e.pay > (select trunc(avg(e.pay)) AVG_PAY
                from emp2 e , dept2 d
                where e.deptno = d.dcode
                and d.area = 'Seoul Branch Office');
                

select 
        empno,
        name,
        deptno,
        dname,
        area,
        pay
from emp2 e , dept2 d
where e.deptno = d.dcode
and e.pay >(
        SELECT TRUNC(AVG(e2.pay))
        FROM emp2 e2, dept2 d2
        WHERE e2.deptno = d2.dcode
          AND d2.area = (
                SELECT d3.area
                FROM emp2 e3, dept2 d3
                WHERE e3.deptno = d3.dcode
                  AND e3.name = 'AL Pacino'
          )
  );
  
  
  select e.empno,e.name,e.deptno,d.dname,d.area,e.pay
  from emp2 e, dept2 d
  where pay >   (select avg(pay)  -- 해당 부서번호에 속한 직원들의 평균연봉
                    from emp2
                    where deptno IN (   select dcode -- 해당 근무 지역인 부서번호 
                                        from dept2
                                        where area = (select area   -- 부서의 근무지역
                                                        from dept2
                                                        where dcode = 
                                                                (select deptno  -- 알파치노 소속부서 번호 
                                                                from emp2
                                                                where name = 'AL Pacino'))))
and e.deptno = d.dcode;

select avg(pay)  -- 해당 부서번호에 속한 직원들의 평균연봉
from emp2
where deptno IN (   select dcode -- 해당 근무 지역인 부서번호 
                    from dept2
                    where area = (select area   -- 부서의 근무지역
                                    from dept2
                                    where dcode = 
                                        (select deptno  -- 알파치노 소속부서 번호 
                                        from emp2
                                        where name = 'AL Pacino')));


select dcode
from dept2
where area = (select area   -- 부서의 근무지역
                from dept2
                where dcode = 
                    (select deptno  -- 알파치노 소속부서 번호 
                    from emp2
                    where name = 'AL Pacino')); 

select area
from dept2
where dcode = (select deptno
                from emp2
                where name = 'AL Pacino');

select trunc(avg(e.pay)) AVG_PAY
from emp2 e , dept2 d
where e.deptno = d.dcode
and d.area = 'Seoul Branch Office';

select *
from emp2 e, dept2 d
where e.deptno = d.dcode
and e.name = 'AL Pacino';


select *from emp2;
select * from dept2;