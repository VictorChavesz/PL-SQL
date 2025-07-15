CREATE OR REPLACE PACKAGE BODY PCK_EMPLOYEES IS

-- Procedures

    PROCEDURE PRC_INSERT_EMPREGADO(
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
    END PRC_INSERT_EMPREGADO;
    
    
    PROCEDURE PRC_CONSULTA_DADOS_EMPREGADO(
        vEMPLOYEE_ID    IN EMPLOYEES.EMPLOYEE_ID%TYPE,
        vFIRST_NAME     OUT EMPLOYEES.FIRST_NAME%TYPE,
        vLAST_NAME      OUT EMPLOYEES.LAST_NAME%TYPE,
        vEMAIL          OUT EMPLOYEES.EMAIL%TYPE,
        vPHONE_NUMBER   OUT EMPLOYEES.PHONE_NUMBER%TYPE,
        vHIRE_DATE      OUT EMPLOYEES.HIRE_DATE%TYPE,
        vJOB_ID         OUT EMPLOYEES.JOB_ID%TYPE,
        vSALARY         OUT EMPLOYEES.SALARY%TYPE,
        vCOMMISSION_PCT OUT EMPLOYEES.COMMISSION_PCT%TYPE,
        vMANAGER_ID     OUT EMPLOYEES.MANAGER_ID%TYPE,
        vDEPARTMENT_ID  OUT EMPLOYEES.DEPARTMENT_ID%TYPE
    )
    IS
    BEGIN
        SELECT
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
        INTO
            vFIRST_NAME,   
            vLAST_NAME,    
            vEMAIL,         
            vPHONE_NUMBER,  
            vHIRE_DATE,     
            vJOB_ID,        
            vSALARY,       
            vCOMMISSION_PCT,
            vMANAGER_ID,    
            vDEPARTMENT_ID 
        FROM
            EMPLOYEES
        WHERE
            EMPLOYEE_ID = vEMPLOYEE_ID;
    EXCEPTION   
        WHEN NO_DATA_FOUND
        THEN
            RAISE_APPLICATION_ERROR(-20001,'ID EMPREGADO NAO EXISTE' || vEMPLOYEE_ID);
        WHEN OTHERS
        THEN
            RAISE_APPLICATION_ERROR(-20001,'ERRO ORACLE ' || SQLCODE || SQLERRM);
    END PRC_CONSULTA_DADOS_EMPREGADO;
    
    
    
    PROCEDURE PRC_AUMENTA_SALARIO(
        pEMPLOYEE_ID IN EMPLOYEES.EMPLOYEE_ID%TYPE,
        pPercentual  IN NUMBER
        ) 
    IS
    BEGIN
        UPDATE
            EMPLOYEES
        SET
            SALARY = SALARY * (1 + (pPercentual/100))
        WHERE
            EMPLOYEE_ID = pEMPLOYEE_ID;
        COMMIT;
    EXCEPTION
        WHEN OTHERS
        THEN
            RAISE_APPLICATION_ERROR(-20001,'ERRO ORACLE: ' || SQLCODE || ' '|| SQLERRM);
    END PRC_AUMENTA_SALARIO;

-- Functions
    
    FUNCTION FNC_BUSCA_SALARIO_EMPREGADO(
        fEMPLOYEE_ID EMPLOYEES.EMPLOYEE_ID%TYPE)
        RETURN NUMBER
    IS
        vSALARY EMPLOYEES.SALARY%TYPE;
    BEGIN
        SELECT
            SALARY
        INTO
            vSALARY
        FROM
            EMPLOYEES
        WHERE
            EMPLOYEE_ID = fEMPLOYEE_ID;
        RETURN vSALARY;
    
    EXCEPTION
        WHEN NO_DATA_FOUND
        THEN
            RAISE_APPLICATION_ERROR(-20001,'ID FUNCIONARIO NAO ENCONTRADO:' || fEMPLOYEE_ID);
        WHEN OTHERS
        THEN
            RAISE_APPLICATION_ERROR(-20002,'ERRO ORACLE:' || SQLCODE || SQLERRM);
    END FNC_BUSCA_SALARIO_EMPREGADO;
END PCK_EMPLOYEES;