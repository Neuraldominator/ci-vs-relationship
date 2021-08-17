# vs-ci-relations
This repository contains some of the code used in the manuscript "Theoretical relations between metrics of spike synchrony: Correlation index and vector strength"

## This repository contains functions and scripts to ...
  1. simulate von Mises, AN, and GBC spike trains,
  2. calculate VS, CI and SAC from empirical data,
  3. calculate theoretical VS and CI,
  4. generate a similar plot as in Fig 3A,B

## The main files and directories of the repo are
  + BEZ2018model -- directory with the code from the publication in Bruce et al (2018)
  + PhaseLock.m -- function to generate Poissonian spike trains with a von Mises spiking distribution
  + calcSAC.m  -- function to calculate the shuffled autocorrelogram (SAC) and correlation index (CI) for spike trains.
  + calcPhaseHist.m  -- code to calculate the phase histogram and vector strength (VS) of spike trains.
  + trainAN.m -- generate AN spike trains. Uses auditory periphery model published by Bruce et al (2018)
  + trainGBC.m -- 
  
