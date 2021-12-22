function EE=error_pred(XX,YY,X,Y)

R=(XX-YY)./YY; Z=length(R);
[row,col]=find(isnan(R)); R(row,col)=0;
[row,col]=find(isinf(R)); R(row,col)=0;

yh=mean(XX); % test
SStot=sum((XX-yh).^2);
SSres=sum((XX-YY).^2);
R2t=1-SSres/SStot;
fprintf('The train data R-squared is: %f \n',R2t)

Et1=100/Z*sum(abs(R)); % MAPE
fprintf('The train data MAPE is: %f \n',Et1)

R=XX-YY;
Et2=sum(abs(R))/Z; % MAE
fprintf('The train data MAE is: %f \n',Et2)

Et3=sqrt(sum(R.^2)/Z); % RMSE
fprintf('The train data RMSE is: %f \n',Et3)


R=(X-Y)./Y; Z=length(R);
[row,col]=find(isnan(R)); R(row,col)=0;
[row,col]=find(isinf(R)); R(row,col)=0;

yh=mean(X); % test
SStot=sum((X-yh).^2);
SSres=sum((X-Y).^2);
R2=1-SSres/SStot;
fprintf('The test data R-squared is: %f \n',R2)

E1=100/Z*sum(abs(R)); % MAPE
fprintf('The test data MAPE is: %f \n',E1)

R=X-Y;
E2=sum(abs(R))/Z; % MAE
fprintf('The test data MAE is: %f \n',E2)

E3=sqrt(sum(R.^2)/Z); % RMSE
fprintf('The test data RMSE is: %f \n',E3)

EE=[R2t,Et1,Et2,Et3;R2,E1,E2,E3];