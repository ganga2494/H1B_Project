10) Which are the top 10 job positions which have the highest success rate in petitions?



totalrecgrup = group h1b ALL;
totalrec = foreach totalrecgrup generate COUNT(h1b.soc_name)as totalApplications;

rec = foreach h1b generate job_title,case_status;
fil_suc = FILTER rec by case_status == 'CERTIFIED' or case_status == 'CERTIFIED-WITHDRAWN';
rec1 = foreach fil_suc generate job_title,case_status;
groupby = group rec1 by job_title;
coutofEmplye = foreach groupby generate $0,COUNT(rec1.case_status) as cerftifiedApplications;

d = foreach coutofEmplye generate $0,(cerftifiedApplications/(double)totalrec.totalApplications)*100;

odr = order d by $1 desc;
lim = LIMIT odr 10;

dump lim;


OutPut:-
(PROGRAMMER ANALYST,7.973335065255151)
(SOFTWARE ENGINEER,3.842934674906618)
(COMPUTER PROGRAMMER,2.2476681504573772)
(SYSTEMS ANALYST,1.9801861482891443)
(SOFTWARE DEVELOPER,1.3504660368466366)
(BUSINESS ANALYST,1.2581412815222262)
(COMPUTER SYSTEMS ANALYST,1.1085631876687165)
(TECHNOLOGY LEAD - US,0.9423653056092617)
(TECHNOLOGY ANALYST - US,0.8657277652046914)
(SENIOR SOFTWARE ENGINEER,0.8545701919602191)

