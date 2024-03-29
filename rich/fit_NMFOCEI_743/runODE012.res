Run Start Date:  29/08/2019 
Run Start Time: 15:20:33.10 
Run Stop Date:   29/08/2019 
Run Stop Time:  15:21:09.08 
  
************************************************************************************************************************ 
********************                            CONTROL STREAM                                      ******************** 
************************************************************************************************************************ 
  
$PROB    INFUSION_1CPT_VCL SINGLE DOSE FOCE INTER (120 Ind/2276 Obs) runODE012
$INPUT   ID TIME DV LNDV MDV AMT RATE EVID DOSE VI CLI SSX IIX SD CMT
$DATA    INFUSION_1CPT.csv IGNORE=@ IGNORE (SD.EQ.0)
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
        ONEHEADER NOPRINT FILE=runODE012.csv   
   
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
 INFUSION_1CPT_VCL SINGLE DOSE FOCE INTER (120 Ind/2276 Obs) runODE012
0DATA CHECKOUT RUN:              NO
 DATA SET LOCATED ON UNIT NO.:    2
 THIS UNIT TO BE REWOUND:        NO
 NO. OF DATA RECS IN DATA SET:     2400
 NO. OF DATA ITEMS IN DATA SET:  15
 ID DATA ITEM IS DATA ITEM NO.:   1
 DEP VARIABLE IS DATA ITEM NO.:   3
 MDV DATA ITEM IS DATA ITEM NO.:  5
0INDICES PASSED TO SUBROUTINE PRED:
   8   2   6   7   0   0  15   0   0   0   0
0LABELS FOR DATA ITEMS:
 ID TIME DV LNDV MDV AMT RATE EVID DOSE VI CLI SSX IIX SD CMT
0(NONBLANK) LABELS FOR PRED-DEFINED ITEMS:
 CL V IPRED IRES IWRES
0FORMAT FOR DATA:
 (E4.0,3E7.0,E2.0,2E7.0,E2.0,E7.0,E6.0,E5.0,2E3.0,2E2.0)

 TOT. NO. OF OBS RECS:     2276
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
   EVENT ID DATA ITEM IS DATA ITEM NO.:      8
   TIME DATA ITEM IS DATA ITEM NO.:          2
   DOSE AMOUNT DATA ITEM IS DATA ITEM NO.:   6
   DOSE RATE DATA ITEM IS DATA ITEM NO.:     7
   COMPT. NO. DATA ITEM IS DATA ITEM NO.:   15

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
 RAW OUTPUT FILE (FILE): runODE012.ext
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

 
0ITERATION NO.:    0    OBJECTIVE VALUE:   20102.5197676494        NO. OF FUNC. EVALS.:   5
 CUMULATIVE NO. OF FUNC. EVALS.:        5
 NPARAMETR:  1.6000E+00  4.5000E+00  3.0000E-01  1.5000E-01  1.5000E-01
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
 GRADIENT:   6.2249E+03  2.4284E+04  1.3681E+03  7.3395E+01  3.5282E+01
 
0ITERATION NO.:    5    OBJECTIVE VALUE:   19578.0875229276        NO. OF FUNC. EVALS.:  39
 CUMULATIVE NO. OF FUNC. EVALS.:       44
 NPARAMETR:  1.2788E+00  4.2595E+00  1.9392E-01  9.7953E-02  1.2059E-01
 PARAMETER:  7.9922E-02  9.4656E-02 -4.7744E-01 -1.1307E-01 -9.1224E-03
 GRADIENT:   4.5270E+02  2.3915E+04 -1.9120E+02  1.7939E+01  4.5590E+01
 
0ITERATION NO.:   10    OBJECTIVE VALUE:   19570.9220953210        NO. OF FUNC. EVALS.:  44
 CUMULATIVE NO. OF FUNC. EVALS.:       88
 NPARAMETR:  1.2871E+00  4.2816E+00  1.9697E-01  9.6993E-02  1.0428E-01
 PARAMETER:  8.0446E-02  9.5146E-02 -4.5806E-01 -1.1800E-01 -8.1766E-02
 GRADIENT:  -3.6844E+02 -3.8628E+04 -9.4737E+01  1.9512E+01  1.6669E+01
 
0ITERATION NO.:   15    OBJECTIVE VALUE:   19559.1666688012        NO. OF FUNC. EVALS.:  58
 CUMULATIVE NO. OF FUNC. EVALS.:      146
 NPARAMETR:  1.4338E+00  4.2206E+00  2.0179E-01  8.3738E-02  9.6562E-02
 PARAMETER:  8.9612E-02  9.3792E-02 -4.2782E-01 -1.9147E-01 -1.2022E-01
 GRADIENT:   6.2815E+03  1.7450E+04  4.2464E+01  1.2893E+01 -4.4271E+00
 
