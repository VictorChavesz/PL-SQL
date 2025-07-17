BEGIN
    DBMS_SCHEDULER.CREATE_JOB(
        job_name        => 'JOB_EXECUTA_INSERE_AGENDA',
        program_name    => 'HR.INSERE_DATA_AGENDA3',
        schedule_name   => 'SCH_A_CADA_MINUTO',
        enable          => TRUE
    );
END;

BEGIN
    DBMS_SCHEDULER.DISABLE(
    name => 'JOB_EXECUTA_INSERE_AGENDA'
    );
END;

SELECT job_name, status, error#, additional_info, actual_start_date
FROM USER_SCHEDULER_JOB_RUN_DETAILS
WHERE job_name = 'JOB_EXECUTA_INSERE_AGENDA'
ORDER BY actual_start_date DESC;

SELECT * FROM USER_SCHEDULER_JOBS;

SELECT * FROM AGENDA1;