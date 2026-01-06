--1.student, department 테이블 활용
--학과 이름, 학과별 최대키, 학과별 최대키를 가진 학생들의 이름과 키를 출력 하세요.
/************* 서브쿼리 *********************/
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

/***********다중컬럼**********************/
select d.dname,s.height 학과별최대키 ,s.name,s.height 학생키
from student s , department d
where (deptno1,height) IN (
                            select deptno1 ,MAX(height)
                            from student
                            group by deptno1)
and s.deptno1= d.deptno;



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