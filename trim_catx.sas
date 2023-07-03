proc import datafile = "/home/u61932235/Chara_data.xlsx"
out = scoredata0 DBMS = xlsx replace;
run;

data scoredata1;
set scoredata0;
last_name = scan(full_name,1,',: ');
first_name = scan(full_name,2,',: ');
run;

data scoredata2;
set scoredata1;
student_name1 = trim(last_name)||','||trim(first_name);
length student_name2 $25; /**/
student_name2 = catx(',',last_name,first_name);
run;



proc print data = scoredata2;
run;
