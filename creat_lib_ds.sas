/*
creat permanent library
*/
libname score "/home/u61932235";

/*
creat permanent dataset
*/
data score.stu_math;
input stu_name $stu_score;
cards;
Speedy 90
Tim 91
Mike 60
michael 75
;
run;

/*
creat a temp dataset
*/
data stu_math_temp;
input stu_name $stu_score;
cards;
Speedy 90
Tim 91
Mike 60
michael 75
;
run;