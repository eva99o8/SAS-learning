/*2000 deposit to earn 50000*/

data invest;
do until (capital>=50000);
capital+2000;
capital + capital*0.10;
year+1;
end;
run;


data invest;
do until (capital>=50000);
capital+2000;
capital + capital*0.10;
year+1;
end;
run;
/*will not run since capital is not >= 50000
before the 1st iteration*/

/*combine with usual do loop*/
data invest;
do year = 1 to 10 until (capital>=50000);
capital+2000;
capital + capital*0.10;
year+1;
end;
if year=11  then year =10;
run; 




