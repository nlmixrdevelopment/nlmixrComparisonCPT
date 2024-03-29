Run Start Date:  29/08/2019 
Run Start Time: 15:12:01.99 
Run Stop Date:   29/08/2019 
Run Stop Time:  15:13:19.65 
  
************************************************************************************************************************ 
********************                            CONTROL STREAM                                      ******************** 
************************************************************************************************************************ 
  
$PROB    BOLUS_1CPT_VCL SINGLE + MULTIPLE DOSE FOCE INTER (120 Ind/6951 Obs) runODE004
$INPUT   ID TIME DV LNDV MDV AMT EVID DOSE VI CLI SSX IIX SD CMT
$DATA    BOLUS_1CPT.csv IGNORE=@ 
$SUBR    ADVAN13 TOL=6
$MODEL   COMP(CENTRAL,DEFOBS)
$PK
         CL=EXP(THETA(1)+ETA(1))
         V=EXP(THETA(2)+ETA(2))
         S1=V
$DES
         DADT(1)=-CL*(A(1)/V)
$ERROR   
         IPRED = F     
         RESCV = THETA(3) 
         W     = IPRED*RESCV
         IRES  = DV-IPRED
         IWRES = IRES/W
         Y     = IPRED+W*EPS(1)
$THETA   1.6       ;log Cl
$THETA   4.5       ;log Vc
$THETA   (0,0.3,1) ;RSV
$OMEGA   0.15 0.15
$SIGMA   1 FIX
$EST     NSIG=2 SIGL=6 PRINT=5 MAX=9999 NOABORT POSTHOC METHOD=COND INTER NOOBT
$COV
$TABLE  ID TIME LNDV MDV AMT EVID DOSE VI CLI CL V ETA1 ETA2
        IPRED IRES IWRES CWRESI
        ONEHEADER NOPRINT FILE=runODE004.csv   
   
************************************************************************************************************************ 
********************                            SYSTEM INFORMATION                                  ******************** 
************************************************************************************************************************ 
   
Operating system: 

Microsoft Windows [Version 10.0.18362.295]
   
Compiler: Intel(R) Parallel Studio XE 2015 Update 3 Composer Edition (package 208)  
   
Compiler settings: /Gs /nologo /nbs /w /fp:strict   
   
************************************************************************************************************************ 
********************                            NMTRAN MESSAGES                                     ******************** 
************************************************************************************************************************ 
   
  
 WARNINGS AND ERRORS (IF ANY) FOR PROBLEM    1
             
 (WARNING  2) NM-TRAN INFERS THAT THE DATA ARE POPULATION.
   
************************************************************************************************************************ 
********************                            NONMEM EXECUTION                                    ******************** 
************************************************************************************************************************ 
   
License Registered to: Occams Cooperatie U.A
Expiration Date:    14 JUN 2020
Current Date:       29 AUG 2019
Days until program expires : 290
1NONLINEAR MIXED EFFECTS MODEL PROGRAM (NONMEM) VERSION 7.4.3
 ORIGINALLY DEVELOPED BY STUART BEAL, LEWIS SHEINER, AND ALISON BOECKMANN
 CURRENT DEVELOPERS ARE ROBERT BAUER, ICON DEVELOPMENT SOLUTIONS,
 AND ALISON BOECKMANN. IMPLEMENTATION, EFFICIENCY, AND STANDARDIZATION
 PERFORMED BY NOUS INFOSYSTEMS.

 PROBLEM NO.:         1
 BOLUS_1CPT_VCL SINGLE + MULTIPLE DOSE FOCE INTER (120 Ind/6951 Obs) runO
0DATA CHECKOUT RUN:              NO
 DATA SET LOCATED ON UNIT NO.:    2
 THIS UNIT TO BE REWOUND:        NO
 NO. OF DATA RECS IN DATA SET:     7920
 NO. OF DATA ITEMS IN DATA SET:  14
 ID DATA ITEM IS DATA ITEM NO.:   1
 DEP VARIABLE IS DATA ITEM NO.:   3
 MDV DATA ITEM IS DATA ITEM NO.:  5
0INDICES PASSED TO SUBROUTINE PRED:
   7   2   6   0   0   0  14   0   0   0   0
