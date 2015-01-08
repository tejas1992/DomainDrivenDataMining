function [J, grad] = costFunction(theta, X, y)

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad=zeros(size(theta));
J=(y'*log(sigmoid(X*theta))+(-y.+1)'*log(-sigmoid(X*theta).+1))*(-1/m);

H_theta = sigmoid(X * theta);
grad = (1.0/m) .* X' * (H_theta - y);
% =============================================================

end
