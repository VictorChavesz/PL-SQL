SET SERVEROUTPUT ON
DECLARE
    vNum1 NUMBER(11,2);     --Declaracao da variavel 1
    vNum2 NUMBER(11,2);     --Declaracao da variavel 2
    vMedia NUMBER(11,2);    --Declaracao da variavel media
BEGIN
    vNum1 := 324;
    vNum2 := 542;
    vMedia := (vNum1 + vNum2)/2;
    DBMS_OUTPUT.PUT_LINE('Valor1 = ' || vNum1);  --Impressao da primeria variavel
    DBMS_OUTPUT.PUT_LINE('Valor2 = ' || vNum2);  --Impressao da segunda variavel
    DBMS_OUTPUT.PUT_LINE('Media = ' || vMedia);   --Impressao da media entre a soma das variaves
END;