0LABELS FOR DATA ITEMS:
 ID TIME DV LNDV MDV AMT EVID DOSE VI CLI SSX IIX SD CMT
0(NONBLANK) LABELS FOR PRED-DEFINED ITEMS:
 CL V IPRED IRES IWRES
0FORMAT FOR DATA:
 (E4.0,3E7.0,E2.0,E7.0,E2.0,E7.0,E6.0,E5.0,2E3.0,2E2.0)

 TOT. NO. OF OBS RECS:     6951
 TOT. NO. OF INDIVIDUALS:      120
0LENGTH OF THETA:   3
0DEFAULT THETA BOUNDARY TEST OMITTED:    NO
0OMEGA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   2
0DEFAULT OMEGA BOUNDARY TEST OMITTED:   YES
0SIGMA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   1
0DEFAULT SIGMA BOUNDARY TEST OMITTED:    NO
0INITIAL ESTIMATE OF THETA:
 LOWER BOUND    INITIAL EST    UPPER BOUND
 -0.1000E+07     0.1600E+01     0.1000E+07
 -0.1000E+07     0.4500E+01     0.1000E+07
  0.0000E+00     0.3000E+00     0.1000E+01
0INITIAL ESTIMATE OF OMEGA:
 0.1500E+00
 0.0000E+00   0.1500E+00
0INITIAL ESTIMATE OF SIGMA:
 0.1000E+01
0SIGMA CONSTRAINED TO BE THIS INITIAL ESTIMATE
0COVARIANCE STEP OMITTED:        NO
 EIGENVLS. PRINTED:              NO
 SPECIAL COMPUTATION:            NO
 COMPRESSED FORMAT:              NO
 GRADIENT METHOD USED:     NOSLOW
 SIGDIGITS ETAHAT (SIGLO):                  -1
 SIGDIGITS GRADIENTS (SIGL):                -1
 EXCLUDE COV FOR FOCE (NOFCOV):              NO
 TURN OFF Cholesky Transposition of R Matrix (CHOLROFF): NO
 KNUTHSUMOFF:                                -1
 RESUME COV ANALYSIS (RESUME):               NO
 SIR SAMPLE SIZE (SIRSAMPLE):              -1
 NON-LINEARLY TRANSFORM THETAS DURING COV (THBND): 1
 PRECONDTIONING CYCLES (PRECOND):        0
 PRECONDTIONING TYPES (PRECONDS):        TOS
 FORCED PRECONDTIONING CYCLES (PFCOND):0
 PRECONDTIONING TYPE (PRETYPE):        0
 FORCED POS. DEFINITE SETTING: (FPOSDEF):0
0TABLES STEP OMITTED:    NO
 NO. OF TABLES:           1
 SEED NUMBER (SEED):    11456
 RANMETHOD:             3U
 MC SAMPLES (ESAMPLE):    300
 WRES SQUARE ROOT TYPE (WRESCHOL): EIGENVALUE
0-- TABLE   1 --
0RECORDS ONLY:    ALL
04 COLUMNS APPENDED:    YES
 PRINTED:                NO
 HEADERS:               ONE
 FILE TO BE FORWARDED:   NO
 FORMAT:                S1PE11.4
 LFORMAT:
 RFORMAT:
 FIXED_EFFECT_ETAS:
0USER-CHOSEN ITEMS:
 ID TIME LNDV MDV AMT EVID DOSE VI CLI CL V ETA1 ETA2 IPRED IRES IWRES CWRESI
1DOUBLE PRECISION PREDPP VERSION 7.4.3

 GENERAL NONLINEAR KINETICS MODEL WITH STIFF/NONSTIFF EQUATIONS (LSODA, ADVAN13)
0MODEL SUBROUTINE USER-SUPPLIED - ID NO. 9999
0MAXIMUM NO. OF BASIC PK PARAMETERS:   2
0COMPARTMENT ATTRIBUTES
 COMPT. NO.   FUNCTION   INITIAL    ON/OFF      DOSE      DEFAULT    DEFAULT
                         STATUS     ALLOWED    ALLOWED    FOR DOSE   FOR OBS.
    1         CENTRAL      ON         YES        YES        YES        YES
    2         OUTPUT       OFF        YES        NO         NO         NO
 INITIAL (BASE) TOLERANCE SETTINGS:
 NRD (RELATIVE) VALUE(S) OF TOLERANCE:   6
 ANRD (ABSOLUTE) VALUE(S) OF TOLERANCE:  12
