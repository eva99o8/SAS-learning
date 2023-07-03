data sdata_column;
infile"/home/u61932235/DATA_column.txt";
input name $ 1-5
gender $ 6
weight $ 7-9
DOB $ 10-19
;
run;

proc print data = sdata_column;
run;
