function g = sigmoid(z)
%SIGMOID Compute sigmoid functoon
%   J = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).
e = exp(1);

g = 1./((e.^-z) + ones(size(z)));

% for i=1:length(z)
%     g(i) = 1/(1+e^-z(i));
% end



% =============================================================

end
