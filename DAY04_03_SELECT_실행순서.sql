/*
    SELECT 문의 실행 순서
    1. FROM 
    2. WHERE
    3. GROUP BY
    4. HAVING
    5. SLECTE
    6. ORDER BY
    수행 순서를 기반으로 어디서 오류가 나는지 잘 알아야 한다!
*/

-- 1. 부서번호를 기준으로 오름차순 정렬하시오.
SELECT DEPART AS 부서번호 -- 2
  FROM EMPLOYEE_T         -- 1  
 ORDER BY 부서번호;       -- 3 (별명의 인식이 가능함)
 
-- 2. 부서별로 연봉 평균을 조회하시오.
SELECT DEPART AS 부서번호, AVG(SALARY) AS 평균연봉  -- 3
  FROM EMPLOYEE_T                                   -- 1
 GROUP BY 부서번호;                                 -- 2 (별명의 인식이 불가능함) 실행 순서에 따라 별명 인식 여부가 달라진다. 
 
-- 3. 부서별로 연봉 평균과 사원수를 조회하시오. 사원수가 2명 이상인 부서만 조회하시오. 평균연봉의 내림차순 정렬하시오.
SELECT DEPART AS 부서번호       -- 4
     , AVG(SALARY) AS 평균연봉
     , COUNT(*) AS 사원수
  FROM EMPLOYEE_T               -- 1
 GROUP BY DEPART                -- 2
HAVING COUNT(*) >=2             -- 3
 ORDER BY 평균연봉 DESC;        -- 5