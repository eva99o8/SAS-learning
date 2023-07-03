proc import datafile = "/home/u61932235/score_data_miss999.xlsx"
out = scoredata0 DBMS = xlsx replace;
run;

/*incluse existing var into array*/
data scoredata1 (drop = i);
set scoredata0;
array score_var (3) score1 score2 score3;
do i = 1 to 3;
if score_var(i) = 999 then score_var(i) = .;
end;
ave_score = mean(score1,score2,score3);
run;


/**/
data scoredata2 (drop = i);
set scoredata1;
array score_var (3) score1 score2 score3;
array score_diff(3); /*creat new array*/
do i = 1 to 3;
score_diff(i) = score_var(i)-ave_score;
end;
run;

/**/
proc means data = scoredata1;
var score1 score2 score3;
run;
/*79.5 81.9 80.8*/

data scoredata3 (drop = i);
set scoredata1;
	array score(3) score1 score2 score3;
	/*assign initial values to array*/
	array average_score(3) _temporary_ (79.5 81.9 80.8);
	array score_diff(3);
	do i = 1 to 3;
		score_diff(i) = score(i)-average_score(i);
	end;
	run;

proc print data = scoredata3;
run;
	








