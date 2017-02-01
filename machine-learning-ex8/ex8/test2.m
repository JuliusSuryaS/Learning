load ('ex8_movieParams.mat');

%  Reduce the data set size so that this runs faster
num_users = 4; num_movies = 5; num_features = 3;
X = X(1:num_movies, 1:num_features);
Theta = Theta(1:num_users, 1:num_features);
Y = Y(1:num_movies, 1:num_users);
R = R(1:num_movies, 1:num_users);
X_grad = zeros(size(X));

lambda = 1.5;
for i  = 1 : size(Y,1)
   idx = find(R(i,:)==1);
   Ttemp = Theta(idx,:);
   Ytemp = Y(i,idx);
   
   total = ((X(i,:) * Ttemp') - Ytemp) * Ttemp + lambda * X(i,:);
   X_grad(i,:)=total;
   
   
end

Xgrad = (((X * Theta') -Y).*R) * Theta + lambda * X


Tgrad = (((X * Theta') -Y).*R)' * X;

for i = 1 : size(Y,2)
   idx = find(R(:,i)==1);
   Xtemp= X(idx,:);
   Ytemp = Y(idx,i);
   
  total = ((Theta(i,:) * Xtemp') - Ytemp') * Xtemp;
   T_grad(i,:)=total;
end
T = Tgrad(:);
reshape(T,4,3);


Theta
sum(sum(Theta'))