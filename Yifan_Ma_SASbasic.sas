/*Import data*/
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

/*Sort datasets*/
proc sort data = db_actual1;
by policy_id;
run;
proc sort data = ensemb1;
by policy_id;
run;
proc sort data = ensemb2;
by policy_id;
run;


/*Get the value counts for 10 models*/
/*There are 49000 outcomes for each model*/
proc sql;
	create table value_count as
    select model_id, count(*) as model_id_count
    from ensemb1
    group by model_id;
quit;
proc print data = value_count;
run;


/*Get the mean prob for each policy_id*/
data bypolicy_1(drop=model_id);
   set ensemb1;
   by policy_id;
   retain sum_by_policy;
   if first.policy_id then sum_by_policy = 0;
   sum_by_policy+prob;
   if last.policy_id then output;
run;

data bypolicy_11(drop=prob sum_by_policy);
set bypolicy_1;
mean_prob_by_policy = sum_by_policy/10;
run;


/*inner join databases*/
proc sql;
create table final_1 as
select * from db_actual1 as x join bypolicy_11 as y
on x.policy_id = y.policy_id;
quit;

proc print data=final_1;
run;






