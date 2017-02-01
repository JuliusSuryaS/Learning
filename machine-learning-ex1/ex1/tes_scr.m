data = load('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);
format short

X(:,1);
X(:,2);

X_norm = X;

mu = ones(1,size(X,2));
sigma = ones(1, size(X,2));


mu(1) = mean(X(:,1));
mu(2) = mean(X(:,2));


sigma(1) = max(X(:,1)) - min(X(:,1));
sigma(2) = max(X(:,2)) - min(X(:,2));



(X(1,1) - mu(1))/sigma(1);

mu_ones = ones(m,1) * mu(1);
mu_twos = ones(m,1) * mu(2);

X_norm(:,1) = (X(:,1) - mu_ones)/sigma(1);
X_norm(:,2) = (X(:,2) - mu_twos)/sigma(2);

X_norm



X = [ones(m,1), X_norm];



sum_vec = zeros(3,1);
alpha = 0.03;
theta = zeros(size(X,2),1);

H = X * theta;
r = H - y;
sum_vec(1) = transpose(X(:,1)) * r; % first feature X_0
sum_vec(2) = transpose(X(:,2)) * r;
sum_vec(3) = transpose(X(:,3)) * r;
sum_vec;
theta = theta - alpha * (1/m) * sum_vec

fprintf(' %f \n', theta)

H = X * theta;
r = H-y;


J = 1/(2*m) * sum(r' * r)


