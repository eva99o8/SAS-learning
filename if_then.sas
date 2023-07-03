proc import datafile="/home/u61932235/score_data.xlsx"
DBMS = xlsx out= score_data0 replace;
run;

data scoredata_ifthen;
set score_data0;
totalscore = sum(score1,score2,score3);
average = mean(score1,score2,score3);

/*IF THEN usage*/
if gender = 'm' 
	then gender_num = 1;
if score1 ne . 
	and score2 ne . 
	and score3 ne . 
	then take = 'complete';
	
if average >= 90 
	then do;
		grade = 'A';
		pass = 'pass';
	 	end;
run;

proc print data = scoredata_ifthen;
run;
