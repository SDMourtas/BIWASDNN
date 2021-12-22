function Y=predictN(X,W,N,y)
% function for predicting prices

[row,col]=find(isnan(X));
X(row,col)=0;
[m,n]=size(X);

if y==1
    Q=Qmatrix(X,n,m,N);
else
    Q=Qmatrix2(X,n,m,N);
end
Y=Q*W; 