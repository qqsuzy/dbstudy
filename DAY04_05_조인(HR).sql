-- 1. LOCATION_ID가 1700인 부서에 근무하는 사원들의 EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME을 조회하시오.
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
  FROM DEPARTMENTS D INNER JOIN EMPLOYEES E 
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
 WHERE LOCATION_ID = 1700;

-- 2. DEPARTMENT_NAME이 'Executive'인 부서에 근무하는 사원들의 EMPLOYEE_ID, FIRST_NAME을 조회하시오.
SELECT E.EMPLOYEE_ID, E.FIRST_NAME
  FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
 WHERE DEPARTMENT_NAME = 'Executive';

-- 3. 모든 사원들의 EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME, STREET_ADDRESS, CITY를 조회하시오.
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME, L.STREET_ADDRESS, L.CITY
  FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID RIGHT JOIN LOCATIONS L
    ON D.LOCATION_ID = L.LOCATION_ID;  -- 1명 NULL

-- 4. 사원이 근무 중인 부서를 대상으로 DEPARTMENT_NAME과 근무 중인 사원 수와 평균 연봉을 조회하시오.
SELECT D.DEPARTMENT_NAME, COUNT(EMPLOYEE_ID), AVG(SALARY)
  FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
 GROUP BY DEPARTMENT_NAME;

-- 5. JOB_HISTORY 테이블에 존재하는 사원들을 대상으로 사원번호, 현재 JOB_ID, 예전 JOB_ID를 조회하시오.


-- 6. 모든 사원들의 EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME을 조회하시오. 부서가 없는 사원의 부서명은 'None'으로 조회되도록 처리하시오.
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, NVL(D.DEPARTMENT_NAME, 'None')
  FROM DEPARTMENTS D RIGHT JOIN EMPLOYEES E
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;

-- 7. 모든 부서의 DEPARTMENT_NAME과 근무 중인 사원 수를 조회하시오. 근무하는 사원이 없으면 0으로 조회하시오.
SELECT D.DEPARTMENT_NAME, COUNT(EMPLOYEE_ID)
  FROM DEPARTMENTS D RIGHT JOIN EMPLOYEES E
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
 GROUP BY D.DEPARTMENT_NAME;

-- 8. 모든 부서의 DEPARTMENT_ID, DEPARTMENT_NAME, STATE_PROVINCE, COUNTRY_NAME, REGION_NAME을 조회하시오.
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, L.STATE_PROVINCE, C.COUNTRY_NAME, R.REGION_NAME
  FROM LOCATIONS L INNER JOIN DEPARTMENTS D 
    ON L.LOCATION_ID = D.LOCATION_ID INNER JOIN COUNTRIES C
    ON C.COUNTRY_ID = L.COUNTRY_ID INNER JOIN 
