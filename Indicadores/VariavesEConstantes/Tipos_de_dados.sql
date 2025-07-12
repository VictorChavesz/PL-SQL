--Tipos de dados

SET SERVEROUTPUT ON
DECLARE
    vNumero                 NUMBER(11,2) := 12543.34;
    vCaracterTamFixo        CHAR(100) := 'Rua das Ortencias Quadra 3 Casa 5';
    vCaracterTamVariavel    VARCHAR2(100) := 'Rua das Ortencias Quadra 3 Casa 5';
    vBoolean                BOOLEAN := True;
    vData                   DATE := sysdate;
    vLong                   LONG := 'Rua das Ortencias Quadra 3 Casa 5';
    vRowid                  ROWID;
    vTimestamp              TIMESTAMP := systimestamp;
    vTimestampz             TIMESTAMP WITH TIME ZONE := systimestamp;
    vCaracterTamFixoUniv    NCHAR(100) := 'Rua das Ortencias Quadra 3 Casa 5';
    vCaracterTamFixoVar     NVARCHAR2(100) := 'Rua das Ortencias Quadra 3 Casa 5';
    vNumInteiro             BINARY_INTEGER := 2432123;
    vNumFloat               BINARY_FLOAT := 42545657;
    vNumDouble              BINARY_DOUBLE := 7867598640;
BEGIN
    DBMS_OUTPUT.PUT_LINE(vNumero);
    DBMS_OUTPUT.PUT_LINE(vCaracterTamFixo);
    DBMS_OUTPUT.PUT_LINE(vCaracterTamVariavel);
    IF 
        vBoolean = TRUE
    THEN
        DBMS_OUTPUT.PUT_LINE('Valor = ' || 'TRUE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Valor = ' || 'FALSE OR NULL');
    END IF;
    DBMS_OUTPUT.PUT_LINE(vData);
    DBMS_OUTPUT.PUT_LINE(vLong);
    SELECT
        rowid
    INTO
        vRowid
    FROM
        employees
    WHERE
        first_name = 'David' AND last_name = 'Bernstein';
    DBMS_OUTPUT.PUT_LINE(vRowid);
    DBMS_OUTPUT.PUT_LINE(vTimestamp);
    DBMS_OUTPUT.PUT_LINE(vTimestampz);
    DBMS_OUTPUT.PUT_LINE(vCaracterTamFixoUniv);
    DBMS_OUTPUT.PUT_LINE(vCaracterTamFixoVar);
    DBMS_OUTPUT.PUT_LINE(vNumInteiro);
    DBMS_OUTPUT.PUT_LINE(vNumDouble);
END;