function [X_train,Y_train,X_test,Y_test,p,d,delta,n,tmax]=problem(x)
% Input data and parameters of the BASWASDN setup

Time=20; dt=0.01;
[error,u_out]=tf_out(dt,Time,x);
T=[error,u_out];
p=0.7;d=8;delta=5;
n=30;    % number of hidden units
tmax=30; % number of training iterations

% training data
k=size(T,2); col=1:k-1; row=1:size(T,1);
train_row=row(1:2:end-1);        % training-testing: 50-50%
test_row=row(2:2:end);
X_train=T(train_row,col); Y_train=T(train_row,k);
X_test=T(test_row,col); Y_test=T(test_row,k);