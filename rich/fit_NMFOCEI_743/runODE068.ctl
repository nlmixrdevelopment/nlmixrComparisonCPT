$PROB    ORAL1_2CPT_KAV1QV2VMKM SINGLE DOSE FOCEI (120 Ind/2280 Obs) runODE068
$INPUT   ID TIME DV LNDV MDV AMT EVID DOSE VI VMI KMI QI V2I KAI SD CMT
$DATA    ORAL_2CPTMM.csv IGNORE=@ IGNORE(SD.EQ.0)
$SUBR    ADVAN13 TOL=6
$MODEL
         COMP=(ABS,DEFDOSE)
         COMP=(CENTRAL,DEFOBS)
         COMP=(PERI)
$PK
         VM=EXP(THETA(1)+ETA(1))
         KM=EXP(THETA(2)+ETA(2))
         V2=EXP(THETA(3)+ETA(3))
         Q =EXP(THETA(4)+ETA(4))
         V3=EXP(THETA(5)+ETA(5))
         K12=EXP(THETA(6)+ETA(6))
         K23=Q/V2
         K32=Q/V3
         S2=V2
$DES
         C2     =  A(2)/V2
         DADT(1)= -K12*A(1)
         DADT(2)=  K12*A(1)+K32*A(3)-K23*A(2)-VM*C2/(KM+C2)  
         DADT(3)=         -K32*A(3)+K23*A(2)
$ERROR   
         IPRED = F     
         RESCV = THETA(7) 
         W     = IPRED*RESCV
         IRES  = DV-IPRED
         IWRES = IRES/W
         Y     = IPRED+W*EPS(1)

$THETA   7.1       ;log VM
$THETA   5.7       ;log KM 
$THETA   4.5       ;log Vc
$THETA   1.6       ;log Q
$THETA   4.1       ;log Vp
$THETA   0.22      ;log KA
$THETA   (0,0.3,1) ;RSV
$OMEGA   0.15 0.15 0.15 0.15 0.15 0.15
$SIGMA   1 FIX
$EST     NSIG=2 SIGL=6 PRINT=5 MAX=9999 NOABORT POSTHOC METHOD=COND INTER NOOBT
$COV
$TABLE  ID TIME LNDV MDV AMT EVID DOSE VI VMI KMI V2I V2 VM KM Q V3 K12 ETA1 ETA2 ETA3 ETA4 ETA5 ETA6
        IPRED IRES IWRES CWRESI
        ONEHEADER NOPRINT FILE=runODE068.csv