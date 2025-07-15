--Executando o script

@C:\OracleDatabase21cXE\dbhomeXE\rdbms\admin\utldtree.sql

--Executando DEPTREE_FILL

exec DEPTREE_FILL('TABLE','HR','EMPLOYEES')

--Utilizando a view DEPTREE

SELECT *
FROM
    DEPTREE
ORDER BY
    seq#;