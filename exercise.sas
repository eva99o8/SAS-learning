/*Get data into SAS
coding exercise: formatted input
data:
Patient_HD_age.txt
there are 4 variables:  
Pid : occupy 1 digit/space
Sdate : in mm/dd/yyyy format
Edate : in mm/dd/yyyy format
age: occupy 2 digits/spaces
 
123456789012345678901234567890  --- column indicator
106/15/201006/16/201067
208/22/201108/25/201154
308/22/201108/23/201134
408/22/201108/29/201166
506/15/201006/17/201089
606/14/201006/15/201034
instruction:
1. read data using formatted input
2. display sdate edate with format date9.
3. create a permanent data set
*/

libname perm "/home/u61932235/";
data perm.patient_hd;
infile"/home/u61932235/Patient_HD_age.txt";
input 
@1 Pid 1.
@2 Sdate mmddyy10.
@12 Edate mmddyy10.
@20 age 2.
;
run;


proc print data= patient_hd;

run;

data perm.patient_hd_1;
set perm.patient_hd;
format Sdate date9.;
format Edate date9.;
run;
proc print data= patient_hd_1;
run;

