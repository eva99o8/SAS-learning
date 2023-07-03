proc import datafile = "/home/u61932235/Chara_data.xlsx"
out = scoredata0 DBMS = xlsx replace;
run;

data scoredata1;
set scoredata0;
last_name = scan(full_name, 1, ',: ');
run;
