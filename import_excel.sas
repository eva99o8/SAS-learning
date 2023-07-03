/*Import excel into SAS using import*/

proc import datafile="/home/u61932235/excel_data.xlsx"
out = excel_data DBMS = xlsx replace;
run;

proc import datafile="/home/u61932235/excel_data.xlsx"
out = excel_data1 DBMS = xlsx replace;
getnames= no;
run;

proc import datafile="/home/u61932235/excel_data.xlsx"
out = excel_data2 DBMS = xlsx replace;
sheet=name_class;
run;

proc import datafile="/home/u61932235/excel_data.xlsx"
out = excel_data3 DBMS = xlsx replace;
range="name_class$A1:B6";
run; 