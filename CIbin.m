function CI = CIbin(k,w,f,N)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Approximate calculation of CI for binning (cf. Equation 7 in Kessler et al.) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Inputs
%   k: concentration parameter (von Mises)
%   w: bin width [ms]
%   f: frequency [Hz]
%   N: number of considered summands 
% 
% Output
%   CI: correlation index value
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ci = zeros(1,N+1);
ci(1) = 1;
  for n = 1:N
    ci(n+1) = 2 * (besseli(n,k)/besseli(0,k))^2 * (sin(n*w*1e-3*pi*f)/(n*w*1e-3*pi*f));
  end
CI = sum(ci);
end