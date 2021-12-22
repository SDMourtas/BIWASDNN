function Q=Qmatrix2(X,M,H,d)
% function for calculating the matrix Q

Q=zeros(H,M*d); 
for i=1:d
Q(:,M*(i-1)+1:M*i)=hermiteH(i-1,X);
end