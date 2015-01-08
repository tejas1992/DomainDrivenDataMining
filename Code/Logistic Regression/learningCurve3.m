function [error_train, error_val] = learningCurve3(X1, y1, X2, y2, lambda)
% Number of training examples
[m, n] = size(X1);
error_train = zeros(m, 1);
error_val   = zeros(m, 1);

j=0;
for i = 1:m
j=j+1;
X_sub = X1(1:i, :);
y_sub = y1(1:i); 

theta = pinv(X_sub' * X_sub) * X_sub' * y_sub;
error_train(j) = cost(theta, X_sub, y_sub, lambda);
error_val(j) = cost(theta, X2, y2, lambda);

end

end