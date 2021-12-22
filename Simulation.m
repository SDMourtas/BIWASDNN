function Simulation(W,N,trainedModel,x,y)

Time=20; dt=0.01; t=0:dt:Time; r_in=1;
[~,~,y_PID]=tf_out(dt,Time,x);

y_NN=tf_out_pred(W,N,trainedModel,x,y,dt,Time);

figure
plot(t,[0;y_PID],'Color',[0.64,0.08,0.18]);hold on
plot(t,[0;y_NN],'--','Color',[0.07,0.62,1.00])
plot(t,r_in*ones(length(t),1),':','Color',[0.93,0.69,0.13])
xlabel('Time (sec)');ylabel('$y(t)$','Interpreter','latex')
legend('PID','NN','$r(t)$','Interpreter','latex')