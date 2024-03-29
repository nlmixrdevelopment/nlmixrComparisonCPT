Run Start Date:  29/08/2019 
Run Start Time: 19:37:31.07 
Run Stop Date:   29/08/2019 
Run Stop Time:  19:44:26.09 
  
************************************************************************************************************************ 
********************                            CONTROL STREAM                                      ******************** 
************************************************************************************************************************ 
  
$PROB    ORAL1_2CPT_KACLV1QV2 SINGLE DOSE FOCEI (120 Ind/2280 Obs) runODE060
$INPUT   ID TIME DV LNDV MDV AMT EVID DOSE V1I CLI QI V2I KAI SSX IIX SD CMT
$DATA    ORAL_2CPT.csv IGNORE=@ IGNORE (SD.EQ.0)
$SUBR    ADVAN13 TOL=6
$MODEL
         COMP=(ABS,DEFDOSE)
         COMP=(CENTRAL,DEFOBS)
         COMP=(PERI)
$PK
         CL=EXP(THETA(1)+ETA(1))
         V=EXP(THETA(2)+ETA(2))
         Q=EXP(THETA(3)+ETA(3))
         V3=EXP(THETA(4)+ETA(4))
		 KA=EXP(THETA(5)+ETA(5))
         V2=V
         S2=V
		 K32=Q/V3
		 K23=Q/V
$DES
         DADT(1)= -KA*A(1)
         DADT(2)=  KA*A(1)+K32*A(3)-K23*A(2)-CL*A(2)/V2
         DADT(3)=         -K32*A(3)+K23*A(2)  		 
$ERROR   
         IPRED = F     
         RESCV = THETA(6) 
         W     = IPRED*RESCV
         IRES  = DV-IPRED
         IWRES = IRES/W
         Y     = IPRED+W*EPS(1)
$THETA   1.6       ;log Cl
$THETA   4.5       ;log Vc
$THETA   1.6       ;log Q
$THETA   4         ;log Vp
$THETA   0.2       ;log KA
$THETA   (0,0.3,1) ;RSV
$OMEGA   0.15 0.15 0.15 0.15 0.15
$SIGMA   1 FIX
$EST     NSIG=2 SIGL=6 PRINT=5 MAX=9999 NOABORT POSTHOC METHOD=COND INTER NOOBT
$COV
$TABLE  ID TIME LNDV MDV AMT EVID DOSE V1I CLI CL V Q V3 KA ETA1 ETA2 ETA3 ETA4 ETA5
        IPRED IRES IWRES CWRESI
        ONEHEADER NOPRINT FILE=runODE060.csv   
   
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
 ORAL1_2CPT_KACLV1QV2 SINGLE DOSE FOCEI (120 Ind/2280 Obs) runODE060
0DATA CHECKOUT RUN:              NO
 DATA SET LOCATED ON UNIT NO.:    2
 THIS UNIT TO BE REWOUND:        NO
 NO. OF DATA RECS IN DATA SET:     2400
 NO. OF DATA ITEMS IN DATA SET:  17
 ID DATA ITEM IS DATA ITEM NO.:   1
 DEP VARIABLE IS DATA ITEM NO.:   3
 MDV DATA ITEM IS DATA ITEM NO.:  5
0INDICES PASSED TO SUBROUTINE PRED:
   7   2   6   0   0   0  17   0   0   0   0
0LABELS FOR DATA ITEMS:
 ID TIME DV LNDV MDV AMT EVID DOSE V1I CLI QI V2I KAI SSX IIX SD CMT
0(NONBLANK) LABELS FOR PRED-DEFINED ITEMS:
 CL V Q V3 KA IPRED IRES IWRES
0FORMAT FOR DATA:
 (E3.0,3E6.0,E1.0,E6.0,E1.0,E6.0,2E5.0,E4.0,2E5.0,2E2.0,2E1.0)

 TOT. NO. OF OBS RECS:     2280
 TOT. NO. OF INDIVIDUALS:      120
