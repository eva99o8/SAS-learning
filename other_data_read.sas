data sdata_colon;
infile"/home/u61932235/other_del_data.txt" dlm = ':';
input name $ gender $ age $ weight;
run;
 
proc print data = sdata_colon;
run;