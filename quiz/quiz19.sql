--1.emp2 테이블 활용 직원 중 'Section head' 직급 최소 연봉자 보다 연봉이 높은 사람의 이름, 직급, 연봉을 출력하기.

select e.name, e.position,e.pay
from emp2 e
where e.pay > (select MIN(pay)
                from emp2
                where position = 'Section head')
order by pay desc;




--2.Student 테이블. 전체 학생 중에서 체중이 / 2학년 학생들의 체중에서 가장 적게 나가는 학생보다 < 몸무게가 더 적은 학생의 이름, 학년, 몸무게 출력

select s.name , s.grade, s.weight
from student s
where s.weight <(select MIN(weight)
                    from student
                    where grade = 2 );

select MIN(weight)
from student
where grade = 2 ;


--3.emp2, dept2 활용각 부서별 평균연봉을 구하고, 그 중에서 가장 작은 평균 연봉보다도 < 더 적게 받는 직원들의 부서명, 직원명, 연봉 출력

select 
(select d.dname
from dept2 d
where d.dcode = p.deptno) dname,
p.name,p.pay
from emp2 p
where p.pay < (select MIN(e.avg_pay)
from (select deptno,AVG(pay) avg_pay 
from emp2 
group by deptno) e);


select MIN(e.avg_pay)
from (select deptno,AVG(pay) avg_pay 
from emp2 
group by deptno) e ;


select deptno,AVG(pay) 
from emp2 
group by deptno;

select * from emp2;
select * from dept2;



--1.student, department 테이블 활용
--학과 이름, 학과별 최대키, 학과별 최대키를 가진 학생들의 이름과 키를 출력 하세요.

select 
    d.dname,
    m.max_height,
    s.name,
    s.height
from 
    student s,
    department d,
        (select deptno1 ,MAX(height) max_height
        from student
        group by deptno1) m
where s.deptno1 = d.deptno
and s.height = m.max_height
and s.deptno1=m.deptno1;

select deptno1 ,MAX(height)
from student
group by deptno1;

select * from student;
select * from department;

--2.student 테이블에서 학생의 키가 (동일 학년의 평균 키) 보다 < 큰 학생들의 학년과 이름과 키,
--해당 학년의 평균 키를 출력 하세요.(학년 컬럼으로 오름차순 정렬해서 출력하세요)

select 
s.name,
s.height,
m.avg_height
from student s,
(select grade ,avg(height) avg_height
from student 
group by grade) m
where s.height >m.avg_height
and s.grade = m.grade
order by s.grade ;

select grade, 
avg(height)
from student
group by grade;

select name,grade,height
from student;
