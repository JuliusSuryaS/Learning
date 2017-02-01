function centroids = kMeansInitCentroids(X, K)
%KMEANSINITCENTROIDS This function initializes K centroids that are to be 
%used in K-Means on the dataset X
%   centroids = KMEANSINITCENTROIDS(X, K) returns K initial centroids to be
%   used with the K-Means on the dataset X
%

% You should return this values correctly
centroids = zeros(K, size(X, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should set centroids to randomly chosen examples from
%               the dataset X
%

randidx = randperm(size(X,1));  % Create random permutation with size of X
                                % This results in random number from 1 to
                                % size of X

centroids =  X(randidx(1:K),:); % Store the random value to centroids
                                % Generate X values based on randidx 
                                % based on the row numbers from (randidx)


% i.e.
% V = [1; 17; 20; 4; 30; 25; 15; 8; 11; 9;]
% randperm will result in vector size [10]
% with number random from size of vector if size 10 
% then the random number will be [1-10] in random order
%
% Use this vector as index for calling random value of V
% X(randidx(1:5)) -> will generate X value in random order 
% based on the randidx
%
% If forget then Try !


% =============================================================

end

