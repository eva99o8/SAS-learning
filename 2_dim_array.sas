proc import datafile = "/home/u61932235/monthly.xlsx"
out = monthly DBMS = xlsx replace;
run;

/*generate new data of quarterly sales*/
data quarter;
set monthly;
array m(4,3) month1-month12;
/*
month1 month2 month3
month4 month5 month6
month7 month8 month9
month10 month11 month12
*/
array qtr(4);
/* qtr1 qtr2 qtr3 qtr4 sum of each row i */
do i = 1 to 4;
	qtr(i) = 0;
		do j = 1 to 3;
			qtr(i)+m(i,j);
		end;
end;
run;
