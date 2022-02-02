function net = FF(X_train,Y_train)
% A Feedforward neural network

hiddenSizes = 10;
net = feedforwardnet(hiddenSizes);
net.trainParam.showWindow = false;
net = train(net,X_train',Y_train');