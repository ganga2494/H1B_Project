3)Which industry has the most number of Data Scientist positions?


filterds = Filter h1b by job_title == 'DATA SCIENTIST';
neededdata = FOREACH filterds GENERATE $3,job_title;
finaldata = group neededdata by $0;
countofscient = FOREACH finaldata GENERATE $0,COUNT(neededdata.job_title);
odr = order countofscient by $1 desc;
dump odr;

