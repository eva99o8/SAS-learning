/* SAS programming for beginners: 
Section: work with Data into SAS
 
 
Practice
 
1. Create a temporary SAS data 'scoredata0' by Importing an Excel data file score_data.xlsx into SAS 
2. use SET statement to Create a permanent SAS data set score.scoredata from 'scoredata0'
3. Go to libraries folder in SAS studio, find the data sets in the WORK library
or the SCORE library
4. Both data sets should have 11 observations and 5 variables
*/
proc import datafile="/home/u61932235/score_data.xlsx"
out = scoredata0 DBMS = xlsx replace;
run;

libname score "/home/u61932235";
data score.scoredata;
set scoredata0;
run;



