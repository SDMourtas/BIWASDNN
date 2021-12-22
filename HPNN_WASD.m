% =========================================================% 
% WASD by Y. Zhang, D. Chen, and C. Ye, Deep Neural Networks: 
%
% WASD Neuronet Models, Algorithms, and Applications. 
%
% CRC Press, 2019.
% ======================================================== %
function [W,Nbest,Em,EE]=HPNN_WASD(X,Y,H,M)
% function for finding the optimal hidden-layer neurons weights of the
% neuronet

% Initialization
Nbest=1;n=1;Em=inf;E=10;EE=[];

while E<=Em || Nbest==n+2
% WDD Method
Q=Qmatrix2(X,M,H,n);
W=pinv(Q)*Y; 
E=1/H*sum((Q*W-Y).^2); % average error
if E<Em
    Em=E;Nbest=n;
end
EE=[EE;E];
n=n+1;
end

% output
Q=Qmatrix2(X,M,H,Nbest);
W=pinv(Q)*Y; 