function [error_train, error_val] = learningCurve2(X1, y1, X2, y2, lambda)
% Number of training examples
[m, n] = size(X1);
error_train = zeros(m, 1);
error_val   = zeros(m, 1);
initial_theta = zeros(n,1);
alpha = 0.03;
num_iters = 500;
j=0;
for i = 1:m
j=j+1;
X_sub = X1(1:i, :);
y_sub = y1(1:i); 

[theta, J_history] = gradDReg(X_sub, y_sub, initial_theta, alpha, num_iters, lambda);

error_train(j) = cost(theta, X_sub, y_sub, lambda);
error_val(j) = cost(theta, X2, y2, lambda);

end

end