1
 ADDITIONAL PK PARAMETERS - ASSIGNMENT OF ROWS IN GG
 COMPT. NO.                             INDICES
              SCALE      BIOAVAIL.   ZERO-ORDER  ZERO-ORDER  ABSORB
                         FRACTION    RATE        DURATION    LAG
    1            3           *           *           *           *
    2            *           -           -           -           -
             - PARAMETER IS NOT ALLOWED FOR THIS MODEL
             * PARAMETER IS NOT SUPPLIED BY PK SUBROUTINE;
               WILL DEFAULT TO ONE IF APPLICABLE
0DATA ITEM INDICES USED BY PRED ARE:
   EVENT ID DATA ITEM IS DATA ITEM NO.:      7
   TIME DATA ITEM IS DATA ITEM NO.:          2
   DOSE AMOUNT DATA ITEM IS DATA ITEM NO.:   6
   COMPT. NO. DATA ITEM IS DATA ITEM NO.:   14

0PK SUBROUTINE CALLED WITH EVERY EVENT RECORD.
 PK SUBROUTINE NOT CALLED AT NONEVENT (ADDITIONAL OR LAGGED) DOSE TIMES.
0ERROR SUBROUTINE CALLED WITH EVERY EVENT RECORD.
0DES SUBROUTINE USES COMPACT STORAGE MODE.
1
 
 
 #TBLN:      1
 #METH: First Order Conditional Estimation with Interaction
 
 ESTIMATION STEP OMITTED:                 NO
 ANALYSIS TYPE:                           POPULATION
 NUMBER OF SADDLE POINT RESET ITERATIONS:      0
 GRADIENT METHOD USED:               NOSLOW
 CONDITIONAL ESTIMATES USED:              YES
 CENTERED ETA:                            NO
 EPS-ETA INTERACTION:                     YES
 LAPLACIAN OBJ. FUNC.:                    NO
 NO. OF FUNCT. EVALS. ALLOWED:            9999
 NO. OF SIG. FIGURES REQUIRED:            2
 INTERMEDIATE PRINTOUT:                   YES
 ESTIMATE OUTPUT TO MSF:                  NO
 ABORT WITH PRED EXIT CODE 1:             NO
 IND. OBJ. FUNC. VALUES SORTED:           NO
 NUMERICAL DERIVATIVE
       FILE REQUEST (NUMDER):               NONE
 MAP (ETAHAT) ESTIMATION METHOD (OPTMAP):   0
 ETA HESSIAN EVALUATION METHOD (ETADER):    0
 INITIAL ETA FOR MAP ESTIMATION (MCETA):    0
 SIGDIGITS FOR MAP ESTIMATION (SIGLO):      6
 GRADIENT SIGDIGITS OF
       FIXED EFFECTS PARAMETERS (SIGL):     6
 NOPRIOR SETTING (NOPRIOR):                 OFF
 NOCOV SETTING (NOCOV):                     OFF
 DERCONT SETTING (DERCONT):                 OFF
 FINAL ETA RE-EVALUATION (FNLETA):          ON
 EXCLUDE NON-INFLUENTIAL (NON-INFL.) ETAS
       IN SHRINKAGE (ETASTYPE):             NO
 NON-INFL. ETA CORRECTION (NONINFETA):      OFF
 RAW OUTPUT FILE (FILE): runODE004.ext
 EXCLUDE TITLE (NOTITLE):                   NO
 EXCLUDE COLUMN LABELS (NOLABEL):           NO
 FORMAT FOR ADDITIONAL FILES (FORMAT):      S1PE12.5
 PARAMETER ORDER FOR OUTPUTS (ORDER):       TSOL
 WISHART PRIOR DF INTERPRETATION (WISHTYPE):0
 KNUTHSUMOFF:                               0
 INCLUDE LNTWOPI:                           NO
 INCLUDE CONSTANT TERM TO PRIOR (PRIORC):   NO
 INCLUDE CONSTANT TERM TO OMEGA (ETA) (OLNTWOPI):NO
 ADDITIONAL CONVERGENCE TEST (CTYPE=4)?:    NO
 EM OR BAYESIAN METHOD USED:                 NONE

 TOLERANCES FOR ESTIMATION/EVALUATION STEP:
 NRD (RELATIVE) VALUE(S) OF TOLERANCE:   6
 ANRD (ABSOLUTE) VALUE(S) OF TOLERANCE:  12
 TOLERANCES FOR COVARIANCE STEP:
 NRD (RELATIVE) VALUE(S) OF TOLERANCE:   6
 ANRD (ABSOLUTE) VALUE(S) OF TOLERANCE:  12
 TOLERANCES FOR TABLE/SCATTER STEP:
 NRD (RELATIVE) VALUE(S) OF TOLERANCE:   6
 ANRD (ABSOLUTE) VALUE(S) OF TOLERANCE:  12
 
 THE FOLLOWING LABELS ARE EQUIVALENT
 PRED=PREDI
 RES=RESI
 WRES=WRESI
 IWRS=IWRESI
 IPRD=IPREDI
 IRS=IRESI
 
 MONITORING OF SEARCH:

 
