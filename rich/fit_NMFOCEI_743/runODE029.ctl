$PROB    ORAL1_1CPT_KAVVMKM SINGLE DOSE FOCEI (120 Ind/2279 Obs) runODE029
$INPUT   ID TIME DV LNDV MDV AMT EVID DOSE VI VMI KMI KAI SD CMT
$DATA    ORAL_1CPTMM.csv IGNORE=@ IGNORE (SD.EQ.0)
$SUBR    ADVAN13 TOL=6
$MODEL
         COMP=(ABS,DEFDOSE)
         COMP=(CENTRAL,DEFOBS)
$PK
         VM=EXP(THETA(1)+ETA(1))
         KM=EXP(THETA(2)+ETA(2))
         V =EXP(THETA(3)+ETA(3))
         KA=EXP(THETA(4)+ETA(4))
         S2=V
$DES
         DADT(1)= -KA*A(1)
         DADT(2)=  KA*A(1)-VM*(A(2)/V)/(KM+(A(2)/V))  
$ERROR   
         IPRED = F     
         RESCV = THETA(5) 
         W     = IPRED*RESCV
         IRES  = DV-IPRED
         IWRES = IRES/W
         Y     = IPRED+W*EPS(1)

$THETA   7         ;log VM
$THETA   5.7       ;log KM 
$THETA   4.5       ;log Vc
$THETA   0.2       ;log KA
$THETA   (0,0.3,1) ;RSV
$OMEGA   0.15 0.15 0.15 0.15
$SIGMA   1 FIX
$EST     NSIG=2 SIGL=6 PRINT=5 MAX=9999 NOABORT POSTHOC METHOD=COND INTER NOOBT
$COV
$TABLE  ID TIME LNDV MDV AMT EVID DOSE VI VMI KMI V VM KM KA ETA1 ETA2 ETA3 ETA4
        IPRED IRES IWRES CWRESI
        ONEHEADER NOPRINT FILE=runODE029.csv