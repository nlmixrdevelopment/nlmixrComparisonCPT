$PROBLEM    ORAL1_1CPT_KAVCL FOCEI runN024
$INPUT      ID DOSE VI CLI KAI TIME EVIDNLMX AMT DV EVID
$DATA      bs_pr1_98.dta IGNORE=@
$SUBROUTINE ADVAN6 TOL=6
$MODEL      COMP=(ABS,DEFDOSE) COMP=(CENTRAL,DEFOBS)
$PK 
    CL=EXP(THETA(1)+ETA(1))
    V=EXP(THETA(2)+ETA(2))
    KA=EXP(THETA(3)+ETA(3))
    S2=V
$DES  
    DADT(1)= -KA*A(1)
    DADT(2)=  KA*A(1)-CL*(A(2)/V)
$ERROR    
    IPRED = F     
    RESCV = THETA(4) 
    W     = IPRED*RESCV
    IRES  = DV-IPRED
    IWRES = IRES/W
    Y     = IPRED+W*EPS(1)
$THETA  1 ; CL
$THETA  4 ; V
$THETA  0.1 ; Ka
$THETA  (0,0.2,1) ; RSV
$OMEGA  0.2
 0.2
 0.2
$SIGMA  1  FIX
$ESTIMATION NSIG=2 SIGL=6 PRINT=5 MAX=9999 NOABORT POSTHOC METHOD=COND
            INTER NOOBT
$COVARIANCE

