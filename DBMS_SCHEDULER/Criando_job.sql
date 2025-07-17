BEGIN
    DBMS_SCHEDULER.CREATE_JOB(
        job_name        => 'JOB_EXECUTA_INSERE_AGENDA',
        program_name    => 'HR.INSERE_DATA_AGENDA1',
        schedule_name   => 'SCH_A_CADA_DIA'
    );
    
    DBMS_SCHEDULER.ENABLE(
        name => 'JOB_EXECUTA_INSERE_AGENDA'
    );
END;