0LENGTH OF THETA:   6
0DEFAULT THETA BOUNDARY TEST OMITTED:    NO
0OMEGA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   5
0DEFAULT OMEGA BOUNDARY TEST OMITTED:   YES
0SIGMA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   1
0DEFAULT SIGMA BOUNDARY TEST OMITTED:    NO
0INITIAL ESTIMATE OF THETA:
 LOWER BOUND    INITIAL EST    UPPER BOUND
 -0.1000E+07     0.1600E+01     0.1000E+07
 -0.1000E+07     0.4500E+01     0.1000E+07
 -0.1000E+07     0.1600E+01     0.1000E+07
 -0.1000E+07     0.4000E+01     0.1000E+07
 -0.1000E+07     0.2000E+00     0.1000E+07
  0.0000E+00     0.3000E+00     0.1000E+01
0INITIAL ESTIMATE OF OMEGA:
 0.1500E+00
 0.0000E+00   0.1500E+00
 0.0000E+00   0.0000E+00   0.1500E+00
 0.0000E+00   0.0000E+00   0.0000E+00   0.1500E+00
 0.0000E+00   0.0000E+00   0.0000E+00   0.0000E+00   0.1500E+00
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
 ID TIME LNDV MDV AMT EVID DOSE V1I CLI CL V Q V3 KA ETA1 ETA2 ETA3 ETA4 ETA5 IPRED IRES IWRES CWRESI
1DOUBLE PRECISION PREDPP VERSION 7.4.3

 GENERAL NONLINEAR KINETICS MODEL WITH STIFF/NONSTIFF EQUATIONS (LSODA, ADVAN13)
0MODEL SUBROUTINE USER-SUPPLIED - ID NO. 9999
0MAXIMUM NO. OF BASIC PK PARAMETERS:   5
0COMPARTMENT ATTRIBUTES
 COMPT. NO.   FUNCTION   INITIAL    ON/OFF      DOSE      DEFAULT    DEFAULT
                         STATUS     ALLOWED    ALLOWED    FOR DOSE   FOR OBS.
    1         ABS          ON         YES        YES        YES        NO
    2         CENTRAL      ON         YES        YES        NO         YES
    3         PERI         ON         YES        YES        NO         NO
    4         OUTPUT       OFF        YES        NO         NO         NO
 INITIAL (BASE) TOLERANCE SETTINGS:
 NRD (RELATIVE) VALUE(S) OF TOLERANCE:   6
 ANRD (ABSOLUTE) VALUE(S) OF TOLERANCE:  12
1
 ADDITIONAL PK PARAMETERS - ASSIGNMENT OF ROWS IN GG
 COMPT. NO.                             INDICES
              SCALE      BIOAVAIL.   ZERO-ORDER  ZERO-ORDER  ABSORB
                         FRACTION    RATE        DURATION    LAG
    1            *           *           *           *           *
    2            6           *           *           *           *
    3            *           *           *           *           *
    4            *           -           -           -           -
             - PARAMETER IS NOT ALLOWED FOR THIS MODEL
             * PARAMETER IS NOT SUPPLIED BY PK SUBROUTINE;
               WILL DEFAULT TO ONE IF APPLICABLE
0DATA ITEM INDICES USED BY PRED ARE:
   EVENT ID DATA ITEM IS DATA ITEM NO.:      7
   TIME DATA ITEM IS DATA ITEM NO.:          2
   DOSE AMOUNT DATA ITEM IS DATA ITEM NO.:   6
   COMPT. NO. DATA ITEM IS DATA ITEM NO.:   17

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
 RAW OUTPUT FILE (FILE): runODE060.ext
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

 
0ITERATION NO.:    0    OBJECTIVE VALUE:   20111.3362806341        NO. OF FUNC. EVALS.:   8
 CUMULATIVE NO. OF FUNC. EVALS.:        8
 NPARAMETR:  1.6000E+00  4.5000E+00  1.6000E+00  4.0000E+00  2.0000E-01  3.0000E-01  1.5000E-01  1.5000E-01  1.5000E-01  1.5000E-01
             1.5000E-01
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
             1.0000E-01
 GRADIENT:   4.9394E+03  1.4432E+04  1.8156E+03  6.6292E+03  4.8212E+02  1.2511E+03  2.9093E+01  7.0808E+01 -1.3385E+00  2.9908E+01
             4.4369E+00
 
