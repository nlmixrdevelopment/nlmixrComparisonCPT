$PROB    INFUSION_1CPT_VCL MULTIPLE DOSE FOCE INTER (120 Ind/4677 Obs) runODE013
$INPUT   ID TIME DV LNDV MDV AMT RATE EVID DOSE VI CLI SSX IIX SD CMT
$DATA    INFUSION_1CPT.csv IGNORE=@ IGNORE (SD.EQ.1)
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