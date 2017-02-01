load('ex4data1.mat');
m = size(X,1);
X=[ones(m,1) X];
n=size(X,2);
temp_X = X(1,:);

V=[1:10]';
sigmoid(V);

y = [2 2 2 2 2 2 2 2 2 2]';

mean(V==y) * 100