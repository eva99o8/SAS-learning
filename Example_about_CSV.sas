%let CSV_PATH        = C:\Users\Username ;
%let INPUT_FILENAME  = CSV_INPUT  ;
%let OUTPUT_FILENAME = CSV_OUTPUT ;

proc import out = DATASET_FROM_CSV dbms = csv
     datafile = "&CSV_PATH.\&INPUT_FILENAME..csv" replace ;
run ;

proc export data = DATASET_4CSV dbms = csv
        outfile = "&CSV_PATH.\&OUTPUT_FILENAME..csv" ;
run ;
