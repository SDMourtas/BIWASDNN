function [y_out,error,u]=tf_out_pred(W,N,trainedModel,p,y,dt,Time)

if p==1
    b2=[];b1=[];b0=1;a2=1;a1=10;a0=20;
elseif p==2
    b2=[];b1=[];b0=3;a2=5;a1=25;a0=50;
elseif p==3
    b2=[];b1=[];b0=2;a2=10;a1=100;a0=10;
end
sys=tf([b2,b1,b0],[a2,a1,a0]);
dsys=c2d(sys,dt,'z');
[num,den]=tfdata(dsys,'v');
num=num(2:end);  % numerator
den=den(2:end);  % denominator

% initialization
u_old=zeros(length(num),1); y_old=zeros(length(den),1);
t_range=Time/dt; r_in=ones(t_range,1); 
u=zeros(t_range,1); y_out=zeros(t_range,1); error=r_in;

% simulation
for k = 1:t_range
    if k>1
        er=error(k-1);
    else
        er=error(k);
    end
    if y<=2
        u(k)=predictN(er,W,N,y);
    else
        u(k)=trainedModel.predictFcn(er);
    end
    
    y_out(k)=-den*y_old+num*u_old;
    error(k)=r_in(k)-y_out(k);
    
    u_old=[u(k);u_old(1:end-1)];
    y_old=[y_out(k);y_old(1:end-1)];
end