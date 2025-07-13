SET SERVEROUTPUT ON
ACCEPT vInicial PROMPT 'Digite o valor do indice inicial: '
ACCEPT vFinal   PROMPT 'Digite o valor do indice final: '
DECLARE
    vInicial NUMBER(38) := &vInicial;
    vFinal   NUMBER(38) := &vFinal;
BEGIN
    FOR i IN vInicial..vFinal LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;