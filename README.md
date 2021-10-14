# vs-ci-relations
This repository contains some of the code used in the manuscript "Theoretical relationship between two measures of spike synchrony: Correlation index and vector strength" (submitted Aug 2021). 

### The main functions and scripts can be used to ...
  1. simulate von Mises spike trains,
  2. calculate vector strength (VS), correlation index (CI) and shuffled autocorrelogram (SAC) from spike trains,
  3. calculate or estimate theoretical VS and CI via kappa,
  4. generate similar plots as in Figure 2 and Figure 3A of Kessler et al.

### The main files and directories of this repository are ...
  + `PhaseLock.m` function to generate Poissonian spike trains with a von Mises spiking distribution.
  + `calcPhaseHist.m` function to calculate the phase histogram and vector strength (VS) of spike trains.
  + `calcSAC.m` function to calculate the shuffled autocorrelogram (SAC) and correlation index (CI) for spike trains.
  + `compCIbin.m` function to compute the theoretical SAC decay with binning (cf. Equation 7 in Kessler et al.).
  + `estimateCI.m` function to estimate CI from VS with their theoretical relation.
  + `estimateVS.m` function to estimate VS from CI with their theoretical relation.
  + `generateVM.m` script to generate Poissonian spike trains with a von Mises distribution; compute VS and CI; plot rasters, phase histograms and SACs; and compare empirical VS and CI values to their theoretical relation.
  + `testSACdecay.m` script to reproduce Figure 6 of Kessler et al. about the effect of the data length on the SAC.
 
  