0ITERATION NO.:    0    OBJECTIVE VALUE:   65857.4839697763        NO. OF FUNC. EVALS.:   5
 CUMULATIVE NO. OF FUNC. EVALS.:        5
 NPARAMETR:  1.6000E+00  4.5000E+00  3.0000E-01  1.5000E-01  1.5000E-01
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
 GRADIENT:   1.2093E+04  4.7280E+04  4.4761E+03  6.3645E+01 -1.3240E+01
 
0ITERATION NO.:    5    OBJECTIVE VALUE:   64342.8702255871        NO. OF FUNC. EVALS.:  39
 CUMULATIVE NO. OF FUNC. EVALS.:       44
 NPARAMETR:  1.1713E+00  4.1890E+00  1.9932E-01  8.5334E-02  1.4139E-01
 PARAMETER:  7.3208E-02  9.3090E-02 -4.4323E-01 -1.8203E-01  7.0447E-02
 GRADIENT:   6.0024E+03  5.8441E+04 -3.0517E+02 -6.5099E+01  7.5425E+01
 
0ITERATION NO.:   10    OBJECTIVE VALUE:   64306.7728925517        NO. OF FUNC. EVALS.:  62
 CUMULATIVE NO. OF FUNC. EVALS.:      106
 NPARAMETR:  1.4742E+00  4.1556E+00  2.0449E-01  1.1392E-01  9.5843E-02
 PARAMETER:  9.2140E-02  9.2346E-02 -4.1114E-01 -3.7552E-02 -1.2396E-01
 GRADIENT:   1.7614E+04  5.1408E+04  1.6849E+02  5.9794E+01 -5.2446E+00
 
0ITERATION NO.:   15    OBJECTIVE VALUE:   64279.9084663102        NO. OF FUNC. EVALS.:  66
 CUMULATIVE NO. OF FUNC. EVALS.:      172
 NPARAMETR:  1.3629E+00  4.2030E+00  2.0232E-01  6.9159E-02  9.6183E-02
 PARAMETER:  8.5181E-02  9.3400E-02 -4.2458E-01 -2.8711E-01 -1.2219E-01
 GRADIENT:   1.0278E+04 -1.1412E+05 -3.9314E+01 -1.2348E+01  1.2230E+00
 
0ITERATION NO.:   18    OBJECTIVE VALUE:   64279.7029010699        NO. OF FUNC. EVALS.:  46
 CUMULATIVE NO. OF FUNC. EVALS.:      218
 NPARAMETR:  1.3623E+00  4.2025E+00  2.0277E-01  7.2706E-02  9.5676E-02
 PARAMETER:  8.5142E-02  9.3389E-02 -4.2177E-01 -2.6210E-01 -1.2483E-01
 GRADIENT:  -8.8973E+00 -1.9520E+01  5.6500E+00 -2.5264E-01 -1.8232E-02
 
 #TERM:
