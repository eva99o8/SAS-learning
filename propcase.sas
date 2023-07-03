proc import datafile = "/home/u61932235/Chara_data1.xlsx"
out = scoredata0 DBMS = xlsx replace;
run;

data scoredata1;
set scoredata0;
full_name_UC = upcase(full_name);
full_name_LC = lowcase(full_name);
full_name_pro = propcase(full_name,' ,:');
run;

