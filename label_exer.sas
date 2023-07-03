/*section: creating labels and format
 
Coding Exercise 1:
 
data: 
sale.xlsx
 
Instruction:
1. import sale.xlsx and create SAS data set 'sale0'
2. create data 'sale1' with data step program:
a. assign labels to: 
emid	= employee id
sale_m1 = sale in Jan.
sale_m2 = sale in Feb.
sale_m3 = sale in Mar.
b. calculate average sale of three months' sales 
and assign format to average sale with $ , commas
and two decimal places
assign same format to sale_m1, sale_m2 and sale_m3
3. Print data 'sales1' with labels and formats
*/
proc import filename = "/home/u61932235/Sale.xlsx"
output = sale0 DBMS = xlsx replace;
run;

data sale1;
set sale0;
label emid = 'employee id'
		sale_m1 = 'sale in Jan.'
		sale_m2 = 'sale in Feb.'
		sale_m3 = 'sale in Mar.';
averageSale = mean(sale_m1, sale_m2,sale_m3);
format averageSale sale_m1 -- sale_m3 dollar5.2;
		run;
		
proc print data = sale1 label;
run;

/*answer*/

 
data sale1;
set sale0;
   label emid	= 'employee id'
		sale_m1 = 'sale in Jan.'
		sale_m2 = 'sale in Feb.'
		sale_m3 = 'sale in Mar.'
		averagesale = 'average sale of quarter1';
	averagesale = mean (of sale_m1, sale_m2, sale_m3);
	format averagesale sale_m1 --sale_m3 dollar10.2;
run; 
 
proc print data = sale1 label;
run;	


