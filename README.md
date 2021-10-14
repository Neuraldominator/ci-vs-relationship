# vs-ci-relations
This repository contains some of the code used in the manuscript "Theoretical relationship between two measures of spike synchrony: Correlation index and vector strength" (submitted Aug 2021). 

### The main functions and scripts can be used to ...
  1. simulate von Mises spike trains,
  2. calculate vector strength (VS), correlation index (CI) and shuffled autocorrelogram (SAC) from spike trains,
  3. calculate or estimate theoretical VS and CI via kappa,
  4. generate similar plots as in Fig2, Fig 3A of Kessler et al.

### The main files and directories of the repo are
  + `PhaseLock.m` -- function to generate Poissonian spike trains with a von Mises spiking distribution.
  + `calcSAC.m` -- function to calculate the shuffled autocorrelogram (SAC) and correlation index (CI) for spike trains.
  + `calcPhaseHist.m` -- function to calculate the phase histogram and vector strength (VS) of spike trains.
  + `generateVM.m` -- script to generate Poissonian spike trains with a von Mises distribution; compute VS and CI; plot rasters, phase histograms and SACs; and compare empirical VS and CI values to their theoretical relation.
  + `estimateCI.m` -- script to estimate CI from VS with their theoretical relation.
  + `estimateVS.m` -- script to estimate VS from CI with their theoretical relation.
  
