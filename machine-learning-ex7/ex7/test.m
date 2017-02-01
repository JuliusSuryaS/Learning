% load('ex7data2.mat');
% 
% % Select an initial set of centroids
% K = 3; % 3 Centroids
% initial_centroids = [3 3; 6 2; 8 5];
% 
% 
% 
% 
% scatter(X(:,1),X(:,2),15);
% hold on;
% p1 = [5,3; 2 6];
% plot(p1(:,1),p1(:,2),'kx','MarkerSize',10, 'LineWidth',5);
% p2 = [2,1; 4 3];
% plot(p2(:,1),p2(:,2),'kx','MarkerSize',10, 'LineWidth',5);
% plot([p1(1,1) p2(1,1)],[p1(1,2) p2(1,2)])
% plot([p1(2,1) p2(2,1)],[p1(2,2) p2(2,2)])
% V=[1 2; 5 6; 1 3; 4 2; 8 4; 3 7; 6 3;];
cent = zeros(1,5);
V=[10:20]
randidx = randperm(size(V,2))

cent = V(:,randidx(1:5))
