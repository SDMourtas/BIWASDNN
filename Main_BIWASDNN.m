%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  A 3-layer feed-forward neuronet model, trained by a BIWASD       %
%  algorithm. (version 1.0)                                         %
%                                                                   %
%  Developed in MATLAB R2018b                                       %
%                                                                   %
%  Author and programmer: S.D.Mourtas, V.N.Katsikis, C. Kasimis     %
%                                                                   %
%   e-Mail: spirosmourtas@gmail.com                                 %
%           vaskatsikis@econ.uoa.gr                                 %
%           chrkasim@upatras.gr                                     %
%                                                                   %
%   Main paper: S.D.Mourtas, V.N.Katsikis, C. Kasimis,              %
%               "Feedback Control Systems Stabilization Using a     %
%               Bio-inspired Neural Network",(submitted)            %
%                                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear 
close all
clc

% Choose modeling problem (for x = 1 to 3)
x=1;
% Choose method: BIWASD (y = 1), HPNN_WASD (y = 2), Fine Tree (y==3),
%                Squared Exp. GPR (y==4)
y=1;

[X_train,Y_train,X_test,Y_test,p,d,delta,n,tmax]=problem(x);
[H,M]=size(X_train);

%% Training

% Neuronet model
if y==1
tic
[W,N,Em,E]=BIWASD(X_train,Y_train,H,M,n,tmax,p,d,delta);  % optimal hidden-layer structure
toc
elseif y==2
tic
[W,N,Em,E]=HPNN_WASD(X_train,Y_train,H,M);  % optimal hidden-layer structure
toc
elseif y==3
tic
trainedModel=FTree([X_train,Y_train]);
toc
elseif y==4
tic
trainedModel=SEGPR([X_train,Y_train]);
toc
end

%% Predict
if y<=2
predt=predictN(X_train,W,N,y);
pred=predictN(X_test,W,N,y);
trainedModel=[];
else
predt=trainedModel.predictFcn(X_train);
pred=trainedModel.predictFcn(X_test);
E=[];Em=[];W=[];N=[];
end

Et=error_pred(predt,Y_train,pred,Y_test); % Error of test data

%% Figures
Problem_figures(pred,Y_test,E,Em,y)

%% Simulation
Simulation(W,N,trainedModel,x,y)
