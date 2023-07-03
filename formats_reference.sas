/*reference formats*/
proc import datafile="/home/u61932235/score_data_miss.xlsx"
DBMS = xlsx out = scoredata0 replace;
run;
 
data scoredata1;
set scoredata0;
TotalScore = sum(score1,score2,score3);
AverageScore = mean(score1,score2,score3);
run;

/*creat lib since new session have no previous library*/
libname myfmts "/home/u61932235/formats";
/*set myfmts before work and library*/
options fmtsearch= (myfmts work library);

proc print data = scoredata1;
		format gender $gender. AverageScore scoregroup. ;
		run;


