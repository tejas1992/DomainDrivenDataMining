function [nn_params, J_history] = gradientDescent(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, alpha, num_iters)
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

 [cost, grad] =nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, 0.5);
	nn_params = nn_params - alpha*grad;
 	J_history(iter) = cost;
end

end



