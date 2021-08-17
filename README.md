# vs-ci-relations
This repository contains some of the code used in the manuscript "Theoretical relationship between two measures of spike synchrony: Correlation index and vector strength" (submitted Aug 2021). 

### The main functions and scripts can be used to ...
  1. simulate von Mises, auditory nerve (AN), and globular bushy cell (GBC) spike trains,
  2. calculate vector srength (VS), correlation index (CI) and shuffled autocorrelogram (SAC) from spike trains,
  3. calculate theoretical VS and CI,
  4. generate a similar plot as in Fig 3A,B

### The main files and directories of the repo are
  + `bez2018model` -- directory with the code for the auditory periphery model from the publication in Bruce et al. (2018).
  + `utils` -- directory with data preprocessing code.
  + `PhaseLock.m` -- function to generate Poissonian spike trains with a von Mises spiking distribution.
  + `calcSAC.m` -- function to calculate the shuffled autocorrelogram (SAC) and correlation index (CI) for spike trains.
  + `calcPhaseHist.m` -- function to calculate the phase histogram and vector strength (VS) of spike trains.
  + `generateVM.m` -- script to generate Poissonian spike trains with a von Mises distribution.
  + `generateAN.m` -- script to generate AN spike trains. Uses directory `bez2018mode` with the auditory periphery model (Bruce et al., 2018).
  + `generateGBC.m` -- script to generate GBC spike trains with an adaptive coincidence counting model.
  + `gen-data-analysis.m` -- script to create Fig 3A (von Mises spike trains).
  + `an-gbc-model-analysis.m` -- script to create Fig 3B (AN and GBC spike trains).
  + `vs-ci-estimation.m` -- script to estimate CI from VS (et vice versa) with their theoretical relation.
  