0ITERATION NO.:   20    OBJECTIVE VALUE:   19553.9487662248        NO. OF FUNC. EVALS.:  56
 CUMULATIVE NO. OF FUNC. EVALS.:      202
 NPARAMETR:  1.4087E+00  4.2774E+00  2.0113E-01  8.2810E-02  9.5441E-02
 PARAMETER:  8.8045E-02  9.5053E-02 -4.3197E-01 -1.9704E-01 -1.2606E-01
 GRADIENT:   4.2476E+03 -3.7911E+04  1.7359E+01  1.4054E+01 -1.3168E+00
 
0ITERATION NO.:   23    OBJECTIVE VALUE:   19553.3453941774        NO. OF FUNC. EVALS.:  45
 CUMULATIVE NO. OF FUNC. EVALS.:      247
 NPARAMETR:  1.3864E+00  4.2709E+00  2.0032E-01  7.7548E-02  9.6000E-02
 PARAMETER:  8.6650E-02  9.4909E-02 -4.3700E-01 -2.2987E-01 -1.2314E-01
 GRADIENT:  -3.2631E+02  9.1805E+01 -2.5892E+00  5.5941E-02 -2.0943E-03
 
 #TERM:
0MINIMIZATION SUCCESSFUL
 HOWEVER, PROBLEMS OCCURRED WITH THE MINIMIZATION.
 REGARD THE RESULTS OF THE ESTIMATION STEP CAREFULLY, AND ACCEPT THEM ONLY
 AFTER CHECKING THAT THE COVARIANCE STEP PRODUCES REASONABLE OUTPUT.
 NO. OF FUNCTION EVALUATIONS USED:      247
 NO. OF SIG. DIGITS IN FINAL EST.:  2.4

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.
 
 ETABAR:         7.0284E-03 -2.1318E-03
 SE:             2.5014E-02  2.7811E-02
 N:                     120         120
 
 P VAL.:         7.7873E-01  9.3890E-01
 
 ETASHRINKSD(%)  1.1889E+00  1.2622E+00
 ETASHRINKVR(%)  2.3637E+00  2.5084E+00
 EBVSHRINKSD(%)  1.3951E+00  1.5580E+00
 EBVSHRINKVR(%)  2.7707E+00  3.0917E+00
 EPSSHRINKSD(%)  4.8037E+00
 EPSSHRINKVR(%)  9.3767E+00
 
  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):         2276
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    4183.00820314767     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    19553.3453941774     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       23736.3535973250     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           240
  
 #TERE:
 Elapsed estimation  time in seconds:    21.84
 Elapsed covariance  time in seconds:     4.54
 Elapsed postprocess time in seconds:     0.17
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************    19553.345       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3     
 
         1.39E+00  4.27E+00  2.00E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2     
 
 ETA1
+        7.75E-02
 
 ETA2
+        0.00E+00  9.60E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        1.00E+00
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2     
 
 ETA1
+        2.78E-01
 
 ETA2
+        0.00E+00  3.10E-01
 


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
 
         2.59E-02  2.87E-02  3.33E-03
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2     
 
 ETA1
+        9.67E-03
 
 ETA2
+       .........  1.16E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+       .........
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2     
 
 ETA1
+        1.74E-02
 
 ETA2
+       .........  1.87E-02
 


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
+        6.72E-04
 
 TH 2
+        9.70E-05  8.26E-04
 
 TH 3
+       -8.19E-06 -3.80E-06  1.11E-05
 
 OM11
+       -7.14E-05 -1.48E-05  2.53E-06  9.34E-05
 
 OM12
+       ......... ......... ......... ......... .........
 
 OM22
+       -1.12E-05  3.78E-05  2.71E-08 -2.70E-06 .........  1.35E-04
 
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
+        2.59E-02
 
 TH 2
+        1.30E-01  2.87E-02
 
 TH 3
+       -9.48E-02 -3.96E-02  3.33E-03
 
 OM11
+       -2.85E-01 -5.34E-02  7.86E-02  9.67E-03
 
 OM12
+       ......... ......... ......... ......... .........
 
 OM22
+       -3.73E-02  1.13E-01  7.00E-04 -2.40E-02 .........  1.16E-02
 
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
+        1.66E+03
 
 TH 2
+       -1.78E+02  1.25E+03
 
 TH 3
+        8.82E+02  2.87E+02  9.11E+04
 
 OM11
+        1.22E+03  4.37E+01 -1.75E+03  1.17E+04
 
 OM12
+       ......... ......... ......... ......... .........
 
 OM22
+        2.12E+02 -3.65E+02 -6.04E+01  3.24E+02 .........  7.56E+03
 
 SG11
+       ......... ......... ......... ......... ......... ......... .........
 
 Elapsed finaloutput time in seconds:     0.15
 #CPUT: Total CPU Time in Seconds,       26.953
