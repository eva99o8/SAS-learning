libname cert "/home/u61932235/input";
libname result "/home/u61932235/output";

/*Q1*/
/*
1. 用libname方法引入c:\cert\input中名为test1的xlsx文件，要求library的名称叫te。
此文件中都有哪些sheet名称？其中对第三个sheet中的height变量求平均数、求和。
再查看第二个sheet中的第二条观测是什么。
*/
libname te xlsx"/home/u61932235/input02.xlsx";
run;

proc contents data = mylab1._all_;
run;

proc means data = sheetC sum mean;
var height;
run;

proc print data = te.sheetC (obs = 2 firstobs = 2);
run;


/*
用proc import方法引入c:\cert\input中名为input02的xlsx文件的sheetA，
且要求程序自动识别变量名称。如果变量name的值是jordan则输出到results.output02_1，
如果值是bryant则输出到results.output02_2。如果值是james则输出到临时results.output02_3。
自定义一个format，让bryant显示为kobebryant，让james显示为lebronjames。
*/
libname result "/home/u61932235/output";
proc import datafile = "/home/u61932235/input/input02.xlsx"
out = result.output02 DBMS = xlsx replace;
getnames = yes;
run;

proc format;
value $fmt
	  'bryant' = 'kobebryant'
	  'james' = 'lebronjames';
run;

data result.output02_1
	 result.output02_2
	 result.output02_3;
set result.output02;
if name = 'jordan' then output result.output02_1;
else if name = 'bryant' then output result.output02_2;
else if name = 'james' then output result.output02_3;
run;

proc print data = result.output02_1;
run;

proc print data = result.output02_2;
format name $fmt.;
run;
proc print data = result.output02_3;
format name $fmt.;
run;

/*
第三题：
把major变量中含有and的都挑出来，and前面的专业重新命名为major变量，
and后面的专业命名为second_major变量。
（1）主副专业里分别是哪个专业出现最多？
（2）新建一个变量grade，根据学生的test1~test4成绩进行评价,
平均成绩低于3.5分的为bad，大于等于3.5分的为good，
然后筛选出来自senior，Beijing或Tianjin，good且没有second_major的学生，
输出结果要略去所有以test开头的变量。
*/
libname result "/home/u61932235/output";
libname cert '/home/u61932235/input';
Data cert.input03;
Input name $ city $ 3-10 major $ 12-27 class $ test1 test2 test3 test4;
Datalines;
A Beijing  math             senior 5 4 3 4
B Beijing  math             senior 2 1 1 5
C Tianjin  history          senior 5 5 5 5
D Shanghai history and ball junior 4 4 4 4
E Hebei    ball and reading junior 1 1 2 3
F Beijing  run              junior 2 2 1 2
G Beijing  run and ball     senior 5 4 5 1
;

data result.output03_1;
set cert.input03;
n = find(major,'and','i');
if n ^= 0 then do;
second_major = substr(major,n+4);
major = scan(major,1);
end;
run;


data result.output03_1;
set cert.input03;
n = find(major,'and','i');
if n ^= 0 then do;
second_major = substr(major,n+4);
major = substr(major,1,n-2);
end;
run;

proc freq data = result.output03_1;
tables major second_major;
run;

data result.output03_2(drop = second_major n ave);
set cert.input03;
length grade $4;
ave = mean(of test1-test4);
if ave< 3.5 then grade = 'bad';
else if ave >3.5 then grade = 'good';
n = find(major,'and','i');
if n ^= 0 then do;
second_major = substr(major,n+4);
major = substr(major,1,n-2);
end;
if n=0 and class = 'senior' and grade = 'good' and (city = 'Beijing' or city = 'Tianjin') ; 
run;

/*Q4
将word变量中是两个字符长度的值大写，输出的时候把Word变量重命名为Wo。
*/
libname cert '/home/u61932235/input';
Data cert.input04;
Input word $;
Datalines;
she
it
He
And
WHO
;
Run;




/*Q6
在每个department中，挑出含有最高income的观测。
*/
libname cert '/home/u61932235/input';
Data cert.input06;
Input department $ income dollar6.;
Datalines;
Hr $1000
Eng $500
Hr $10000
Hr $7500
Eng $200
Clean $20
Eng $3000
Clean $10
;
Run;

