proc import datafile = "/home/u61932235/score_data_id_partial_score4_genderNA.xlsx"
out = scoredata_p_na DBMS = xlsx replace;
run;
proc import datafile = "/home/u61932235/score_data_id.xlsx"
out = scoredata DBMS = xlsx replace;
run;

proc sort data = scoredata;
by stu_id;
run;
proc sort data = scoredata_p_na;
by stu_id;
run;


/*rename*/
data merg_rename;
merge scoredata scoredata_p_na(rename=(gender = gender_na));
/*rename gender to avoid overwrite with missing*/
by stu_id;
run;

proc print data = scoredata_p_na;
title 'gender missing';
run;
proc print data = scoredata;
title 'scoredata';
run;
proc print data = merg_rename;
title 'match merge';
run;


/*excluding unmatch obs*/
proc import datafile = "/home/u61932235/score_data_id_partial_score4.xlsx"
out = scoredata_p DBMS = xlsx replace;
run;
proc sort data = scoredata_p;
by stu_id;
run;

data exclud_unmatch;
merge scoredata_p(in = A) scoredata(in = B);
/*creat temp var to indicate contribution for merge DS*/
by stu_id;
if A = 1 and B = 1;
run;

proc print data = scoredata_p;
title 'partial';
run;
proc print data = scoredata;
title 'scoredata';
run;
proc print data = exclud_unmatch;
title 'match merge';
run;


/*drop or keep*/
data merge_drop(drop = stu_id);
merge scoredata_p(in = A) scoredata(in = B drop = score3);
by stu_id;
if A = 1 and B = 1;
run;

proc print data = scoredata_p;
title 'partial';
run;
proc print data = scoredata;
title 'scoredata';
run;
proc print data = merge_drop;
title 'match merge';
run;


