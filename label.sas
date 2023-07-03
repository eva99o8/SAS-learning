proc import datafile="/home/u61932235/score_data_miss.xlsx"
DBMS = xlsx out = scoredata0 replace;
run;

/*perm*/
data scoredata;
set scoredata0;
label score1 = 'Math Score' 
score2 = 'Science Score' 
score3 = 'English Score';
run;

proc print data = scoredata label;
run;

/*temp*/
proc print data = scoredata label;
label name = 'student name';
run;
 


