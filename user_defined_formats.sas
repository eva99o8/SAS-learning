/*self-defined format for variable*/
proc import datafile="/home/u61932235/score_data_miss.xlsx"
DBMS = xlsx out = scoredata0 replace;
run;
 
data scoredata1;
set scoredata0;
TotalScore = sum(score1,score2,score3);
AverageScore = mean(score1,score2,score3);
run;

libname myfmts "/home/u61932235/formats"; 

proc format library = myfmts;
	value $gender 
	'm' = 'Male'	
	'f' = 'Female';
	value scoregroup 
	0-<60 = 'F' 
	60-<70 = 'D'
	70-<80 = 'C'
	80-<90 = 'B'
	90-high = 'A'
	other = 'Missing';
run;
	
	
title "Formats Definitions in the myfmts library";
proc format library=myfmts fmtlib;
run;

proc print data = scoredata1;
format gender $gender. AverageScore scoregroup.;
run;	
					
