/*data:
sale_state.xlsx
sale in CA: variables saleCA1 saleCA2 saleCA3
sale in TX: variables saleTX1 saleTX2 saleTX3
 
instruction:
1. using two dimensional array to calculate 
total sale for each state (CA, TX) of each year
2. Print the output with dollar format 
*/


proc import datafile = "/home/u61932235/sale_state.xlsx"
out = sale0 DBMS = xlsx replace;
run;


data sale1;
set sale0;
array sale(2,3) saleCA1 -- saleTX3;
array state_sale (2) ca_sale tx_sale;
do i = 1 to 2;
state_sale(i) = 0;
	do j = 1 to 3;
		state_sale(i) + sale(i,j);
	end;
end;
run;

proc print data = sale1;
format saleCA1 -- tx_sale dollar10.;
run; 


data sale2;
set sale1;
array sale (2,3) saleCA1 -- saleTX3;
array state_sale (2) state_sale_CA state_sale_TX;
do i = 1 to 2;
state_sale (i) = 0;
 	do j=1 to 3;
          state_sale{i}+sale{i,j};
      end;
   end;
run;
 
proc print data = sale2 (drop = i j);
format saleCA1 -- state_sale_TX dollar10.;
run;