0MINIMIZATION SUCCESSFUL
 HOWEVER, PROBLEMS OCCURRED WITH THE MINIMIZATION.
 REGARD THE RESULTS OF THE ESTIMATION STEP CAREFULLY, AND ACCEPT THEM ONLY
 AFTER CHECKING THAT THE COVARIANCE STEP PRODUCES REASONABLE OUTPUT.
 NO. OF FUNCTION EVALUATIONS USED:      218
 NO. OF SIG. DIGITS IN FINAL EST.:  2.6

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.
 
 ETABAR:         1.3320E-04 -4.7806E-04
 SE:             2.4507E-02  2.8009E-02
 N:                     120         120
 
 P VAL.:         9.9566E-01  9.8638E-01
 
 ETASHRINKSD(%)  2.1301E-02  3.8819E-01
 ETASHRINKVR(%)  4.2598E-02  7.7488E-01
 EBVSHRINKSD(%)  4.6718E-01  7.4816E-01
 EBVSHRINKVR(%)  9.3217E-01  1.4907E+00
 EPSSHRINKSD(%)  1.6131E+00
 EPSSHRINKVR(%)  3.2002E+00
 
  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):         6951
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    12775.0834886114     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    64279.7029010699     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       77054.7863896812     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           240
  
 #TERE:
 Elapsed estimation  time in seconds:    55.25
 Elapsed covariance  time in seconds:    12.13
 Elapsed postprocess time in seconds:     0.52
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************    64279.703       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3     
 
         1.36E+00  4.20E+00  2.03E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2     
 
 ETA1
+        7.27E-02
 
 ETA2
+        0.00E+00  9.57E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        1.00E+00
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2     
 
 ETA1
+        2.70E-01
 
 ETA2
+        0.00E+00  3.09E-01
 


 SIGMA - CORR MATRIX FOR RANDOM EFFECTS - EPSILONS  ***


         EPS1     
 
 EPS1
+        1.00E+00
 
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                            STANDARD ERROR OF ESTIMATE                          ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3     
 
         2.48E-02  2.85E-02  1.82E-03
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2     
 
 ETA1
+        9.31E-03
 
 ETA2
+       .........  1.22E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+       .........
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2     
 
 ETA1
+        1.73E-02
 
 ETA2
+       .........  1.98E-02
 


 SIGMA - CORR MATRIX FOR RANDOM EFFECTS - EPSILONS  ***


         EPS1     
 
 EPS1
+       .........
 
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                          COVARIANCE MATRIX OF ESTIMATE                         ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 

            TH 1      TH 2      TH 3      OM11      OM12      OM22      SG11  
 
 TH 1
+        6.15E-04
 
 TH 2
+        8.01E-05  8.14E-04
 
 TH 3
+        2.96E-06  4.58E-06  3.31E-06
 
 OM11
+       -2.07E-07  1.43E-06  6.09E-07  8.67E-05
 
 OM12
+       ......... ......... ......... ......... .........
 
 OM22
+       -2.70E-05  1.04E-05  1.85E-06 -2.84E-06 .........  1.50E-04
 
 SG11
+       ......... ......... ......... ......... ......... ......... .........
 
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                          CORRELATION MATRIX OF ESTIMATE                        ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 

            TH 1      TH 2      TH 3      OM11      OM12      OM22      SG11  
 
 TH 1
+        2.48E-02
 
 TH 2
+        1.13E-01  2.85E-02
 
 TH 3
+        6.56E-02  8.82E-02  1.82E-03
 
 OM11
+       -8.95E-04  5.37E-03  3.59E-02  9.31E-03
 
 OM12
+       ......... ......... ......... ......... .........
 
 OM22
+       -8.88E-02  2.96E-02  8.30E-02 -2.49E-02 .........  1.22E-02
 
 SG11
+       ......... ......... ......... ......... ......... ......... .........
 
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                      INVERSE COVARIANCE MATRIX OF ESTIMATE                     ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 

            TH 1      TH 2      TH 3      OM11      OM12      OM22      SG11  
 
 TH 1
+        1.67E+03
 
 TH 2
+       -1.60E+02  1.25E+03
 
 TH 3
+       -1.46E+03 -1.53E+03  3.08E+05
 
 OM11
+        2.76E+01 -1.34E+01 -2.27E+03  1.16E+04
 
 OM12
+       ......... ......... ......... ......... .........
 
 OM22
+        3.29E+02 -9.67E+01 -4.00E+03  2.53E+02 .........  6.78E+03
 
 SG11
+       ......... ......... ......... ......... ......... ......... .........
 
 Elapsed finaloutput time in seconds:     0.43
 #CPUT: Total CPU Time in Seconds,       68.828
