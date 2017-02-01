function A = warmUpExercise()
%WARMUPEXERCISE Example function in octave
%   A = WARMUPEXERCISE() is an example function that returns the 5x5 identity matrix

A = [];
% ============= YOUR CODE HERE ==============
% Instructions: Return the 5x5 identity matrix 
%               In octave, we return values by defining which variables
%               represent the return values (at the top of the file)
%               and then set them accordingly. 

A = eye(5);


% Some gradient descent settings

% ===========================================

%H = X * theta;
%r = (H-y).^2;



% H = X * theta;
% r = (H-y).^2;
% sum_r_0 = ones(1,m) * r;
% sum_r_1 = transpose(X(:,2)) * r;
% 
% theta(1) = theta(1) - alpha * (1/m) * sum_r_0;
% theta(2) = theta(2) - alpha * (1/m) * sum_r_1;
% 
% theta


end
