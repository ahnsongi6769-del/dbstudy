/************************************/
기타 복수행 함수 
집계함수 정리 

-- 부서와 직업별 평균 급여와 사원수 

select deptno, job, AVG(sal)평균급여, COUNT(*) 사원수
from emp
group by deptno,job;

-- emp 부서별 평균 급여와 사원수 
select deptno, AVG(sal)평균급여, COUNT(*) 사원수
from emp
group by deptno;

-- emp 전체 사원이 평균 급여와 사원수 

select  AVG(sal)평균급여, COUNT(*) 사원수
from emp;

-- 위 3개를 병합 / 컬럼수를 맞춰준다 ( null)

select deptno, job, AVG(sal)평균급여, COUNT(*) 사원수
from emp
group by deptno,job
UNION ALL
select deptno, null ,AVG(sal)평균급여, COUNT(*) 사원수
from emp
group by deptno
UNION ALL
select null,null, AVG(sal)평균급여, COUNT(*) 사원수
from emp
order by deptno, 2 ;



*** ROLLUP

select deptno, job, AVG(sal)평균급여, COUNT(*) 사원수
from emp
--group by ROLLUP (job,deptno );
group by ROLLUP ((deptno,job));
1) group by deptno,job 그룹화 데이터 ->집계
2) group by deptno 그룹화 데이터 ->집계
3) 전체 대상으로 총 집계 그룹화 데이터 ->집계

group by ROLLUP (emptno,deptno,job);
1)(enptno,deptno,job)
2)(enptno,deptno)
3)(enptno)
4)()

group by ROLLUP (emptno,(deptno,job));
1)(emptno,(deptno,job))
2)(emptno)
3) ()

select deptno, job, AVG(sal)평균급여, COUNT(*) 사원수
from emp
group by ROLLUP (deptno,job);

select deptno, job, AVG(sal)평균급여, COUNT(*) 사원수
from emp
group by CUBE (deptno,job);

1)deptno,job
2)deptno
3)      job
4) () 

