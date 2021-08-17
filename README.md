# vs-ci-relations
This repository contains some of the code used in the manuscript "Theoretical relationship between two measures of spike synchrony: Correlation index and vector strength" (submitted Aug 2021). 

## The main functions and scripts can be used to ...
  1. simulate von Mises, auditory nerve (AN), and globular bushy cell (GBC) spike trains,
  2. calculate vector srength (VS), correlation index (CI) and shuffled autocorrelogram (SAC) from spike trains,
  3. calculate theoretical VS and CI,
  4. generate a similar plot as in Fig 3A,B

## The main files and directories of the repo are
  + 'BEZ2018model' -- directory with the code for the auditory periphery model from the publication in Bruce et al (2018).
  + 'PhaseLock.m' -- function to generate Poissonian spike trains with a von Mises spiking distribution.
  + 'calcSAC.m' -- function to calculate the shuffled autocorrelogram (SAC) and correlation index (CI) for spike trains.
  + 'calcPhaseHist.m'  -- function to calculate the phase histogram and vector strength (VS) of spike trains.
  + 'trainAN.m' -- script to generate AN spike trains. Uses auditory periphery model published by Bruce et al (2018).
  + 'trainGBC.m' -- script to generate GBC spike trains with an adaptive coincidence counting model.
  + 
  
