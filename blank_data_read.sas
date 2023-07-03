read data seperated by blanks into SAS;
/*comment:
original data:
Tim M 50 145
Sara . 23 130 
Mike M 65 180
Laura F . 130
Sean M 15 167
*/

data sdata_blanks;
infile"/home/u61932235/DATA_blanks.txt";
input name $ gender $ age $ weight;
run;

proc print data = sdata_blanks;
run;