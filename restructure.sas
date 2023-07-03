/*one obs per to many obs per*/
proc import datafile = "/home/u61932235/score_data_id.xlsx"
out = oneper DBMS = xlsx replace;
run;

libname stuscore "/home/u61932235";

data stuscore.manyper;
set oneper;
array score(3) score1 score2 score3;
do stime = 1 to 3;
	all_score = score(stime);
	if all_score ne . then output;
end;
keep name stu_id all_score stime;
run;



/*many obs per to one obs per*/
proc sort data = stuscore.manyper out = manyper;
		by stu_id stime;
run;

data stuscore.oneper;
set manyper;
by stu_id stime;
array score(3); /*creat score1 score2 score3*/
retain score1-score3;
/*retain vars that are not come from sas data*/
/*
first.var = 1 for 1st obs, for all other obs = 0
last.var = 1 for last obs, for all other obs = 0
call missing: set any value to missing
*/
if first.stu_id then call missing(of score1-score3);
score(stime) = all_score;
if last.stu_id then output;
keep name stu_id score1-score3;
run;

















