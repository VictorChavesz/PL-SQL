SET SERVEROUTPUT ON
DECLARE
    type number_table_type IS VARRAY(10) OF NUMBER(3);
    number_table number_table_type := number_table_type();
BEGIN
    FOR i IN 1..10 LOOP
        number_table.extend;
        number_table(i) := i;
        DBMS_OUTPUT.PUT_LINE(number_table(i));
    END LOOP;
END;