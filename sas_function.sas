 proc import datafile="/home/u61932235/score_data.xlsx"
 out= scoredata0 DBMS= xlsx replace;
 run;
 
 data scoredata1;
 set scoredata0;
 totalScore = score1+score2+score3;
 /*generated missing values*/
 averageScore = totalScore/3;
 run;
 proc print data=scoredata1;
 run;
 
 data scoredata2;
 set scoredata0;
 totalScore = sum(score1,score2,score3);
 averageScore = mean(score1,score2,score3);
 run;
 proc print data=scoredata2;
 run; 