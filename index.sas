proc import datafile = "/home/u61932235/Chara_data1.xlsx"
out = scoredata0 DBMS = xlsx replace;
run;

data scoredata1;
set scoredata0;
index_num = index(phone,'408');
run;

data scoredata2;
set scoredata1;
if index_num = 1;
run;