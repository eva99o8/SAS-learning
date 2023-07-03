proc import datafile="/home/u61932235/Convert+Data.xlsx"
out = scoredata0 DBMS = xlsx replace;
run;

/*num to char*/
data scoredata1;
set scoredata0;
score_ac = raw_score *1; /*auto convert*/
score_num = input(raw_score, 7.); /*input convert*/
run;

/*char to num*/
data scoredata2;
set scoredata0;
gender_ac = gender||'/'||gender_code; /*auto coonvert*/
gender_char = put(gender_code, 8.); /*put convert*/
run;


