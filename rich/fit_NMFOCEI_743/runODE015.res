Run Start Date:  29/08/2019 
Run Start Time: 15:22:24.38 
Run Stop Date:   29/08/2019 
Run Stop Time:  15:23:58.07 
  
************************************************************************************************************************ 
********************                            CONTROL STREAM                                      ******************** 
************************************************************************************************************************ 
  
$PROB    INFUSION_1CPT_VCL SINGLE + MULTIPLE DOSE FOCE INTER (120 Ind/6953 Obs) runODE015
$INPUT   ID TIME DV LNDV MDV AMT RATE EVID DOSE VI CLI SSX IIX SD CMT
$DATA    INFUSION_1CPT.csv IGNORE=@ 
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
        ONEHEADER NOPRINT FILE=runODE013.csv   
   
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
 INFUSION_1CPT_VCL SINGLE + MULTIPLE DOSE FOCE INTER (120 Ind/6953 Obs) r
0DATA CHECKOUT RUN:              NO
 DATA SET LOCATED ON UNIT NO.:    2
 THIS UNIT TO BE REWOUND:        NO
 NO. OF DATA RECS IN DATA SET:     7920
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

 TOT. NO. OF OBS RECS:     6953
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
 RAW OUTPUT FILE (FILE): runODE015.ext
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

 
0ITERATION NO.:    0    OBJECTIVE VALUE:   64573.1016496223        NO. OF FUNC. EVALS.:   5
 CUMULATIVE NO. OF FUNC. EVALS.:        5
 NPARAMETR:  1.6000E+00  4.5000E+00  3.0000E-01  1.5000E-01  1.5000E-01
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
 GRADIENT:   1.0899E+04  3.9302E+04  4.5922E+03  6.8754E+01  3.6388E+01
 
0ITERATION NO.:    5    OBJECTIVE VALUE:   63009.3775171320        NO. OF FUNC. EVALS.:  39
 CUMULATIVE NO. OF FUNC. EVALS.:       44
 NPARAMETR:  1.1802E+00  4.2650E+00  2.0106E-01  8.3860E-02  1.1573E-01
 PARAMETER:  7.3761E-02  9.4777E-02 -4.3237E-01 -1.9074E-01 -2.9669E-02
 GRADIENT:   3.6974E+03  5.1620E+04  1.2475E+02 -1.0864E+02  4.3982E+01
 
0ITERATION NO.:   10    OBJECTIVE VALUE:   62973.9199805957        NO. OF FUNC. EVALS.:  61
 CUMULATIVE NO. OF FUNC. EVALS.:      105
 NPARAMETR:  1.5137E+00  4.2177E+00  1.9925E-01  1.2166E-01  9.3285E-02
 PARAMETER:  9.4606E-02  9.3726E-02 -4.4368E-01 -4.6841E-03 -1.3749E-01
 GRADIENT:   1.7406E+04  4.7011E+04 -9.7826E+01  5.2282E+01 -8.3929E+00
 
0ITERATION NO.:   15    OBJECTIVE VALUE:   62945.0594051732        NO. OF FUNC. EVALS.:  60
 CUMULATIVE NO. OF FUNC. EVALS.:      165             RESET HESSIAN, TYPE I
 NPARAMETR:  1.3881E+00  4.2708E+00  2.0068E-01  7.5211E-02  9.4024E-02
 PARAMETER:  8.6758E-02  9.4907E-02 -4.3473E-01 -2.4517E-01 -1.3354E-01
 GRADIENT:   1.3223E+04  5.2282E+04  5.1586E+01 -1.1834E+01  6.3147E-01
 
0ITERATION NO.:   20    OBJECTIVE VALUE:   62944.8431498469        NO. OF FUNC. EVALS.:  74
 CUMULATIVE NO. OF FUNC. EVALS.:      239
 NPARAMETR:  1.3884E+00  4.2711E+00  2.0021E-01  7.8970E-02  9.3803E-02
 PARAMETER:  8.6778E-02  9.4914E-02 -4.3771E-01 -2.2079E-01 -1.3472E-01
 GRADIENT:   4.8295E+00  8.4926E+00  1.2804E-01 -6.3179E-02  4.2617E-02
 
 #TERM:
0MINIMIZATION SUCCESSFUL
 HOWEVER, PROBLEMS OCCURRED WITH THE MINIMIZATION.
 REGARD THE RESULTS OF THE ESTIMATION STEP CAREFULLY, AND ACCEPT THEM ONLY
 AFTER CHECKING THAT THE COVARIANCE STEP PRODUCES REASONABLE OUTPUT.
 NO. OF FUNCTION EVALUATIONS USED:      239
 NO. OF SIG. DIGITS IN FINAL EST.:  3.1

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.
 
 ETABAR:        -1.2791E-04 -7.4849E-04
 SE:             2.5542E-02  2.7724E-02
 N:                     120         120
 
 P VAL.:         9.9600E-01  9.7846E-01
 
 ETASHRINKSD(%)  1.5327E-02  4.2500E-01
 ETASHRINKVR(%)  3.0652E-02  8.4820E-01
 EBVSHRINKSD(%)  4.2016E-01  7.7270E-01
 EBVSHRINKVR(%)  8.3855E-01  1.5394E+00
 EPSSHRINKSD(%)  1.5908E+00
 EPSSHRINKVR(%)  3.1562E+00
 
  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):         6953
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    12778.7592427442     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    62944.8431498469     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       75723.6023925910     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           240
  
 #TERE:
 Elapsed estimation  time in seconds:    69.38
 Elapsed covariance  time in seconds:    14.04
 Elapsed postprocess time in seconds:     0.60
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************    62944.843       **************************************************
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
+        7.90E-02
 
 ETA2
+        0.00E+00  9.38E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        1.00E+00
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2     
 
 ETA1
+        2.81E-01
 
 ETA2
+        0.00E+00  3.06E-01
 


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
 
         2.57E-02  2.82E-02  1.68E-03
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2     
 
 ETA1
+        9.50E-03
 
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
+        1.69E-02
 
 ETA2
+       .........  1.89E-02
 


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
+        6.63E-04
 
 TH 2
+        7.01E-05  7.95E-04
 
 TH 3
+       -2.08E-06 -6.50E-07  2.84E-06
 
 OM11
+       -4.96E-05  7.63E-07 -1.50E-06  9.02E-05
 
 OM12
+       ......... ......... ......... ......... .........
 
 OM22
+       -4.89E-06  5.24E-05 -8.55E-07 -2.72E-06 .........  1.34E-04
 
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
+        2.57E-02
 
 TH 2
+        9.66E-02  2.82E-02
 
 TH 3
+       -4.79E-02 -1.37E-02  1.68E-03
 
 OM11
+       -2.03E-01  2.85E-03 -9.35E-02  9.50E-03
 
 OM12
+       ......... ......... ......... ......... .........
 
 OM22
+       -1.64E-02  1.61E-01 -4.39E-02 -2.48E-02 .........  1.16E-02
 
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
+        1.60E+03
 
 TH 2
+       -1.50E+02  1.31E+03
 
 TH 3
+        1.66E+03 -2.52E+01  3.58E+05
 
 OM11
+        9.14E+02 -1.10E+02  6.93E+03  1.17E+04
 
 OM12
+       ......... ......... ......... ......... .........
 
 OM22
+        1.47E+02 -5.19E+02  2.50E+03  3.59E+02 .........  7.71E+03
 
 SG11
+       ......... ......... ......... ......... ......... ......... .........
 
 Elapsed finaloutput time in seconds:     0.43
 #CPUT: Total CPU Time in Seconds,       85.016
