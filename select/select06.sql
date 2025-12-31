/*********************************/
복수행 함수 (집계 처리)
단일행함수와 복수행함수는 같이 사용할 수 없다. 


COUNT (대상) 갯수세기


select *
from emp;


select COUNT(*)
from emp;

--갯수 대상 식별자 ( 기본키 Primary Key / PK)

select 
    count(empno),
    count(mgr),
    count(comm) -- 특정 컬럼 대상으로 null 이 아닌것의 갯수 
    ,null 
    --,empno 같은건 x
from emp;

select
    count(*)
from emp
where comm is not null;

select
    count(*)
from emp
where comm is null;


select Count(*)
from student
where grade = 4;

수치 집계 
SUM / AVG / MAX / MIN / STDDEV 표준편차 / VARIANCE 분산

-- 10,20 부서에 다니는 직원 몇명, 총 급여 얼마

select 
    count (*) , SUM(sal)
from emp
where deptno IN ( 10,20);


select 
 SUM(height),
 AVG(height),
 MAX(height),
 MIN(height),
 round(STDDEV(height),2),
 round(VARIANCE(height),2),
 AVG(weight)
from student;

/***************/
그룹화하기 group by

select ...
from ...
where ...
group by 컬럼 대상을 기준으로 그룹지어서 계산
        ( group by 명시한 컬럼은 select 조회에 사용 가능)
having -- 집계 처리된 결과에 대한 집계 처리를 할 수 있는 것
order by 정렬 어떻게 하겠다 

;

select '1학년' 학년 , AVG(height) 평균키
from student
where grade = 1
UNION ALL
select '2학년' 학년 , AVG(height) 평균키
from student
where grade = 2
UNION ALL
select '3학년' 학년 , AVG(height) 평균키
from student
where grade = 3
UNION ALL
select '4학년' 학년 , AVG(height) 평균키
from student
where grade = 4;


-- group by 에 들어간 행은 복수행함수에 사용가능
select grade, AVG(height)
from student
group by grade
order by grade desc;  --desc 내림차순 


select grade, COUNT(*),AVG(height)
from student
group by grade;


select studno, COUNT(*),AVG(height)
from student
group by studno;

select *
from student;

--1 ~3 학년의 학년별 평균키 , 학년의 내림차순으로 정렬 
select grade 학년 , AVG(height) 평균키
from student
where grade IN(1,2,3)
group by grade
order by 2 desc; -- 해당순서 위치에 있는 컬럼을 기준으로 정렬 1,2,3 ... 
--order by AVG(height) desc
--order by 평균키 desc
--order by grade desc

select deptno, avg(sal)
from emp
group by deptno
having AVG(sal)>2000;

1) 급여가 2000 이상인 직원들 대상으로 부서별 평균 급여를 구해라
select deptno ,AVG (sal)
from emp
where sal >= 2000
group by deptno;

2) 부서별 평균 급여가 2000 이상인 부서별 평균 급여 
부서별 평균 급여를 계산하고, 그 평균 급여가 2000 이상인 결과를 구해라 
select deptno ,AVG (sal)
from emp
group by deptno
having AVG(sal)>=2000;


--
학생 각 학년별 평균 몸무게 
평균 몸무게가 65kg 이상인 것 찾겠다 

select grade , AVG(weight)
from student
group by grade
having AVG(weight) >=65;


4학년을 제외하고 각 학년별 평균 몸무게 
평균 몸무게가 65kg 이상인 것 찾겠다 

select grade, AVG(weight)
from student
where grade != 4
group by grade
having AVG(weight) >=65
order by grade;


--order by grade , height

select deptno,avg(sal)
from emp
group by deptno;

select job,avg(sal)
from emp
group by job;

select job,deptno,avg(sal)
from emp
group by job,deptno;