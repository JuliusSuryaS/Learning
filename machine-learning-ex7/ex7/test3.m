load ('ex7faces.mat');

displayData(X(1:12, :));

[X_norm, mu, sigma] = featureNormalize(X);

displayData(X_norm(1:100, :));

[U,S] = pca(X_norm);
figure;
displayData(U(:, 1:12)');


K=100;
Z = projectData(X_norm,U,K);
size(Z);
X_rec = recoverData(Z,U,K);
size(X_rec);
figure;
displayData(X_rec(1:100,:));
