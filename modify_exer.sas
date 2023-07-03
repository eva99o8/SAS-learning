Udemy
SAS Programming BASE Certification Course for SAS Beginners
Coding Exercise: Solution
/*section: Modifying character and numeric data values
coding Exercise:
 
data:
chara_data2.xlsx; variable DOB is a character var in this data set.
Instruction:
1. creating new vars DOB_year, DOB_month, DOB_day by
Extracting year and day from var DOB using Scan function
Extracting month from var DOB using Substr function
2. creating new vars DOB_new1, DOB_new2 by concatenating 
vars DOB_year, DOB_month, DOB_day using TRIM and CATX function
the new values will be in the form of 2007, 9, 23
3. Using Tranwrd function to replace 'missing' with ' 'in var raw_score 
4. Using Index function to search for 2007 in the values of DOB,
then to create a subset data CD2 
*/

/*my answer*/ 
proc import datafile = "/home/u61932235/Chara_data2.xlsx"
out = data DBMS = xlsx replace;
run;

data data1;
set data;
DOB_year = scan(DOB, 3, '/');
DOB_month = substr(DOB, 1, 1);
DOB_day = scan(DOB, 2, '/');
DOB_new1 = trim(DOB_year)||','||trim(DOB_month)||','||trim(DOB_day);
length DOB_new2 $20;
DOB_new2 = catx(',',DOB_year, DOB_month,DOB_day);
raw_score = tranwrd(raw_score, 'missing', ' ');
run;

data data_CD2;
set data1;
if index(DOB,'2007')>0;
run;
 

/**/
proc import datafile = "/folders/myfolders/chara_data2" 
DBMS = xlsx out = cd0 replace ;
run;
 
data cd1;
set cd0;
DOB_year = SCAN(DOB,3, '/'); 
DOB_month= substr (DOB, 1, 1);
DOB_day = SCAN(DOB,2, '/'); 
 
DOB_new1 = trim(DOB_year) || ', ' || trim(DOB_month) ||', '||trim(DOB_day);
DOB_new2 = catx(', ',DOB_year,DOB_month,DOB_day);
 
index_DOB = index(DOB,'2007');
 
raw_score_new = TRANWRD(raw_score,'missing',' ');
run;
 
data cd2;
set cd1;
if index_DOB  ne 0 ;
run;

