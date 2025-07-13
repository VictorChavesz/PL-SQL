SET SERVEROUTPUT ON
ACCEPT vInicial PROMPT 'Digite o valor do indice inicial: '
ACCEPT vFinal   PROMPT 'Digite o valor do indice final: '
DECLARE
    vInicial NUMBER(38) := &vInicial;
    vFinal   NUMBER(38) := &vFinal;
BEGIN
    WHILE vInicial <= vFinal LOOP
        DBMS_OUTPUT.PUT_LINE(vInicial);
        vInicial := vInicial + 1;
    END LOOP;
END;