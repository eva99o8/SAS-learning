/*numeric functions*/
/*INT and ROUND functions*/

/*create data scoredata0*/
proc import datafile = "/home/u61932235/score_data" 
DBMS = xlsx out = scoredata0 replace ;
run;

data scoredata1;
set scoredata0;
average_score = MEAN (score1, score2, score3);
run;

data scoredata2;
set scoredata1;
average_INT = INT (average_score);
average_ROUND1 = round (average_score, .1);
average_ROUND2 = round (average_score, .01);
run;

proc print DATA = scoredata2;
run;


/*largest and smallest*/
data scoredata3;
set scoredata0;
totalscore = sum(score1,score2,score3);
averagescore = mean(score1, score2,score3);
max_score = max(score1,score2,score3);
min_score = min(score1,score2,score3);
small_2nd_score = smallest(2, score1,score2,score3);
large_2nd_score = largest(2, score1,score2,score3);
run;

proc print DATA = scoredata3;
run;


/*rand*/

/*eg*/
data uniform1;
do i = 1 to 10;
	randnum1 = rand("uniform", 1, 10);
	randnum2 = rand("uniform");
	output;
	end;
run;



