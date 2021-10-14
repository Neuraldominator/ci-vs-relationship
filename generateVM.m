%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script can be used to generate phase-locked spike data with the von 
% Mises (vM) distribution using the function PhaseLock.m. It also includes
% a demo for using calcPhaseHist.m and calcSAC.m to calculate VS and CI. 
% Code for raster plots, phase histograms and SACs is also provided. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 1. Define generation parameters
VSin = [0.25,0.5,0.75];  
dt = 2;   % time step [us]
D = 150;  % data length [ms] (-> time steps N = D/dt = 75000)
M = 400;  % number trials
F = 500;  % frequency [Hz]
L = 200;  % spike rate [spikes/sec]
P = pi;   % initial phase [rad] 

%% 2. Generate the phase-locked spike trains with PhaseLock.m 
DT = dt/1000;  % convert time steps from [us] to [ms]
N = D/DT;      % number of simulated time steps 

% generate phase-locked spike trains
Nsess = length(VSin);  % number of "sessions"
A = zeros(Nsess,M,N);  % init. spike train (in batches due to memory limit)
K = zeros(Nsess,1);    % init. kappa
for k = 1:Nsess
  [A(k,:,:), K(k)] = PhaseLock(M, N, F, VSin(k), L, P, DT);
  
  % convert binary 'A' into spike times 'spt' with temp. resolution DT
  for l = 1:M
    spt{k,l} = find(A(k,l,:)==1)*DT;  % spike times [ms] 
  end
end

%% 3. Calculate empirical VS and CI
T1 = 15;   % start of analysis window [ms]
T2 = D;    % end of analysis window [ms]
NB = 41;   % number of bins for phase histogram
BW = 0.05; % SAC bin width [ms]
TL = 5;    % range of SAC 

% init.
PH = zeros(Nsess,NB);
SAC = zeros(Nsess,2*TL/BW+1);
VS = zeros(1,Nsess);
CI = zeros(1,Nsess);
for k=1:Nsess
  [PH(k,:), PHtv, VS(k)] = calcPhaseHist(spt(k,:), T1, T2, NB, F);
  [SAC(k,:), SACtv, CI(k), ~, ~] = calcSAC(spt(k,:), BW, T1, T2, TL);
end

%% 4. Plotting some results
figure(1);

% raster plot of last simulated unit (VSin=0.75)
subplot(311)
for l=1:M
  plot(spt{end,l}, l*ones(1,length(spt{end,l})), 'k.' ,'Markersize', 4)
  hold on
end
title('Raster plot')
ylabel('trials')
xlabel('time (ms)')
xlim([0 30])
set(gca,'TickDir','out');
box off

% phase histogram of last generated unit (VSin=0.75)
subplot(312)
plot(PHtv, PH(end,:), 'k-', 'LineWidth', 1)
xlabel('period (cycle)')
ylabel('spike rate (spikes/s)')
title('Phase histogram')
set(gca,'TickDir','out');
box off

% SAC of last generated unit (VSin=0.75)
subplot(313)
plot(SACtv, SAC(end,:), 'k-', 'LineWidth',1)
xlabel('delay (ms)')
ylabel('normalized #coincidences')
title('Shuffled autocorrelogram')
set(gca,'TickDir','out');
box off

%% 5. VS-CI plot
% theoretical VS-CI relationship
kappa = 0:0.1:20;
VStheo = besseli(1,kappa) ./ besseli(0,kappa);
CItheo = besseli(0,2*kappa) ./ (besseli(0,kappa)).^2;

% plotting
figure(2);
plot(CI, VS, '+b', 'LineWidth', 1)  % empirical values
hold on
plot(CItheo, VStheo, '-k', 'LineWidth', 1) % theoretical reference line
hold off
xlabel('correlation index')
ylabel('vector strength')
xlim([0 8])
legend('simulated vM units','theoretical relation','Location','best')
set(gca,'TickDir','out');
box off