0ITERATION NO.:    5    OBJECTIVE VALUE:   20006.4155674603        NO. OF FUNC. EVALS.:  56
 CUMULATIVE NO. OF FUNC. EVALS.:       64
 NPARAMETR:  1.3106E+00  4.3045E+00  1.2576E+00  3.8122E+00  1.8271E-01  2.9529E-01  1.4969E-01  1.4948E-01  1.4997E-01  1.4979E-01
             1.5000E-01
 PARAMETER:  8.1912E-02  9.5655E-02  7.8602E-02  9.5306E-02  9.1354E-02  7.7453E-02  9.8956E-02  9.8248E-02  9.9902E-02  9.9284E-02
             1.0000E-01
 GRADIENT:  -1.8045E+03 -3.9074E+02  2.5885E+02  7.3923E+02  3.9587E+02  1.3485E+03  5.9543E+01  1.0987E+02  1.4446E+01  3.5664E+01
             1.7288E+01
 
0ITERATION NO.:   10    OBJECTIVE VALUE:   19534.2562850787        NO. OF FUNC. EVALS.:  47
 CUMULATIVE NO. OF FUNC. EVALS.:      111
 NPARAMETR:  1.2544E+00  4.2016E+00  1.5189E+00  3.8230E+00 -1.9879E-02  2.0754E-01  1.1868E-01  6.4520E-02  1.5175E-01  6.2844E-02
             8.3793E-02
 PARAMETER:  7.8399E-02  9.3368E-02  9.4931E-02  9.5575E-02 -9.9394E-03 -3.9250E-01 -1.7110E-02 -3.2183E-01  1.0581E-01 -3.3499E-01
            -1.9114E-01
 GRADIENT:  -2.7175E+03  7.0941E+01  5.1181E+02  5.5391E+01  2.7471E+02  2.6411E+02  7.8914E+00 -1.6557E+01 -6.5818E+00 -8.7854E+00
            -4.2630E+01
 
0ITERATION NO.:   15    OBJECTIVE VALUE:   19503.9425965825        NO. OF FUNC. EVALS.:  60
 CUMULATIVE NO. OF FUNC. EVALS.:      171
 NPARAMETR:  1.3533E+00  4.1585E+00  1.5590E+00  3.8633E+00 -1.1747E-01  1.9712E-01  9.3058E-02  7.4741E-02  1.9838E-01  7.0163E-02
             1.1363E-01
 PARAMETER:  8.4582E-02  9.2411E-02  9.7439E-02  9.6583E-02 -5.8735E-02 -4.5709E-01 -1.3870E-01 -2.4830E-01  2.3976E-01 -2.7991E-01
            -3.8829E-02
 GRADIENT:  -3.6267E+02 -3.4657E+03 -1.6750E+02  8.7731E+01  8.2574E-01  1.0963E+01 -1.2742E+01  1.9166E+00  1.7794E+00  1.1997E+00
             4.1756E-02
 
0ITERATION NO.:   20    OBJECTIVE VALUE:   19499.1730780396        NO. OF FUNC. EVALS.: 105
 CUMULATIVE NO. OF FUNC. EVALS.:      276
 NPARAMETR:  1.3772E+00  4.2172E+00  1.5136E+00  3.8371E+00 -9.3070E-02  1.9712E-01  9.8116E-02  7.1307E-02  1.7492E-01  7.5013E-02
             1.1486E-01
 PARAMETER:  8.6073E-02  9.3715E-02  9.4599E-02  9.5927E-02 -4.6535E-02 -4.5711E-01 -1.1224E-01 -2.7182E-01  1.7686E-01 -2.4649E-01
            -3.3452E-02
 GRADIENT:   1.4183E+03  5.5913E+03  9.3907E+01  7.1510E+02 -1.7179E+01 -2.9617E+00  3.2161E-01  1.0700E+00  2.0500E-01 -4.1852E-01
             4.0692E-01
 
