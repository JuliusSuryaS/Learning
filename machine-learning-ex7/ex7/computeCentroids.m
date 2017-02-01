function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returs the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%
for i = 1 : K
    K =i
    [row,col] = find(idx == i);      % i.e. Find row number of idx where idx = 1
    total = size(row,1)             % Find how many  total row where idx = 1
    
    sum_of_X = sum(X(row,:))              % Total of X that is idx = 1 P.S. if x1[1,2] x2[1,3] sum = [2,5]
    
    centroids(i,:) = (1/total) * sum_of_X;
    
end







% =============================================================


end

