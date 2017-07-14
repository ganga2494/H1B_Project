b) Find top 5 job titles who are having highest growth in applications.
pig-script
completed
```````````
first = foreach h1b generate job_title;
second = group first by $0;
third = foreach second generate $0,COUNT(first.$0);
fourth = order third by $1 desc;
fifth = limit fourth 5;
