/*compute the total amount of money you will have if you start with $100 and invest it at a 3.75% interest rate for 3 years*/

data earnings;
   Interest = .0375;
   Total = 100;

   Year + 1;
   Total + Interest*Total;
   
   Year + 1;
   Total + Interest*Total;
   
   Year + 1;
   Total + Interest*Total;


format Total dollar10.2;
run;

/*do loop*/
data earnings1;
interest = 0.0375;
total = 100;
do year = 1 to 3;
total +interest *total;
end;
format total dollar10.2;
run;

proc print data = earnings1;
run;

/*reach 4 before calculation*/
/*After the third execution of the DO loop, 
the value of year is incremented to 4. 
Because 4 exceeds the stop value of the iterative DO statement, 
the DO loop stops executing, and processing continues to the 
next DATA step statement. The end of the DATA step is reached, 
the values are written to the Earnings data set, 
year shows as 4 instead of 3
and only one observation is written to the data set.
*/

/*we can use a count and drop it when finish*/


data earnings2 (drop = count);
interest = 0.0375;
total = 100;
do count = 1 to 3;
total +interest*total;
year+1;
output;
end;
format total dollar10.2;
run;




