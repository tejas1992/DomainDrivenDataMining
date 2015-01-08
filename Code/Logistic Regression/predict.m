function p = predict(theta, X)

m = size(X, 1); % Number of training examples

p = zeros(m, 1);

p = sigmoid(X * theta);

idx_1 = find(p >= 0.5);
idx_0 = find(p < 0.5);

p(idx_1) = ones(size(idx_1));
p(idx_0) = zeros(size(idx_0));






% =========================================================================


end
