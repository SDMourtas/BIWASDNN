function Q=Qmatrix(X,M,H,N)
% function for calculating the matrix Q

d=length(N); Q=zeros(H,M*d);
for i=1:d
    r=exp(X.^N(i));  % power sigmoid
    Q(:,M*(i-1)+1:M*i)=r./(r+1);
end