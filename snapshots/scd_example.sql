{% snapshot scd_tbale1 %}

{{
    config(
        target_schema = "snapshot_schema",
        strategy = "check",
        unique_key = "ID",
        check_cols = ['FIRSTNAME','LASTNAME']
    )
}}

select * from {{source("guru_source","scd_eg")}}

{% endsnapshot %}