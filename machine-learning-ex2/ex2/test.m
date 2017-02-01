data = load('ex2data1.txt');
X = data(:, [1, 2]); y = data(:, 3);

[m,n] = size(X);

X = [ones(m,1), X];

init_theta = zeros(n+1,1);

[cost,grad] = costFunction(init_theta, X, y);

cost
grad

options = optimset('GradObj', 'on', 'MaxIter', 400);

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost 
[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X, y)), init_theta, options)

% e=exp(1);
% 1./((e.^-z) + ones(size(z)))
% g = zeros(size(z));
% e = exp(1);
% for i=1:length(z)
%     g(i) = 1/(1+e^-z(i));
% end
% 
% sum1 = -y.*log(g);
% one = ones(size(y));
% sum2 = (one-y).*log(one-g);
% J = sum(sum1-sum2)/m

