function J = cost(theta, X, y, lambda)
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

[c, g] = costFunction(theta, X, y);
J = c + 0.05*(lambda/m)*theta'*theta;


% =============================================================

end
