proc import datafile="/home/u61932235/score_data_miss777.xlsx"
DBMS = xlsx out = scoredata0 replace;
run;

data scoredata1;
set scoredata0;
if score1 = 777 then score1 = .;
if score2 = 777 then score2 = .;
if score3 = 777 then score3 = .;
AverageScore = mean(score1,score2,score3);
if AverageScore>= 90 then grade = 'A';
 else if AverageScore>= 80 then grade = 'B';
 else if AverageScore>= 70 then grade = 'C';
 else if AverageScore>= 60 then grade = 'D';
else if 0<AverageScore< 60 then grade = 'F';
else grade = ' ';
run;

proc print data = scoredata0;
run;
proc print data = scoredata1;
run;