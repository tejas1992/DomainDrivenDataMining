function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end),num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
regulator =0;
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

%Forward Propogation
a1 = [ones(m, 1) X]; % add 1
z2 = a1 * Theta1';
a2 = [ones(size(sigmoid(z2), 1), 1) sigmoid(z2)]; % add 1
z3 = a2 * Theta2';
a3 = sigmoid(z3); % H_theta(x);

regularator = (sum(sum(Theta1(:,2:end).^2)) + sum(sum(Theta2(:,2:end).^2))) * (lambda/(2*m));


J = (-1/m)*(sum(y.*log(a3)+(1-y).*log(1-a3))) + regulator;

%backpropogation for finding gradients

for t = 1:m
	% For the input layer, where l=1:
	a1 = [1; X(t,:)'];

	% For the hidden layers, where l=2:
	z2 = Theta1 * a1;
	a2 = [1; sigmoid(z2)];

	z3 = Theta2 * a2;
	a3 = sigmoid(z3);

	yy = y(t);
	% For the delta values:
	delta_3 = a3 - yy;

	delta_2 = (Theta2' * delta_3) .* [1; sigmoidGradient(z2)];
	delta_2 = delta_2(2:end); % Taking off the bias

	% Big delta update
	Theta1_grad = Theta1_grad + delta_2 * a1';
	Theta2_grad = Theta2_grad + delta_3 * a2';
end

Theta1_grad = (1/m) * Theta1_grad + (lambda/m) * [zeros(size(Theta1, 1), 1) Theta1(:,2:end)];
Theta2_grad = (1/m) * Theta2_grad + (lambda/m) * [zeros(size(Theta2, 1), 1) Theta2(:,2:end)];

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];

end







