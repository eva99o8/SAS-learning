proc import datafile = "/home/u61932235/score_data_miss" 
DBMS = xlsx out = scoredata0 replace ;
run;

data scoredata1;
set scoredata0;
length take $ 10 ;
if score1 ne . and score2 ne . and score3 ne .
then take = 'complete';
else take = 'incomplete';
run;

data score_data_subset;
set scoredata1;
if take = 'complete';
/*if take = 'incomplete' then delete;*/
run;




