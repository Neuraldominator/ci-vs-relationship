function [CIest,Kvs] = estimateCI(VSin)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% computes the estimated CI from VS values assuming a von Mises (vM) distribution.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% input: 
%   VSin: vector strength value(s)
%
% outputs:
%   CIest: correlation index 
%   Kvs: concentration parameter of vM distribution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Ndata = length(VSin);
Kvs = zeros(Ndata, 1);  
CIest = zeros(Ndata, 1);
for k = 1:Ndata
  vsfun = @(K)(besseli(1,K) ./ besseli(0,K) - VSin(k));
  Kvs(k) = fsolve(vsfun, 1.0, optimset('Display','off'));  
  CIest(k) = besseli(0,2*Kvs(k)) ./ (besseli(0,Kvs(k))^2);
end

end % [eof]