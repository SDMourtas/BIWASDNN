function [error,u,y_out]=tf_out(dt,Time,x)

if x==1
    b2=[];b1=[];b0=1;a2=1;a1=10;a0=20;
    K=[350,300,50]; % K=[Kp; Ki; Kd]
elseif x==2
    b2=[];b1=[];b0=3;a2=5;a1=25;a0=50;
    K=[200,200,100];
elseif x==3
    b2=[];b1=[];b0=2;a2=10;a1=100;a0=10;
    K=[200,200,100];
end
sys=tf([b2,b1,b0],[a2,a1,a0]);
dsys=c2d(sys,dt,'z');
[num,den]=tfdata(dsys,'v');
num=num(2:end);  % numerator
den=den(2:end);  % denominator

% initialization
u_old=zeros(length(num),1); y_old=zeros(length(den),1);
t_range=Time/dt; r_in=ones(t_range,1); v=ones(length(K),1);
u=zeros(t_range,1); y_out=zeros(t_range,1); error=r_in;

% simulation
for k = 1:t_range
   
    du=[K*[1;dt;1/dt],-K(1)-2*K(3)/dt,K(3)/dt]*v;
    u(k)=u_old(1)+du;
    
    y_out(k)=-den*y_old+num*u_old;
    error(k)=r_in(k)-y_out(k);
    
    u_old=[u(k);u_old(1:end-1)];
    y_old=[y_out(k);y_old(1:end-1)];
    if k>2
        v=error(k:-1:k-2);
    elseif k==2
        v=[error(k);error(k-1);1];
    else
        v=error(k)*ones(3,1);        
    end
end