0ITERATION NO.:   25    OBJECTIVE VALUE:   19499.0601205687        NO. OF FUNC. EVALS.:  95
 CUMULATIVE NO. OF FUNC. EVALS.:      371
 NPARAMETR:  1.3759E+00  4.2188E+00  1.5033E+00  3.8342E+00 -8.1154E-02  1.9727E-01  9.7977E-02  7.0827E-02  1.7390E-01  7.5594E-02
             1.1459E-01
 PARAMETER:  8.5994E-02  9.3751E-02  9.3956E-02  9.5855E-02 -4.0577E-02 -4.5616E-01 -1.1295E-01 -2.7520E-01  1.7393E-01 -2.4263E-01
            -3.4650E-02
 GRADIENT:   1.3707E+03  5.3097E+03  8.8143E+01  7.5074E+02  1.0807E+01  1.0936E+00 -1.5131E-01  3.1698E-01  4.9726E-01 -7.4837E-01
            -1.8079E-03
 
0ITERATION NO.:   30    OBJECTIVE VALUE:   19498.9336203554        NO. OF FUNC. EVALS.: 128
 CUMULATIVE NO. OF FUNC. EVALS.:      499             RESET HESSIAN, TYPE I
 NPARAMETR:  1.3774E+00  4.2253E+00  1.4847E+00  3.8242E+00 -7.7927E-02  1.9733E-01  9.8176E-02  7.0587E-02  1.6790E-01  7.7895E-02
             1.1470E-01
 PARAMETER:  8.6089E-02  9.3896E-02  9.2795E-02  9.5606E-02 -3.8963E-02 -4.5580E-01 -1.1194E-01 -2.7689E-01  1.5636E-01 -2.2763E-01
            -3.4149E-02
 GRADIENT:   1.4393E+03  5.6225E+03  5.9081E+01  4.3697E+02  9.3872E-01  1.4614E+00  4.2503E-01  1.0621E-01  5.8347E-01 -1.9277E-01
            -1.1402E-01
 
0ITERATION NO.:   33    OBJECTIVE VALUE:   19498.9280894154        NO. OF FUNC. EVALS.:  52
 CUMULATIVE NO. OF FUNC. EVALS.:      551
 NPARAMETR:  1.3763E+00  4.2256E+00  1.4852E+00  3.8270E+00 -7.7735E-02  1.9733E-01  9.8132E-02  7.0585E-02  1.6760E-01  7.7844E-02
             1.1471E-01
 PARAMETER:  8.6016E-02  9.3903E-02  9.2827E-02  9.5674E-02 -3.8868E-02 -4.5579E-01 -1.1216E-01 -2.7691E-01  1.5548E-01 -2.2796E-01
            -3.4102E-02
 GRADIENT:   5.7334E+02  1.7196E+03  2.5348E+01 -1.3750E+02 -9.8046E-01  6.3647E-02  1.7622E-01  1.0633E-01  3.7352E-01 -2.1820E-01
            -1.1949E-01
 
 #TERM:
