function [theta, J_history] = gradDes(theta, alpha, num_iters, X1, y1);

m = length(y1);
J_history = zeros(num_iters, 1);
for iter = 1:num_iters
[cost, grad] = costFunction(theta, X1, y1);
theta=theta-alpha*grad;
J_history(iter) = cost;
end
end