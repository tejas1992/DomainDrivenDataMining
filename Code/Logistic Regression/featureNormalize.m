function [X_norm, mu, sigma] = featureNormalize(X)

%   the mean value of each feature is 0 and the standard deviation
%   is 1. 

mu = mean(X);
X_norm = bsxfun(@minus, X, mu);

sigma = std(X_norm);
X_norm = bsxfun(@rdivide, X_norm, sigma);


% ============================================================

end