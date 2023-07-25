%macro process_data(input_csv_actual, input_csv_ensembles1);

/*Import actual data*/
proc import out=db_actual dbms=csv
datafile="&input_csv_actual" replace;
run;
/*Import ensembels1 data*/
proc import out=ensemb1 dbms=csv
datafile="&input_csv_ensembles1" replace;
  run;


/*Convert Y/N into binary*/
data db_actual1;
set db_actual;
if actual = "Y" then actual = "1";
else actual = "-1";
run;

/*Sort datasets*/
proc sort data=db_actual1;
by policy_id;
run;
  
proc sort data=ensemb1;
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


/*Get the mean prob for each policy_id in ensemb1*/
data bypolicy_1(drop=model_id);
set ensemb1;
by policy_id;
retain sum_by_policy;
if first.policy_id then sum_by_policy = 0;
sum_by_policy + prob;
if last.policy_id then output;
run;

data bypolicy_11(drop=prob sum_by_policy);
set bypolicy_1;
mean_prob_by_policy = sum_by_policy/10;/*since we have 10 models for 49000 policies*/
/*could have a better solution using sql or proc means 
but any approach except this failed to execute in SAS studio*/
run;

/*inner join databases*/
proc sql;
create table final_1 as
select * from db_actual1 as x join bypolicy_11 as y
on x.policy_id = y.policy_id;
quit;

proc print data=final_1;
run;

%mend;


%process_data("/home/u61932235/q4_data_actual.csv",
              "/home/u61932235/q4_data_ensembles1.csv");