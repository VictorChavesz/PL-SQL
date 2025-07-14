CREATE OR REPLACE PROCEDURE PRC_INSERT_EMPREGADO(
    pFIRST_NAME         IN VARCHAR2,
    pLAST_NAME          IN VARCHAR2,
    pEMAIL              IN VARCHAR2,
    pPHONE_NUMBER       IN VARCHAR2,
    pHIRE_DATE          IN DATE DEFAULT SYSDATE,
    pJOB_ID             IN VARCHAR2,
    pSALARY             IN NUMBER,
    pCOMMISSION_PCT     IN NUMBER,
    pMANAGER_ID         IN NUMBER,
    pDEPARTMENT_ID      IN NUMBER
    )
IS
BEGIN
    INSERT INTO EMPLOYEES(
        EMPLOYEE_ID,
        FIRST_NAME,
        LAST_NAME,
        EMAIL,
        PHONE_NUMBER,
        HIRE_DATE,
        JOB_ID,
        SALARY,
        COMMISSION_PCT,
        MANAGER_ID,
        DEPARTMENT_ID
    ) VALUES (
        employees_seq.nextval,
        pFIRST_NAME,  
        pLAST_NAME,    
        pEMAIL,      
        pPHONE_NUMBER,
        pHIRE_DATE,   
        pJOB_ID,    
        pSALARY, 
        pCOMMISSION_PCT,
        pMANAGER_ID, 
        pDEPARTMENT_ID 
    );
EXCEPTION
    WHEN OTHERS
    THEN
        RAISE_APPLICATION_ERROR(-20001,'Erro Oracle:' || SQLCODE || ' ' || SQLERRM);
END;
/

--Testando a procedure

BEGIN
    PRC_INSERT_EMPREGADO('PAULO','CHAVES','PAULOCHAVES@GMAIL','6666666',SYSDATE,'IT_PROG', 6000, 0.5,103,60);
    COMMIT;
END;

--Consultando

SELECT * FROM EMPLOYEES WHERE FIRST_NAME = 'PAULO'