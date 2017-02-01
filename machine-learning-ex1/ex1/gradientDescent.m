function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %


    
    sum_vec_r = zeros(2,1);
    
    H = X * theta;
    r = (H-y);
    sum_vec_r(1) = transpose(X(:,1)) * r; %first feature X_0
    sum_vec_r(2) = transpose(X(:,2)) * r; %      feature X_1
    
    %transpose X_0 and X_1 * r => automatically produce sum of vector
    

    theta = theta - alpha * (1/m) * sum_vec_r; %compute all theta (theta_0 and theta_1)
    
    %theta(1) = theta(1) - alpha * (1/m) * sum_r_0;
    %theta(2) = theta(2) - alpha * (1/m) * sum_r_1;
    
    
    

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);
    

end
    
end
