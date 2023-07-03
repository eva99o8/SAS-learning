 /*
 import delimitered external data
 */

/*blank seperated data */
proc import datafile= "/home/u61932235/DATA_blanks.txt"
DBMS=dlm out=data_blank 
replace;
guessingrows=2;
getnames=no;
delimiter=' ';
run;

proc print data = data_blank;
run;
data data_blank_1;
set data_blank;
drop var5;
run;
proc print data = data_blank_1;
run;

/*comma seperated data */
proc import datafile= "/home/u61932235/DATA_commas.csv"
DBMS=dlm out=data_comma
replace;
guessingrows=2;
getnames=no;
delimiter=',';
run;
proc print data = data_comma;
run;

/*colon seperated data */

proc import datafile= "/home/u61932235/other_del_data.txt"
DBMS=dlm out=data_colon
replace;
guessingrows=2;
getnames=no;
delimiter=':';
run;

proc print data = data_colon;
run;

data data_colon_1;
set data_colon;
if var1 = ' ' then delete;
run;
proc print data = data_colon_1;
run;



