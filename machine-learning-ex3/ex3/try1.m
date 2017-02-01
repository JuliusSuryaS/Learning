% M = [1 2 3 4 5; 6 7 8 9 10; 11 12 13 14 15; 16 17 18 19 20
%     ; 21 22 23 24 25; 26 27 28 29 30; 31 32 33 34 35; 36 37 38 39 40];
% m = size(M,1);
% rand_indices = randperm(m);
% sel = M(rand_indices(1:5),:);

 load('ex3data1.mat');
% c = zeros(20);
% a = X(2000,:);

% V = [a(1:20); a(21:40); a(41:60); a(61:80); a(81:100); 
%     a(101:120); a(121:140); a(141:160); a(161:180); a(181:200);];
% V = ones(20);
% m = 0 ; n = 0;
% for i = 1:20
%     m = n + 1;
%     n = m + 19;
%     V(i,:) = [a(m:n)];
% end
% imshow(V')
% 
% m = 0; n = 0;
% for i = 1: 20
%     m = n +1;
%     n = m + 19;
%     for j = 1: 20
%         a(1,m:n);
%     end
% end
% size(c);
% m = size(X, 1);
% n = size(X, 2);
% 
% % You need to return the following variables correctly 
% all_theta = zeros(10, n + 1);
% 
% % Add ones to the X data matrix
% X = [ones(m, 1) X];
% 
% a = 1:10;
% for i =1:10
%     v = (a == i)
% end

% x = zeros(3,1);
% 
% M = [1 2 3; 
%     4 7 6; 
%     20 8 9;
%     10 8 20]
% [mx,I] = max(M,[],2);
% mx
% I



load('ex3weights.mat');
m = size(X, 1);
X = [ones(m, 1) X];
a_2 = sigmoid(Theta1 * X');
a_2 = [ones(m,1) a_2];


a_3 = sigmoid(a_2 * Theta2');
[M,I] = max(a_3,[],2);
p = I;
