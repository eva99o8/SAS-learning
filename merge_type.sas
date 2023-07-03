/*merge type*/

proc import datafile = "/home/u61932235/score_data_id_gender_only.xlsx"
out = scoredata_g DBMS = xlsx replace;
run;

proc import datafile = "/home/u61932235/score_data_id_no_gender.xlsx"
out = scoredata DBMS = xlsx replace;
run;

proc sort data = scoredata_g;
by stu_id;
run;

proc sort data = scoredata;
by stu_id;
run;


/*one to one */
data onetoone;
merge scoredata_g scoredata;
by stu_id;
run;

proc print data = scoredata_g;
title 'only gender';
run;

proc print data = scoredata;
title 'no gender';
run;

proc print data = onetoone;
title 'one to one merge';
run;


/*one to many*/

proc import datafile = "/home/u61932235/score_data_id_gender_only_dup.xlsx"
out = scoredata_g_dup DBMS = xlsx replace;
run;

proc sort data = scoredata_g_dup;
by stu_id;
run;

data onetomany;
merge scoredata_g_dup scoredata;
by stu_id;
run;

proc print data = scoredata_g_dup;
title 'only gender';
run;

proc print data = scoredata;
title 'no gender';
run;

proc print data = onetomany;
title 'one to many merge';
run;

