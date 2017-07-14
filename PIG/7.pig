7) Create a bar graph to depict the number of applications for each year



dis = foreach h1b generate year,soc_name;
groupby = group dis by year;
cunt = foreach groupby generate $0,COUNT(dis.soc_name);
dump cunt;




OutPut:-

(2011,358767)
(2012,415607)
(2013,442114)
(2014,519427)
(2015,618727)
(2016,647803)


