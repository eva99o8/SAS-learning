proc import datafile = "/home/u61932235/score_data_miss" 
DBMS = xlsx out = scoredata0 replace ;
run;

data scoredata1;
set scoredata0;
length gender_full $ 7;
if gender = 'm' then gender_full = 'Male';
else if gender = 'f' then gender_full = 'Female';
else gender_full = 'Missing';
run;

proc print data = scoredata0;
title 'Truncated gender table';
run;

proc print data = scoredata1;
title 'Complete gender table';
run;


