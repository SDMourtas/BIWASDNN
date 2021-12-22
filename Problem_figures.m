function Problem_figures(pred,Y_test,E,Em,y)
[k,ind]=sort(Y_test);

figure
plot(1:length(Y_test),pred(ind),'Color',[0.64,0.08,0.18])
hold on
plot(1:length(Y_test),k,'--','Color',[0.07,0.62,1.00])
xlabel('Test Data Samples');ylabel('$u(t)$','Interpreter','latex')
legend('Predicted value','Actual value')
hold off

if y<=2
figure
semilogy(0:length(E)-1,E,'Color',[0.64,0.08,0.18])
hold on
semilogy(find(E==Em)-1,Em,'.','Color',[0.07,0.62,1.00],'MarkerSize',16)
xlabel('Iteration');
ylabel('RMSE')
legend('$E_N$','$E_{N^*}$','Interpreter','latex')
hold off
end