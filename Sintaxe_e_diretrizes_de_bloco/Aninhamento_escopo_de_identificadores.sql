SET SERVEROUTPUT ON
DECLARE
    vBloco1 VARCHAR2(100) := 'Bloco 1';
BEGIN
    DBMS_OUTPUT.PUT_LINE(vBloco1);
    
    DECLARE
        vBloco2 VARCHAR2(100) := 'Bloco 2';
    BEGIN
        DBMS_OUTPUT.PUT_LINE(vBloco1);
        DBMS_OUTPUT.PUT_LINE(vBloco2);
    END;
    
    DBMS_OUTPUT.PUT_LINE(vBloco1);
END;