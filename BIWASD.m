function [W,Nbest,Em,E]=BIWASD(X,Y,H,M,n,tmax,p,d,delta)
% function for finding the optimal hidden-layer neurons powers and weights
% of the neuronet

eta_delta=0.95;eta_d=0.95;
H1=round(p*H); % size of data fitting
H2=H-H1;       % size of data validation
x0=(1-round(n/2):n-round(n/2))';
E=zeros(tmax+1,1);Em=fitness(X,Y,H,M,x0,H1,H2);E(1)=Em;

% iteration
for t=1:tmax 
    c=rands(n,1);
    c=c/(eps+norm(c));
    xr=round(x0+d*c);
    xl=round(x0-d*c);
    Er=fitness(X,Y,H,M,xr,H1,H2);
    El=fitness(X,Y,H,M,xl,H1,H2);
    x=round(x0+delta*c*sign(Er-El));
    E(t+1)=fitness(X,Y,H,M,x,H1,H2);
    if E(t+1)<Em
        x0=x; Em=E(t+1);
    end
    delta=eta_delta*delta;
    d=eta_d*d+0.001;
end

% output
Nbest=x0(x0>=0); 
Q=Qmatrix(X,M,H,Nbest);
W=pinv(Q)*Y; 
