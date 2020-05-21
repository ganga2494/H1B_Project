h1b = load '/user/hive/warehouse/h1b.db/h1bfinal' using PigStorage('\t') as (s_no:chararray,case_status:chararray,employer_name:chararray,soc_name:chararray,job_title:chararray,full_time_position:chararray,prevailing_wage:int,year:chararray,worksite:chararray,longitute:double,latitute:double);
h1b= foreach h1b generate case_status,prevailing_wage;
h1b= group h1b by case_status;
h1b= foreach h1b generate group,COUNT(h1b.prevailing_wage);
dump h1b;

1 a) Is the number of petitions with Data Engineer job title increasing over time?
pig-script
completed
```````````
first = filter h1b by job_title == 'DATA ENGINEER';
second = foreach first generate soc_name,year;
third = group second by $1;
count1 = foreach third generate $0,COUNT(second.soc_name);
count1 = foreach third generate $0,COUNT(second.soc_name);



