BEGIN
    DBMS_SCHEDULER.CREATE_SCHEDULE(
        schedule_name => 'SCH_A_CADA_DIA',
        start_date => (SYSTIMESTAMP),
        -- ou TO_TIMESTAMP_TZ('2025-07-17 10.17.000000000 AMERICA/SAO PAULO','YYYY-MM-DD HH24:MI:SS.FF TZR'),
        repeat_interval =>  'FREQ = DAILY',
        end_date => SYSTIMESTAMP + INTERVAL '5' DAY,
        comments => '1 vez ao dia'
    );
END;

--Removendo

DBMS_SCHEDULER.DROP_SCHEDULE(
    schedule_name => 'SCH_A_CADA_DIA',
    force => False
);