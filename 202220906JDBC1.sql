/*
부서명을 입력 받아 같은 부서에 있는 사원의
사원명, 부서명, 급여 조회
*/
SELECT  EMP_NAME, NVL(DEPT_TITLE, '부서없음') AS DEPT_TITLE, SALARY
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
WHERE NVL(DEPT_TITLE,'부서없음') = '인사관리부';



/*직급명, 급여를 입력 받아
해당 직급에서 입력 받은 급여보다 많이 받는 사원의
이름, 직급명, 급여, 연봉 출력
		
단, 조회 결과가 없으면 " 조회 결과 없음" 출력
조회 결과가 있으면
선동일 / 대표 / 8000000 / 96000000
송종기 / 부장 / 6000000 / 72000000
.....
*/
SELECT EMP_NAME 이름, JOB_NAME 직급, SALARY 급여, SALARY*12 ANNUAL_INCOMEI
FROM EMPLOYEE
JOIN JOB  USING(JOB_CODE)
WHERE JOB_NAME = '"+input+"'
AND SALARY > '"+NUM+"'


/*입사일을 입력("2022-09-06") 받아
입력 받은 값 보다 먼저 입사한 사람의 
이름, 입사일(1990년 01월 01일), 성별(M/F) 조회
*/
SELECT EMP_NAME 이름,
TO_CHAR(HIRE_DATE, 'YYYY"년" MM"월" DD"일"') 입사일,
DECODE(SUBSTR(EMP_NO,8,1),'1','M','2','F') 성별
FROM EMPLOYEE
WHERE HIRE_DATE < TO_DATE('2022-09-06');




--1. 새로운 사원 정보 추가
INSERT INTO EMPLOYEE 
VALUES(?,?,?,?,?,?,?,?,?,?,?,SYSDATE,NULL,DEFAULT);

-- 2. 전체 사원 정보 조회
SELECT EMP_ID , EMP_NAME , EMP_NO , EMAIL, PHONE , 
       NVL(DEPT_TITLE, '부서없음')DEPT_TITLE , JOB_NAME , SALARY  
FROM EMPLOYEE 
LEFT JOIN DEPARTMENT ON(DEPT_ID = DEPT_CODE)
JOIN JOB USING (JOB_CODE);

-- 3. 사번이 일치하는 사원 정보 조회
SELECT EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, 
      NVL(DEPT_TITLE, '부서없음') DEPT_TITLE, 
      JOB_NAME, SALARY
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_ID = DEPT_CODE)
JOIN JOB USING(JOB_CODE)
WHERE EMP_ID  = 200;

-- 4. 사번이 일치하는 사원 정보 수정
UPDATE EMPLOYEE SET
EMAIL = ?, PHONE = ?, SALARY=? 
WHERE EMP_ID = ?

-- 5. 사번이 일치하는 사원 정보 삭제
DELETE FROM EMPLOYEE
WHERE EMP_ID = ?

-- 6.입력 받은 부서와 일치 모든 사원 정보 조회 (내가풀음)
SELECT EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_TITLE, JOB_NAME, SALARY
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_ID = DEPT_CODE)
JOIN JOB USING(JOB_CODE)
WHERE DEPT_TITLE  = '인사관리부';

-- 7. 입력 받은 급여 이상을 받는 모든 사원 정보 조회
SELECT EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_TITLE, JOB_NAME, SALARY
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_ID = DEPT_CODE)
JOIN JOB USING(JOB_CODE)
WHERE SALARY  > 2000000;

-- 8. 부서별 급여 합 전체 조회
SELECT NVL(DEPT_TITLE, '부서없음')부서, SUM(SALARY) 합계  
FROM EMPLOYEE 
LEFT JOIN DEPARTMENT ON (DEPT_ID = DEPT_CODE)
GROUP BY DEPT_CODE, DEPT_TITLE 
ORDER BY SUM(SALARY);



--9. 주민번호가 일치하는 사원 정보 조회
SELECT EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, 
      NVL(DEPT_TITLE, '부서없음') DEPT_TITLE, 
      JOB_NAME, SALARY
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_ID = DEPT_CODE)
JOIN JOB USING(JOB_CODE)
WHERE EMP_NO  = '621231-1985634';



-- 10. 직급별 급여 평균 조회
SELECT JOB_NAME 직급, ROUND(AVG(SALARY)) 급여평균
FROM EMPLOYEE 
JOIN JOB USING(JOB_CODE)
GROUP BY JOB_CODE, JOB_NAME 
ORDER BY JOB_CODE;

