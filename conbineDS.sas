
proc import datafile = "/home/u61932235/score_data_id.xlsx"
out = scoredata DBMS = xlsx replace;
run;

proc import datafile = "/home/u61932235/score_data_id_partial.xlsx"
out = partial DBMS = xlsx replace;
run;


/*one to one*/
data one_2_one; 
set scoredata;
set partial;
run;


/*concatenate*/
data conca;
set scoredata partial;
run;


/*append*/
proc append base = partial
			data = scoredata force;
			run;
/*add scoredata to partial data, force for diff # of var*/
proc print data = partial;
title 'append';
run;

/*interleave*/
proc sort data = scoredata;
by stu_id;
run;
proc sort data = partial;
by stu_id;
run;

data interleave;
set scoredata partial;
by stu_id;
run;


/*matching*/
proc sort data = scoredata;
by stu_id;
run;
proc sort data = partial;
by stu_id;
run;

data matchmerging;
merge scoredata partial;
by stu_id;
run;






