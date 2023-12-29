/*
    1. DATE 형식의 날짜/시간 연산
        1) 1일을 숫자 1로 처리한다.
        2) 단위 처리
            (1) 1          : 1일
            (2) 1/4        : 1시간
            (3) 1/24/60    : 1분
            (4) 1/24/60/60 : 1초
*/
SELECT TO_CHAR(SYSDATE,             'YY/MM/DD HH24:MI:SS') -- 현재 날짜와 시간
     , TO_CHAR(SYSDATE + 1,         'YY/MM/DD HH24:MI:SS') -- 1일 후
     , TO_CHAR(SYSDATE - 1,         'YY/MM/DD HH24:MI:SS') -- 1일 전
     , TO_CHAR(SYSDATE + 1/24,       'YY/MM/DD HH24:MI:SS') -- 1시간 후
     , TO_CHAR(SYSDATE + 1/24/60,    'YY/MM/DD HH24:MI:SS') -- 1분 후
     , TO_CHAR(SYSDATE + 1/24/60/60, 'YY/MM/DD HH24:MI:SS') -- 1초 후
  FROM DUAL;

-- 입사한지 며칠 지났는지 계산해서 조회하기
SELECT EMP_NO, NAME, HIRE_DATE
     , SYSDATE - TO_DATE(HIRE_DATE, 'YY/MM/DD') AS 근무일수
  FROM EMPLOYEE_T;

/*
    2. TIMESTAMP 형식의 날짜/시간 연산
        1) INTERVAL 키워드를 이용한다.
        2) YEAR, MONTH, DAY, HOUR, MINUTE, SECOND 단위를 사용한다.        
*/
SELECT SYSTIMESTAMP + INTERVAL '1' YEAR
  FROM DUAL;
  
SELECT SYSTIMESTAMP + INTERVAL '6' MONTH
  FROM DUAL;

SELECT SYSTIMESTAMP + INTERVAL '3' DAY
  FROM DUAL;

SELECT SYSTIMESTAMP + INTERVAL '8' HOUR
  FROM DUAL;
-- 비밀번호 변경 유효일 구현 시 필요한 함수 (잘 알아두기를 쌤 강조함!)

/*
    3. 날짜/시간 단위 추출하기 -- 숫자로 추출
        EXTRACT (단위 FROM 날짜/시간)
*/
SELECT EXTRACT (YEAR FROM SYSDATE) AS 년
     , EXTRACT (MONTH FROM SYSDATE) AS 월
     , EXTRACT (DAY FROM SYSDATE) AS 일
     , EXTRACT (HOUR FROM SYSTIMESTAMP) AS 표준시 -- UTC
     , EXTRACT (HOUR FROM SYSTIMESTAMP) + 9 AS "Asia/Seoul"
     , EXTRACT (MINUTE FROM SYSTIMESTAMP) AS 분
     , EXTRACT (SECOND FROM SYSTIMESTAMP) AS 초
  FROM DUAL;

/*
    4. N개월 전후 날짜 구하기
        ADD_MONTHS(날짜, N) -- N은 양수/음수 적용 가능
*/

SELECT ADD_MONTHS(SYSDATE, 1) AS "1개월 후"
     , ADD_MONTHS(SYSDATE, -1) AS "1개월 전"
     , ADD_MONTHS(SYSDATE, 12) AS "1년 후"
  FROM DUAL;

/* 
    5. 개월 차이 구하기
        MONTH_BETWEEN(최근날짜, 이전날짜)
*/ 
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2023-01-01', 'YYYY-MM-DD'))
   FROM DUAL;