data sdata_commas;
infile "/home/u61932235/DATA_commas.csv" dsd;
input name$ gender $ age $ weight;
run;

proc print data = sdata_commas;
run;
