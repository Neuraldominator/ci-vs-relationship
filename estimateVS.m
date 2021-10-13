function [VSest,Kci] = estimateVS(CIin)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% computes the estimated VS from CI values assuming a von Mises (vM) distribution.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Inputs
%   CIin: correlation index value(s)
%
% Outputs
%   VSest: vector strength 
%   Kci: concentration parameter of vM distribution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Ndata = length(CIin);
Kci = zeros(Ndata, 1);  
VSest = zeros(Ndata, 1);
for k = 1:Ndata
    cifun = @(K)(besseli(0,2*K) ./ besseli(0,K).^2 - CIin(k));
    Kci(k) = fsolve(cifun, 1.0, optimset('Display','off'));
    VSest(k) = besseli(0,2*Kvs(k)) ./ (besseli(0,Kci(k))^2);
end

end % [eof]
