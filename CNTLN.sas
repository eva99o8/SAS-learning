data fmt;
retain fmtname '$statefmt';
length start $2 label $2;
input start $ label $;
datalines;
01 CA
02 TX
03 NJ
;
run;

proc print data = fmt;run;
proc format cntlin=fmt;
run;

proc import datafile="/home/u61932235/Proc+format_CNTLIN.xlsx"
output = state0 DBMS = xlsx replace;
run;

data state1;
set state0;
format state $statefmt.;
run;

proc print data = state1;
run;


