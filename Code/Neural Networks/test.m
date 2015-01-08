function [J, a3]  = test(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda)

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end),num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
a1 = [ones(m, 1) X]; % add 1
z2 = a1 * Theta1';
a2 = [ones(size(sigmoid(z2), 1), 1) sigmoid(z2)]; % add 1
z3 = a2 * Theta2';

a3 = sigmoid(z3);
J = (-1/m)*(sum(y.*log(a3)+(-y.+1).*log(1-a3)));
end
