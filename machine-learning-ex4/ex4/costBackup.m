function [J , grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%


X=[ones(m,1) X];        %initialize X_0 to all X
n=size(X,2);            %initalize n  for loop size of X (5000,401)
y_vec = zeros(num_labels,1);     %Initialize y as a vector (original y = 1, 2, ..,10)
                            %now [0 0 0 0 0 0 0 0 0 0] ->(10,1)
K_vec = zeros(num_labels,1);      %init vector for sum of zigma K
M_vec = zeros(m,1);                         %sum of zigma M

delta3 = zeros(num_labels,1);
delta2 = zeros(hidden_layer_size,1);

Delta1 = zeros(size(Theta1));
Delta2 = zeros(size(Theta2));
                
                            
%Perform Loop
for i = 1:m
                                        
    temp_X = (X(i,:))';             %Take first m, n as input node Transpose it
    a_2 = zeros(hidden_layer_size,1);               % a_2 = number of node in layer 2, a_1 = temp_X (input node)
    a_2 = Theta1 * temp_X;              %Theta1 (25,401) * temp_X(401,1) = a_2(25,1)
    a_2 = [1;a_2];                      % Add a_2_0 -> (26,1)
    z_2 = a_2;
    a_2 = sigmoid(z_2);                 % Sigmoid

    a_3 = zeros(num_labels,1);              %Number of node in layer 3
    a_3 = Theta2 * a_2;             %Theta2 (10,26) * a_2(26,1) = a_3 (10,1)
    z_3 = a_3;
    a_3 = sigmoid(z_3);             %Thus H(x) = a_3

    y_vec = zeros(num_labels,1);            %Set y_vec to 0 for every loop
    
    %Assign y to vector(10,1)
    if(y(i)==0)                     %If y(i) = 0, means y(i)=10
        y(i)=10;
    end
    y_vec(y(i)) = 1;                %y_vec(1) = 1, y_vec(2) = 1 ... for binary value
                                    % [1 0 0 ..0], [0 1 0 ...0], etc.
                
                                    
    %Sum Cost for K  H(X)= a_3   
    K_vec = -y_vec .* log(a_3) - (1-y_vec) .* log(1-a_3);

    %Put sum of K_vec to M_vec(i)
    M_vec(i) = sum(K_vec);
    
    %-------------------------------------------------------
    
    % Backprop
    
    
    delta3 = a_3 - y_vec;
    delta2 = Theta2' * delta3 .* sigmoidGradient(z_2); 
    
    %Accumulate
    Delta1 = Delta1 + delta2(2:end) * (temp_X)';
    Delta2 = Delta2 + delta3 * (a_2)';
    
    
    
end

%Cost Function J
J = (1/m) * sum(M_vec);

% Reshape Delta to  Theta1_grad and Theta2_grad Size
Theta1_grad = (1/m) * Delta1;
Theta2_grad = (1/m) * Delta2;



%Regularization

vec_reg1 = zeros(25,1);     %size of vector for Theta1
vec_reg2 = zeros(10,1);     %               for Theta2

for i = 1 : hidden_layer_size                                   % 1:25

    vec_reg1(i) = sum((Theta1(i,2:input_layer_size+1)).^2);       % Theta1(i,2:401).^2  Theta1 = 25x401
                                                                % P.S. 2:401 because Theta_0 not count
    
end

for i =  1 : num_labels                                         % 1:10
        vec_reg2(i) = sum((Theta2(i,2:hidden_layer_size+1)).^2);    % Theta2(i,2:26).^2  Theta2 = 10x26
   
end

% Cost Function with Regularization
J = (1/m) * sum(M_vec) + (lambda/(2*m)) * (sum(vec_reg1) + sum(vec_reg2));



% Grad with Regularization
% Do not Regularize the i,j where j=0
Theta1_grad = [Theta1_grad(:,1), (Theta1_grad(:,2:end) + (lambda/m) * Theta1(:,2:end))];
Theta2_grad = [Theta2_grad(:,1), (Theta2_grad(:,2:end) + (lambda/m) * Theta2(:,2:end))];









% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
