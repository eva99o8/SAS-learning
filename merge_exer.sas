/*merge exercise*/
/*
1. merge class information to student-level data by variable class.

Only the observations with class-level information will

be kept in the merged data.

*/

proc import datafile = "/home/u61932235/score_data_id_class.xlsx"
out = stu_info DBMS = xlsx replace;
run;
proc import datafile = "/home/u61932235/class_info.xlsx"
out = class_info DBMS = xlsx replace;
run;

proc sort data = stu_info;
by class;
run;
proc sort data = class_info;
by class;
run;

data class_merge;
merge class_info(in = A) stu_info;
by class;
if A = 1;
run;

proc print data = stu_info;
title 'stu_info';
run;
proc print data = class_info;
title 'class_info';
run;
proc print data = class_merge;
title 'merge';
run;

/**/
data m0;
merge class_info (in = inC) stu_info (in = inS);
by class;
if inC;
run;
