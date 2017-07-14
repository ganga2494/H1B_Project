totalrecgrup = group h1b ALL;
totalrec = foreach totalrecgrup generate COUNT(h1b.soc_name)as totalApplications;


dis = foreach h1b generate year,case_status;
grp = GROUP dis by year;
cunt = foreach grp generate $0,COUNT($1) as case_application;

perc = foreach cunt generate $0,ROUND_TO(((case_application/(double)totalrec.totalApplications)*100),2);

odr = order perc by $1 desc;

dump odr;
