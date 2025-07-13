SET SERVEROUTPUT ON
ACCEPT limite PROMPT 'Digite o valor do limite: '
DECLARE
    vResultado NUMBER(3);
    vLimite NUMBER(11) := &limite;
BEGIN
DBMS_OUTPUT.PUT_LINE('Loop da tabuada do 1 ate o ' || vLimite);
<<LOOP1>>
    FOR i IN 1..vLimite LOOP
        DBMS_OUTPUT.PUT_LINE('Tabuada do ' || i);
        <<LOOP2>>
            FOR j IN 1..10 LOOP
                vResultado := i * j;
                DBMS_OUTPUT.PUT_LINE(i || ' X ' || j || ' = ' || vResultado);
            END LOOP;
        EXIT LOOP1 WHEN i = vLimite;
    END LOOP;
END;