$PROB    BOLUS_2CPT_V1QV2VMKM SINGLE DOSE FOCEI (120 Ind/2280 Obs) runODE040
$INPUT   ID TIME DV LNDV MDV AMT EVID DOSE VI VMI KMI QI V2I SD CMT
$DATA    BOLUS_2CPTMM.csv IGNORE=@ IGNORE(SD.EQ.0)
$SUBR    ADVAN13 TOL=7
$MODEL
         COMP=(CENTRAL,DEFOBS,DEFDOSE)
         COMP=(PERI)
$PK
         VM=EXP(THETA(1)+ETA(1))
         KM=EXP(THETA(2)+ETA(2))
         V =EXP(THETA(3)+ETA(3))
         Q =EXP(THETA(4)+ETA(4))
         V2=EXP(THETA(5)+ETA(5))
         K12=Q/V
         K21=Q/V2
         V1=V
         S1=V
$DES
         C1=A(1)/V1
         DADT(1)= K21*A(2)-K12*A(1)-VM*C1/(KM+C1)
         DADT(2)=-K21*A(2)+K12*A(1)  
$ERROR   
         IPRED = F     
         RESCV = THETA(6) 
         W     = IPRED*RESCV
         IRES  = DV-IPRED
         IWRES = IRES/W
         Y     = IPRED+W*EPS(1)

$THETA   7.1       ;log VM
$THETA   5.7       ;log KM 
$THETA   4.3       ;log Vc
$THETA   1.5       ;log Q
$THETA   4         ;log Vp
$THETA   (0,0.3,1) ;RSV
$OMEGA   0.15 0.1 0.15 0.15 0.15
$SIGMA   1 FIX
$EST     NSIG=2 SIGL=6 PRINT=5 MAX=9999 NOABORT POSTHOC METHOD=COND INTER NOOBT
$COV
$TABLE  ID TIME LNDV MDV AMT EVID DOSE VI VMI KMI V VM KM Q V2 ETA1 ETA2 ETA3 ETA4 ETA5
        IPRED IRES IWRES CWRESI
        ONEHEADER NOPRINT FILE=runODE040.csv