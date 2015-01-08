function [lambda_vec, error_train, error_val] = validationCurve(X, y, Xval, yval)

lambda_vec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10 30 100 300]';
[m, n] = size(X);
initial_theta = zeros(n, 1);
error_train = zeros(length(lambda_vec), 1);
error_val = zeros(length(lambda_vec), 1);

%%
%       for i = 1:length(lambda_vec)
%           lambda = lambda_vec(i);
%           % Compute train / val errors when training linear 
%           % regression with regularization parameter lambda
%           % You should store the result in error_train(i)
%           % and error_val(i)
%           ....
%           
%       end
%
%
alpha = 0.03;
num_iters = 500;
for i = 1:length(lambda_vec)
lambda = lambda_vec(i);

[theta, J_history] = gradDReg(X, y,initial_theta, alpha, num_iters, lambda);

error_train(i) = cost(theta, X, y, 0);
error_val(i) = cost(theta, Xval, yval, 0); 

%As lambda=0 for train&CV error
end

% =========================================================================

end