{{
    config(
        materialized = 'ephemeral'
    )
}}

select *,'{{info_schema}}' as infodesc,'{{invocation_id}}' as invocation_id,'{{run_started_at}}' as model_run_start from {{source("guru_source","USERS")}}