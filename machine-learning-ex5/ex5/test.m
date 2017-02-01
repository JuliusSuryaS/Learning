load ('ex5data1.mat');
m = size(X, 1);
X
X(1)^2
ANS = polyFeatures(X, 8);

X_poly = bsxfun(@power, X(), vector2);