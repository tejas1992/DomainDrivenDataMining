function [J, grad] = costFunctionReg(theta, X, y, lambda)

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));


[c, g] = costFunction(theta, X, y);
J = c + 0.05*(lambda/m)*theta'*theta;
H_theta = sigmoid(X * theta);
grad(2:end) = g(2:end) + (lambda/m).*theta(2:end);



% =============================================================

end
