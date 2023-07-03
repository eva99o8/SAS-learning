proc import datafile = "/home/u61932235/Chara_data1.xlsx"
out = scoredata0 DBMS = xlsx replace;
run;

data scoredata1;
set scoredata0;
length phone_rep $10;
phone_rep = tranwrd(phone, '000','408');
run;
