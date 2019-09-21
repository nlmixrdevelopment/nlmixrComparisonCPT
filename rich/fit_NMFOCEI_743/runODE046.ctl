$PROB    INFUSION_2CPT_CLV1QV2 SINGLE DOSE FOCEI (120 Ind/2280 Obs) runODE046
$INPUT   ID TIME DV LNDV MDV AMT RATE EVID DOSE V1I CLI QI V2I SSX IIX SD CMT
$DATA    INFUSION_2CPT.csv IGNORE=@ IGNORE (SD.EQ.0)
$SUBR    ADVAN13 TOL=6
$MODEL
         COMP=(CENTRAL,DEFOBS,DEFDOSE)
         COMP=(PERI)
$PK
         CL=EXP(THETA(1)+ETA(1))
         V=EXP(THETA(2)+ETA(2))
         Q=EXP(THETA(3)+ETA(3))
         V2=EXP(THETA(4)+ETA(4))
         V1=V
         S1=V
		 K21=Q/V2
		 K12=Q/V
$DES
         DADT(1)= K21*A(2)-K12*A(1)-CL*A(1)/V1
         DADT(2)=-K21*A(2)+K12*A(1)  		 
$ERROR   
         IPRED = F     
         RESCV = THETA(5) 
         W     = IPRED*RESCV
         IRES  = DV-IPRED
         IWRES = IRES/W
         Y     = IPRED+W*EPS(1)
$THETA   1.6       ;log Cl
$THETA   4.5       ;log Vc
$THETA   1.6       ;log Q
$THETA   4         ;log Vp
$THETA   (0,0.3,1) ;RSV
$OMEGA   0.15 0.15 0.15 0.15
$SIGMA   1 FIX
$EST     NSIG=2 SIGL=6 PRINT=5 MAX=9999 NOABORT POSTHOC METHOD=COND INTER NOOBT
$COV
$TABLE  ID TIME LNDV MDV AMT EVID DOSE V1I CLI CL V Q V2 ETA1 ETA2 ETA3 ETA4
        IPRED IRES IWRES CWRESI
        ONEHEADER NOPRINT FILE=runODE046.csv