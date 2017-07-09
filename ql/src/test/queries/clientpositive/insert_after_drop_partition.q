
-- set hive.exec.stagingdir=${system:test.tmp.dir}/staging-dir;
-- when we use default relative location of `hive.exec.stagingdir`

create external table insert_after_drop_partition(key string, val string) partitioned by (insertdate string);

from src insert overwrite table insert_after_drop_partition partition (insertdate='2008-01-01') select *;

alter table insert_after_drop_partition drop partition (insertdate='2008-01-01');

insert overwrite table insert_after_drop_partition partition (insertdate='2008-01-01') select * from src limit 10;