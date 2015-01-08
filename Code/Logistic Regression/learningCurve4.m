function [error_train, error_val] = learningCurve4(X1, y1, X2, y2, lambda)
% Number of training examples
[m, n] = size(X1);
error_train = zeros(m, 1);
error_val   = zeros(m, 1);
initial_theta = zeros(n,1);
options = optimset('GradObj', 'on', 'MaxIter', 1400);
j=0;
for i = 1:m
j=j+1;
X_sub = X1(1:i, :);
y_sub = y1(1:i); 

[t, c] = fminunc(@(t)(costFunction(t, X_sub, y_sub)), initial_theta, options);
error_train(j) = cost(t, X_sub, y_sub, lambda);
error_val(j) = cost(t, X2, y2, lambda);

end

end

