load('ex8data1.mat');
[mu sigma2] = estimateGaussian(X);
p = multivariateGaussian(X, mu, sigma2);

p(1:10)

pval = multivariateGaussian(Xval, mu, sigma2);

eps = 0.02;

p_new = pval<0.02;

tp = sum((p_new == 1) & yval==1)
fp = sum((p_new == 1) & yval==0)
fn = sum((p_new == 0) & yval==1)

prec = tp / (tp+fp)
rec = tp/ (tp + fn)

F1 = (2*prec*prec) / (prec+rec) 