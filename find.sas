proc import datafile = "/home/u61932235/Chara_data1.xlsx"
out = scoredata0 DBMS = xlsx replace;
run;

data scoredata1;
set scoredata0;
find_m = find(name,'m');
run; 

proc print data = scoredata1;
var name find_m;
run;

data scoredata2;
set scoredata0;
find_m = find(name,'m','i');
run; 