libname result "/home/u61932235/output";
proc sort data = cert.input06 out = result.output06sort;
by department descending income;
run;
data result.output06;
set result.output06sort;
by department;
if first.department;
run;
proc print data = result.output06;
run;

/*Q7
第九题：
提取custID中的数字部分，设为新变量a。再设立一个新变量b，b=a*1000。
最后把custID中的数字部分统一替换为9999。
*/
libname cert '/home/u61932235/output';
Data cert.input09;
Input custID $;
Datalines;
ID1573
ID2369
ID5361
ID8902
;
Run;

libname result "/home/u61932235/output";
data result.output09;
set cert.input09;
length a 4.;
a = input(substr(custID, 3,6),4.);
b = a*1000;
substr(custID,3,6) = '9999';
run;


/*Q8
引入c:\cert\input中名为input08的xlsx文件。
在此文件的一个名叫state的sheet中有一些数据，请将变量location的值中的省份部分大写
（提示：location中的值的样式为‘城市 省份’，比如Chengdu sichuan）。
*/
libname input08 xlsx "/home/u61932235/input/input08.xlsx";
libname result "/home/u61932235/output";

data result.output08;
set input08.state;
province = upcase(scan(location,2));
run;


/*Q10
建立新的变量fullname，其值为原数据集中firstname和lastname的拼接。
新建两个变量zflag 和nozflag，记录下fullname中有z（或Z）的有多少
（有z/Z时，zflag = 1，nozflag = 0），
没有z（或Z）的有多少（无z/Z时，zflag = 0，nozflag = 1），
结果不要显示原始数据集的firstname和lastname变量。
*/
libname cert '/home/u61932235/input';
Data cert.input10;
Input firstname $ lastname $;
Datalines;
Lazrry brown
Kobe Bryant
Zach oneal
Kevin Durant
Lebron jamesz
chrisZ pual
chris Zwebber
;
Run;

libname result "/home/u61932235/output";
data result.output10(drop = firstname lastname z);
set cert.input10;
length fullname $30.;
fullname = catx(' ',firstname,lastname);
z = find(fullname, 'Z','i');
if z^=0 then do;
zflag = 1;
nozflag = 0;
end;
else if z = 0 then do;
zflag = 0;
nozflag = 1;
end;
run;

/*原始数据集name里有叫Amanda、Tao或Chen的，挑出来。
建立一个计数变量count。上述名字分别出现了几次？（
港真，这题直接proc freq data = XXX; tables name; run;
不就vans了吗，真不知道改成这么写算不算正确）
*/
libname cert '/home/u61932235/input';
Data cert.input11;
Input name $;
Datalines;
Amanda
Tao
Tao
Chen
Kobe
Chen
Amanda
Tao
Chen
Jordan
Tao
;
Run;


proc sort data = cert.input11 out = test11std;
by name;
run;

data result.output11;
set test11std;
by name;
if name in ('Amanda','Tao','Chen') then do;
if first.name then count=0;
count + 1;
end;
else count = 0;
run;
proc print data = output11;
run;

/*第十二题：
在每个department内，求income的总和。
*/
libname cert '/home/u61932235/input';
Data cert.input12;
Input department $ income dollar6.;
Datalines;
Hr $1000
Eng $500
Hr $10000
Hr $7500
Eng $200
Clean $20
Eng $3000
Clean $10
;
Run;
libname result '/home/u61932235/output';
proc sort data = cert.input12;
by department;
run;

data result.output12(drop = income);
set cert.input12;
by department;
if first.department = 1 then total = 0;
total + income;
if last.department;
run;


/*
Q13
假设初始存款为50元，月利率为5%，第二年起每年年初再额外存入50元。
（1）问3年后是多少元（答案：540.64元），请让程序显示每个月份的金额结果。
（2）请让程序仅仅显示最终一条结果，在这条结果中，year和month的值是多少
*/
libname cert "/home/u61932235/input";
libname result "/home/u61932235/output";
data result.output13(drop = interest);
deposit = 50;
interest = 0.05;
year = 1;
do i = 1 to 36;
	deposit + interest*deposit;
	output;
	if i in(12,24) then deposit+50;
	length year 4.;
	if i in (12,24) then year+1;	
end;
rename i = month;
run;

proc print data = result.output13;
format deposit dollar8.;
run;