0MINIMIZATION SUCCESSFUL
 HOWEVER, PROBLEMS OCCURRED WITH THE MINIMIZATION.
 REGARD THE RESULTS OF THE ESTIMATION STEP CAREFULLY, AND ACCEPT THEM ONLY
 AFTER CHECKING THAT THE COVARIANCE STEP PRODUCES REASONABLE OUTPUT.
 NO. OF FUNCTION EVALUATIONS USED:      551
 NO. OF SIG. DIGITS IN FINAL EST.:  2.0

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.
 
 ETABAR:         2.7191E-03 -1.0495E-02  1.5935E-02  6.3394E-04 -1.3932E-02
 SE:             2.7904E-02  2.1726E-02  2.1681E-02  1.7778E-02  2.5853E-02
 N:                     120         120         120         120         120
 
 P VAL.:         9.2237E-01  6.2905E-01  4.6236E-01  9.7155E-01  5.8996E-01
 
 ETASHRINKSD(%)  2.0118E+00  1.0045E+01  4.1744E+01  2.9907E+01  1.6031E+01
 ETASHRINKVR(%)  3.9832E+00  1.9080E+01  6.6062E+01  5.0870E+01  2.9492E+01
 EBVSHRINKSD(%)  1.8480E+00  1.0575E+01  4.1373E+01  3.0333E+01  1.5861E+01
 EBVSHRINKVR(%)  3.6618E+00  2.0031E+01  6.5628E+01  5.1465E+01  2.9207E+01
 EPSSHRINKSD(%)  8.3672E+00
 EPSSHRINKVR(%)  1.6034E+01
 
  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):         2280
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    4190.35971141331     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    19498.9280894154     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       23689.2878008287     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           600
  
 #TERE:
 Elapsed estimation  time in seconds:   313.30
 Elapsed covariance  time in seconds:    91.09
 Elapsed postprocess time in seconds:     0.99
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************    19498.928       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4      TH 5      TH 6     
 
         1.38E+00  4.23E+00  1.49E+00  3.83E+00 -7.77E-02  1.97E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        9.81E-02
 
 ETA2
+        0.00E+00  7.06E-02
 
 ETA3
+        0.00E+00  0.00E+00  1.68E-01
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  7.78E-02
 
 ETA5
+        0.00E+00  0.00E+00  0.00E+00  0.00E+00  1.15E-01
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        1.00E+00
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        3.13E-01
 
 ETA2
+        0.00E+00  2.66E-01
 
 ETA3
+        0.00E+00  0.00E+00  4.09E-01
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  2.79E-01
 
 ETA5
+        0.00E+00  0.00E+00  0.00E+00  0.00E+00  3.39E-01
 


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


         TH 1      TH 2      TH 3      TH 4      TH 5      TH 6     
 
         2.91E-02  3.98E-02  1.15E-01  4.83E-02  4.76E-02  3.23E-03
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        1.73E-02
 
 ETA2
+       .........  1.12E-02
 
 ETA3
+       ......... .........  6.58E-02
 
 ETA4
+       ......... ......... .........  2.60E-02
 
 ETA5
+       ......... ......... ......... .........  2.01E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+       .........
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        2.76E-02
 
 ETA2
+       .........  2.11E-02
 
 ETA3
+       ......... .........  8.04E-02
 
 ETA4
+       ......... ......... .........  4.65E-02
 
 ETA5
+       ......... ......... ......... .........  2.97E-02
 


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
 

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 TH 1
+        8.47E-04
 
 TH 2
+       -3.15E-05  1.58E-03
 
 TH 3
+        5.41E-04 -3.02E-03  1.31E-02
 
 TH 4
+        1.06E-04 -1.01E-03  3.33E-03  2.34E-03
 
 TH 5
+        9.47E-06  1.17E-03 -2.93E-03 -1.06E-03  2.27E-03
 
 TH 6
+       -1.09E-05  1.54E-05 -9.24E-06 -1.58E-06 -2.22E-05  1.05E-05
 
 OM11
+        1.12E-04  2.58E-05  2.57E-04  7.19E-05 -2.76E-06 -9.66E-07  2.99E-04
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+       -9.32E-06 -8.50E-05  7.06E-05  1.65E-05 -7.02E-05 -2.29E-06 -2.53E-05 ......... ......... ......... .........  1.25E-04
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... .........
 
 OM25
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... .........
 
 OM33
+        1.66E-04 -1.08E-03  4.33E-03  1.18E-03 -9.73E-04  3.92E-06  1.79E-04 ......... ......... ......... .........  2.65E-05
         ......... ......... .........  4.33E-03
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+       -3.44E-05  3.38E-04 -1.00E-03 -2.05E-04  4.64E-04 -5.64E-06 -1.37E-05 ......... ......... ......... .........  4.51E-06
         ......... ......... ......... -4.67E-04 ......... .........  6.74E-04
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+       -5.38E-05 -1.61E-05 -8.61E-05  1.30E-04 -1.26E-04  3.46E-06 -2.44E-05 ......... ......... ......... ......... -2.62E-06
         ......... ......... ......... -1.84E-04 ......... ......... -3.78E-05 .........  4.04E-04
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                          CORRELATION MATRIX OF ESTIMATE                        ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 TH 1
+        2.91E-02
 
 TH 2
