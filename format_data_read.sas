data sdata_format;
infile "/home/u61932235/DATA_column.txt";
input 
@1 name $5.
@6 gender $1.
@7 weight 3.
@10 DOB mmddyy10.
;
format DOB mmddyy10.;
run;

proc print data = sdata_format;
run;

proc print data = sdata_format;
format DOB date9.; 
run;

proc print data = sdata_format;
format DOB mmddyy10.;
run;