PS1('>> ');
cd C:\Users\Tejas\Desktop\Project

%implementing Neural Networks on bank Dataset
clear; close all; clc
input_layer_size = 16;
hidden_layer_size = 32;
num_labels = 1;


%Loading Training Data
fprintf('Loading Data ...\n');

data = load('bankhalf.txt');
X = data([1:2000], [1:16]);
y = data([1:2000], 17);

[X_norm, mu, sigma] = featureNormalize(X);
y_train = y([1:2000], :);
idx1 = find(y_train == 1);
idx0 = find(y_train == 0);

y1 = y_train(idx1);
y0 = y_train(idx0);
y0 = y0([1:size(idx1)], :);
 
y_train = [y1; y0];

X1 = X_norm(idx1, :);
X0 = X_norm(idx0, :);
X0 = X0([1:size(idx1)], :);

X_train = [X1; X0];
idx = randperm(size(idx1)*2);

X_train = X_train(idx, :);
y_train = y_train(idx);

[m n] = size(X_train);

X_val = X_norm([2001:3000], :);
y_val = y([2001:3000]);


fprintf('Program paused. Press enter to continue.\n');
pause;

%Random Initialization of Weights

fprintf('Initializing Parameters.....');

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];


%[error_train, error_val] = learningCurve(initial_nn_params, input_layer_size, hidden_layer_size, num_labels, X_train, y_train, X_val, y_val);

%applying gradientDescent
alpha = 0.01;
iterations = 500;
[theta J_history] = gradientDescent(initial_nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, alpha, iterations);

Xcv = data([2001:3000], [1:16]);
ycv = data([2001:3000], 17);

Xtest = data([3001:3750], [1:16]);
ytest = data([3001:3750],17);

[a3 a4] = predict(theta, input_layer_size, hidden_layer_size, num_labels, Xtest, ytest, 0);


tp =0
fp=0;
fn=0;

%finding true positives
for i = 1:size(a3)
if(ytest(i)==1 && a4(i)==1)
tp++;
end
end

%finding false positives
for i = 1:size(a3)
if(ytest(i)==0 && a4(i)==1)
fp++;
end
end

%finding false negatives
for i = 1:size(a3)
if(ytest(i)==1 && a4(i)==0)
fn++;
end
end

[Probsorted, IX] = sort(a3, 'descend');
C_TP = lift(Xtest, ytest, Probsorted, IX, a4);

P = Profit(Xtest, ytest, Probsorted, IX, a4);