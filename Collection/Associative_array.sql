SET SERVEROUTPUT ON
DECLARE
    TYPE number_table_type IS TABLE OF NUMBER(2) INDEX BY BINARY_INTEGER;
    number_table number_table_type;
BEGIN
    FOR i IN 1..10 LOOP
        number_table(i) := i;
    END LOOP;
    
    FOR i IN REVERSE 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(number_table(i));
    END LOOP;
END;
/