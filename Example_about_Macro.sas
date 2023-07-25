%let NUM_OBS_IN_DATASET_1 = 123 ;

%CALCULATE( DATA = DATASET_1,  VARIABLE = VAR_A, OUT = OUTPUT_A_1_OBS_1_VAR, OUTPUT_VAR = VALUE_A ) ;
%CALCULATE( DATA = DATASET_1,  VARIABLE = VAR_B, OUT = OUTPUT_B_1_OBS_1_VAR, OUTPUT_VAR = VALUE_B ) ;

data DATA_ALL ;
  set OUTPUT_A_1_OBS_1_VAR ;
  set OUTPUT_A_1_OBS_2_VAR ;
  ITERATION = 0 ;
run ;

%macro LOOP( NSAMPLES ) ;

  %do I = 1 %to &NSAMPLES ;

    proc surveyselect data = DATASET_1 method = urs   n = &NUM_OBS_IN_DATASET out = SAMPLE_&I outhits ;
    run ;

    %CALCULATE( DATA = SAMPLE_&I,  VARIABLE = VAR_A, OUT = OUTPUT&I._A_1_OBS_1_VAR, OUTPUT_VAR = VALUE_A ) ;
    %CALCULATE( DATA = SAMPLE_&I,  VARIABLE = VAR_B, OUT = OUTPUT&I._B_1_OBS_1_VAR, OUTPUT_VAR = VALUE_B ) ;

    data BOOTSTRAP_&I ;
      set OUTPUT&I._A_ONE_OBS ;
      set OUTPUT&I._B_ONE_OBS ;
      ITERATION = &I ;
    run ;

    data DATA_ALL ;
      set DATA_ALL  BOOTSTRAP_&I ;
    run ;

  %end ;

%mend LOOP ;

%LOOP( 50 ) ;

proc print data = DATA_ALL ;
run ;
