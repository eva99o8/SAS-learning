proc import datafile = "/home/u61932235/Chara_data1.xlsx"
out = scoredata0 DBMS = xlsx replace;
run;

data scoredata1;
set scoredata0;
Exchange = substr(Phone,1,3);
run;

data scoredata2;
set scoredata1;
if Exchange = '000' then substr(phone,1,3) = '408';
run;

proc print data = scoredata2;
run;
