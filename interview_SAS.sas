
proc import out = db_actual dbms = csv
     datafile = "/home/u61932235/q4_data_actual.csv" replace ;
run;
proc import out = ensemb1 dbms = csv
     datafile = "/home/u61932235/q4_data_ensembles1.csv" replace ;
run;
proc import out = ensemb2 dbms = csv
     datafile = "/home/u61932235/q4_data_ensembles2.csv" replace ;
run;

/*convert Y/N into binary*/
data db_actual1;
set db_actual;
if actual = "Y" then actual = "1";
 else actual = "-1"; 
run;

/*take just mod_1 and mod_2*/
data ensemb1_1;
set ensemb1;
if model_id in ('mod_1');
run;
data ensemb2_1;
set ensemb2;
if model_id in ('mod_1');
run;


/*sort*/
proc sort data = db_actual1;
by policy_id;
run;
proc sort data = ensemb1_1;
by policy_id;
run;
proc sort data = ensemb2_1;
by policy_id;
run;


/*inner join db*/
proc sql;
create table join_1 as
select * from db_actual1 as x join ensemb1_1 as y
on x.policy_id = y.policy_id;
quit;


/*get the mean prob for each policy_id*/
proc sql;
select policy_id, actual, mean(prob) as final_1
from join_1
group by policy_id;
quit;







