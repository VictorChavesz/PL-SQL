--Bloco anonimo
SET SERVEROUTPUT ON
DECLARE
    vnumero_1 NUMBER(11,2) := 553;
    vnumero_2 NUMBER(11,2) := 400;
    vnumero_media NUMBER(11,2);
BEGIN
    vnumero_media := (vnumero_1 + vnumero_2) / 2;
    DBMS_OUTPUT.PUT_LINE('A media e ' || vnumero_media);
END;
    