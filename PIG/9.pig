
9) Which are top ten employers who have the highest success rate in petitions?



totalrecgrup = group h1b ALL;
totalrec = foreach totalrecgrup generate COUNT(h1b.soc_name)as totalApplications;

rec = foreach h1b generate employer_name,case_status;
fil_suc = FILTER rec by case_status == 'CERTIFIED' or case_status == 'CERTIFIED-WITHDRAWN';
rec1 = foreach fil_suc generate employer_name,case_status;
groupby = group rec1 by employer_name;
coutofEmplye = foreach groupby generate $0,COUNT(rec1.case_status) as cerftifiedApplications;

perc = foreach coutofEmplye generate $0,(cerftifiedApplications/(double)totalrec.totalApplications)*100;

odr = order perc by $1 desc;
lim = LIMIT odr 10;

dump lim;



OutPut:-

(INFOSYS LIMITED,4.329538093120773)
(TATA CONSULTANCY SERVICES LIMITED,2.141488020596547)
(WIPRO LIMITED,1.57518289260919)
(DELOITTE CONSULTING LLP,1.203285988585969)
(ACCENTURE LLP,1.1072309401171379)
(IBM INDIA PRIVATE LIMITED,0.9993521946280448)
(MICROSOFT CORPORATION,0.8355856643502212)
(HCL AMERICA, INC.,0.7497889220285467)
(ERNST & YOUNG U.S. LLP,0.5954147369893537)
(LARSEN & TOUBRO INFOTECH LIMITED,0.5606763820819366)