+       -2.72E-02  3.98E-02
 
 TH 3
+        1.62E-01 -6.63E-01  1.15E-01
 
 TH 4
+        7.55E-02 -5.25E-01  6.02E-01  4.83E-02
 
 TH 5
+        6.83E-03  6.17E-01 -5.38E-01 -4.61E-01  4.76E-02
 
 TH 6
+       -1.16E-01  1.19E-01 -2.49E-02 -1.01E-02 -1.44E-01  3.23E-03
 
 OM11
+        2.23E-01  3.75E-02  1.30E-01  8.60E-02 -3.35E-03 -1.73E-02  1.73E-02
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+       -2.86E-02 -1.91E-01  5.51E-02  3.04E-02 -1.32E-01 -6.33E-02 -1.31E-01 ......... ......... ......... .........  1.12E-02
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... .........
 
 OM25
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... .........
 
 OM33
+        8.67E-02 -4.11E-01  5.74E-01  3.72E-01 -3.10E-01  1.84E-02  1.57E-01 ......... ......... ......... .........  3.59E-02
         ......... ......... .........  6.58E-02
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+       -4.55E-02  3.27E-01 -3.37E-01 -1.64E-01  3.75E-01 -6.72E-02 -3.06E-02 ......... ......... ......... .........  1.55E-02
         ......... ......... ......... -2.73E-01 ......... .........  2.60E-02
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+       -9.20E-02 -2.01E-02 -3.74E-02  1.34E-01 -1.31E-01  5.32E-02 -7.01E-02 ......... ......... ......... ......... -1.16E-02
         ......... ......... ......... -1.39E-01 ......... ......... -7.24E-02 .........  2.01E-02
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                      INVERSE COVARIANCE MATRIX OF ESTIMATE                     ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 TH 1
+        1.30E+03
 
 TH 2
+       -9.69E+01  1.57E+03
 
 TH 3
+       -7.62E+01  1.97E+02  2.09E+02
 
 TH 4
+       -1.16E+01  1.74E+02 -1.30E+02  7.57E+02
 
 TH 5
+       -4.19E+01 -4.39E+02  5.90E+01  1.03E+02  8.72E+02
 
 TH 6
+        1.29E+03 -3.11E+03 -2.16E+01 -1.13E+01  2.38E+03  1.07E+05
 
 OM11
+       -4.11E+02 -3.16E+02 -6.51E+01 -7.53E+01  2.78E+01  5.08E+02  3.73E+03
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+       -1.13E+01  5.49E+02  6.63E+01  1.42E+02  2.07E+02  1.45E+03  6.11E+02 ......... ......... ......... .........  8.59E+03
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... .........
 
 OM25
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... .........
 
 OM33
+        2.25E+01  4.15E+01 -9.63E+01 -3.70E+01 -2.27E+01 -3.31E+02 -1.25E+02 ......... ......... ......... ......... -3.22E+01
         ......... ......... .........  3.64E+02
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+        5.22E+01 -1.54E+02  6.25E+01 -1.66E+02 -2.50E+02  6.11E+02 -4.75E+00 ......... ......... ......... ......... -3.28E+02
         ......... ......... .........  9.76E+01 ......... .........  1.87E+03
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+        1.24E+02 -8.56E+01  6.12E+01 -2.70E+02  1.76E+02 -1.86E+02  1.19E+02 ......... ......... ......... .........  8.81E+01
         ......... ......... .........  1.59E+02 ......... .........  2.01E+02 .........  2.74E+03
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 Elapsed finaloutput time in seconds:     0.20
1THERE ARE ERROR MESSAGES IN FILE PRDERR                                                                  
 #CPUT: Total CPU Time in Seconds,      406.391
