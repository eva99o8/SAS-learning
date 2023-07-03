proc import datafile = "/home/u61932235/SAS+date.xlsx"
out = scoredata0 DBMS = xlsx replace;
run;

/*funtion myd(month,day,year)*/
data scoredata1;
set scoredata0;
Bdate = mdy(month, day, year);
run;

proc print data=scoredata1;
format Bdate date9.;
run; 

/**/
data scoredata2;
set scoredata0;
sdate = start_date; /*to show the sas date value*/
s_year = year(start_date);
s_month = month(start_date);
s_dat = day(start_date);
s_weekday = weekday(start_date);
run;

data scoredata3;
set scoredata2;
if s_weekday in (1,7); /*to show sunday and saturday*/
run;

/*today date intck*/
data scoredata4;
set scoredata0;
today_date1 = date();
today_date2 = today();
years = intck('year',start_date,today());
months = intck('month',start_date, today());
days = intck('day',start_date, today());
run;

proc print data= scoredata4;
format today_date1 date9.;
run;






