SET SERVEROUTPUT ON
ACCEPT plimit PROMPT 'Digite o valor do limite: '
DECLARE
    vNumero NUMBER(38) := 1;
    vLimite NUMBER(38) := &plimit;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(vNumero);
        EXIT WHEN vNumero = vLimite;
        vNumero := vNumero + 1;
    END LOOP;
END;