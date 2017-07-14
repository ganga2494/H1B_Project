dis = foreach h1b generate year,soc_name;
groupby = group dis by year;
cunt = foreach groupby generate $0,COUNT(dis.soc_name);
dump cunt;
