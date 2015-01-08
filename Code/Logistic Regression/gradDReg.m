function [theta, J_history] = gradDReg(X1, y1, theta, alpha, num_iters, lambda)

%y1 = y(1:300);
m = length(y1); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters
[cost, grad] = costFunctionReg(theta, X1, y1, lambda); %costFunctionReg
theta=theta-alpha*grad;
J_history(iter) = cost;

end

end