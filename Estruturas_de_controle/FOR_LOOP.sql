SET SERVEROUTPUT ON
ACCEPT pLimite PROMPT 'Digite o valor do limite: '
DECLARE
    vLimite NUMBER(38) := &pLimite;
BEGIN
    FOR vIndice IN 1..vLimite LOOP
        DBMS_OUTPUT.PUT_LINE(vIndice);
    END LOOP;
END;