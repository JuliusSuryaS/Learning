function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


z = X*theta;
H = sigmoid(z);
one = ones(size(y));
r = (-y.*log(H))-((one-y).*log(one-H));
sum_theta = sum(theta.^2);

J = sum(r)/m  + (lambda/(2*m)) * sum_theta;


grad_H = ones(size(theta));
grad_r = H-y;

%theta 0 in matlab theta 1 should not be regularized
for i=1:size(X,2)
    if i == 1
        grad_H(i) = sum(grad_r.*X(:,i))/m;
    end
    if i >= 2
        grad_H(i) = sum(grad_r.*X(:,i))/m + theta(i)*lambda/m;
    end
end

grad = grad_H;



% =============================================================

end
