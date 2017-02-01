load ('ex7data1.mat');


[X_norm, mu, sigma] = featureNormalize(X);

figure;
plot(X_norm(:,1), X_norm(:,2), 'ro');
hold on;
[U,S]=pca(X_norm);

K=1;
Z = projectData(X_norm,U,K);
X_rec = recoverData(Z,U,K);
plot(X_rec(:,1),X_rec(:,2),'x');
for i = 1:50
    plot([X_rec(i,1) X_norm(i,1)], [X_rec(i,2) X_norm(i,2)], '--k')
end