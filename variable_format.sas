/*format for variable*/
proc import datafile="/home/u61932235/score_data_miss.xlsx"
DBMS = xlsx out = scoredata0 replace;
run;
 
data scoredata1;
set scoredata0;
TotalScore = sum(score1,score2,score3);
AverageScore = mean(score1,score2,score3);
run;

data scoredata2;
set scoredata1;
/*gives perm format to variable*/
format AverageScore 5.2; 
run;


proc print data = scoredata1;
run;
proc print data = scoredata2;
/*temp format*/
format AverageScore 4.1;
run;
