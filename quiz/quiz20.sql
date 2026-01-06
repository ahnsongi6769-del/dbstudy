--1. professor 테이블과 department 테이블을 조회하여 
--각 학과별로 입사일이 가장 오래된 교수의 
--교수번호와 이름, 학과명을 출력하세요(입사일 순으로 오름차순 정렬)


select
    p.profno,
    p.name,
    d.dname,
    p.hiredate
from professor p,
     department d,
     (
        select deptno, MIN(hiredate) min_hiredate
        from professor
        group by deptno
     ) m
where p.deptno = d.deptno
  and p.deptno = m.deptno
  and p.hiredate = m.min_hiredate
order by p.hiredate;

select *
from (
        select
        profno,
        name,
        deptno,
        hiredate,
        rank ()over (partition by deptno order by hiredate) rank
        from professor)
where rank = 1;

select * from department;
select * from professor;

--2. emp2 테이블 조회하여 (직급별로 해당 직급에서 최대 연봉)/을 받는 직원의 이름과 직급, 연봉을 출력하세요
--(연봉순으로 오름차순 정렬)

select name,position,pay
from emp2
where (position,pay) IN (
                        select position ,max(pay) 
                        from emp2
                        group by position)
order by pay;


select 
    e.name,
    e.position,
    e.pay
from emp2 e,
    (select position ,max(pay) max_pay
    from emp2
    group by position) p
where e.position = p.position
and e.pay = p.max_pay 
order by pay ;
                
select position ,max(pay) 
from emp2
group by position;

select *
from emp2;
