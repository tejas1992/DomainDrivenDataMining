
% Perform Feature Normalization first so features have mean 1 and standard deviation 1
[X_norm, mu, sigma] = featureNormalize(X);

Load data 
 X = data(:, [1:16]);
y = data(:, 17);

 Columns 1 through 10:

      87      11       3       3       1   71188       1       1       2      31

 Columns 11 through 16:

      12    3025      50     871      25       3

1. Feature Scaling:- 
 X_norm = [ones(4521,1), X_norm]; %Appending ones


%  Setup the data matrix appropriately, and add ones for the intercept term
[m, n] = size(X_norm);
% Initialize fitting parameters
initial_theta = zeros(n , 1);
% Compute and display initial cost and gradient for initialTheta(All zeros)
[cost, grad] = costFunction(initial_theta, X_norm, y);

X1 = X(1:300, :);

[cost, grad] = costFunction(initial_theta, X, y);

cost =  0.69315

// For Gradient Descent
y1 = y(1:300, 1);
alpha = 0.001
theta = initial_theta;
m = length(y1);
J_history = zeros(num_iters, 1);
for iter = 1:num_iters
[cost, grad] = costFunction(theta, X1, y1);
theta=theta-alpha*grad;
J_history(iter) = cost;

end



// Now plot Cost(J) with the number of iterations
iterations = [1:1500];
iterations = iterations(:);
plot(iterations, J_history);

 [theta, J_history] = gradDReg(X1, y1, initial_theta, 0.03, 1500, lambda);
octave-3.4.0:71> plot([1:1500], J_history);
%Alpha - 0.03 & Iterations-1500, cost converges, this is for training size 2000 tuples

/with Regularization
[J, grad] = costFunctionReg(theta, X1, y1, 1); where theta = initial_theta;
[theta, J_history]=gradDes(initial_theta, alpha, num_iters, X1, y1);
 plot(iterations, J_history);

//Defining a cross validation set 
X2 = X(301:400, :);
% Also defining y2
y2 = y(301:400);

% Now to plot learning curves
[error_train, error_val] = learningCurve2(X1, y1, X2, y2, lambda);

%^Computation may take time. Can take a LOT of time for large number of tuples. Just use fminunc to %avoid this.
iterations = [1:300];
iterations(:);
plot(iterations, error_train);
hold on;
 plot(iterations, error_val);
hold off;

%Plotting Lambda vs train&CV error, high bias regime obtained, just as in the previous plot of m Vs %train&Cv
%No curve obtained for errorCV; obtained kind of a straight line, which implies, algorithm will work best 
%without any regularization. That is lambda = 0; Logically correct as high bias scheme will have little %lambda

[lambda_vec, error_train, error_val] = validationCurve(X1, y1,X2,y2);
plot(lambda_vec, error_train);
hold on;
plot(lambda_vec, error_val);

%Select an appropriate model to achieve bias Vs Variance trade-off.



%Plot1: costVsIps.eps(Alpha = 0.03 num:iters = 1500)
%PLOT2: TrainErrVsItrr(Numiters:300, training size = 2000)
%PLOT3: ValErrVsm.eps
%PLOT4: Plot together /w hold on: Traincvvsm.eps: High Bias scenario.

%octave-3.4.0:51> %Find theta
octave-3.4.0:51> [t,j] = gradDReg(X1,y1,initial_theta, 0.03, 300, 0);
octave-3.4.0:52> p = predict(t,Xtest);
%Here p is the prediction vector for the test set. Threshold set = 0.5; Check for varying thresholds and choose threshold with the least error. Also find recall and precision.
Try to find some trade off.

Now find number of misclassifications with actual Ytest.




% TERMINAL CODE:
octave-3.4.0:31> [X_norm, mu, sigma] = featureNormalize(X);
octave-3.4.0:32> X_norm

octave-3.4.0:35> X_norm = [ones(4521, 1), X_norm];
octave-3.4.0:36> X_norm
X_norm =
octave-3.4.0:37> [m, n] = size(X);
octave-3.4.0:38> initial_theta = zeros(n , 1);
octave-3.4.0:39> [cost, grad] = costFunction(initial_theta, X_norm, y);
error: costFunction: operator *: nonconformant arguments (op1 is 4521x17, op2 is 16x1)
error: evaluating argument list element number 1
error: evaluating argument list element number 1
error: called from:
error:   /Users/Admin/Desktop/octstuff/mlclass-ex2/costFunction.m at line 21, column 2
octave-3.4.0:39> size(X_norm)
ans =

   4521     17

octave-3.4.0:40> n
n =  16
octave-3.4.0:41> [m, n] = size(X_norm);
octave-3.4.0:42> [cost, grad] = costFunction(initial_theta, X_norm, y);
error: costFunction: operator *: nonconformant arguments (op1 is 4521x17, op2 is 16x1)
error: evaluating argument list element number 1
error: evaluating argument list element number 1
error: called from:
error:   /Users/Admin/Desktop/octstuff/mlclass-ex2/costFunction.m at line 21, column 2
octave-3.4.0:42> n
n =  17
octave-3.4.0:43> initial_theta = zeros(n, 1);
octave-3.4.0:44> [cost, grad] = costFunction(initial_theta, X_norm, y);
octave-3.4.0:45> cost
cost =  0.69315
octave-3.4.0:47> X1 = X_norm(1:2000, :);
octave-3.4.0:48> y1 = y(1:2000, 1);
octave-3.4.0:49> size(y1)
ans =

   2000      1

octave-3.4.0:50> lambda = 0;
octave-3.4.0:51> num_iters = 400;octave-3.4.0:52> alpha = 0.001;
octave-3.4.0:53> [theta, J_history] = gradDReg(X1, y1, initial_theta, alpha, num_iters, lambda);
octave-3.4.0:55> iterations = [1:2000];
octave-3.4.0:56> iterations = iterations(:);
octave-3.4.0:57> plot(iterations, J_history];
parse error:

  syntax error

>>> plot(iterations, J_history];
                              ^

octave-3.4.0:57> plot(iterations, J_history);
error: __plt2vv__: vector lengths must match
error: called from:
error:   /Applications/Octave.app/Contents/Resources/share/octave/3.4.0/m/plot/private/__plt__.m at line 601, column 5
error:   /Applications/Octave.app/Contents/Resources/share/octave/3.4.0/m/plot/private/__plt__.m at line 238, column 14
error:   /Applications/Octave.app/Contents/Resources/share/octave/3.4.0/m/plot/private/__plt__.m at line 99, column 17
error:   /Applications/Octave.app/Contents/Resources/share/octave/3.4.0/m/plot/plot.m at line 194, column 9
octave-3.4.0:57> size(J_history);
octave-3.4.0:58> size(J_history)
ans =

   400     1

octave-3.4.0:59> iterations = iterations(1:400)
octave-3.4.0:60> plot(iterations, J_history);
octave-3.4.0:61> num_iters = 1000;
octave-3.4.0:62> [theta, J_history] = gradDReg(X1, y1, initial_theta, alpha, num_iters, lambda);
octave-3.4.0:63> iterations = [1:1000];
octave-3.4.0:64> iterations = iterations(:);
octave-3.4.0:65> plot(iterations, J_history);octave-3.4.0:66> [theta, J_history] = gradDReg(X1, y1, initial_theta, 0.01, num_iters, lambda);
octave-3.4.0:67> plot(iterations, J_history);octave-3.4.0:68> [theta, J_history] = gradDReg(X1, y1, initial_theta, 0.01, 1500, lambda);
octave-3.4.0:69> plot(iterations, J_history);error: __plt2vv__: vector lengths must match
error: called from:
error:   /Applications/Octave.app/Contents/Resources/share/octave/3.4.0/m/plot/private/__plt__.m at line 601, column 5
error:   /Applications/Octave.app/Contents/Resources/share/octave/3.4.0/m/plot/private/__plt__.m at line 238, column 14
error:   /Applications/Octave.app/Contents/Resources/share/octave/3.4.0/m/plot/private/__plt__.m at line 99, column 17
error:   /Applications/Octave.app/Contents/Resources/share/octave/3.4.0/m/plot/plot.m at line 194, column 9
octave-3.4.0:69> plot([1:1500], J_history);
octave-3.4.0:70> [theta, J_history] = gradDReg(X1, y1, initial_theta, 0.03, 1500, lambda);
octave-3.4.0:71> plot([1:1500], J_history);octave-3.4.0:72> print -deps CostVsIte.jpg
warning: print.m: ghostscript not found in PATH
warning: print.m: Ghostscript binary is not available
warning: print.m: epstool binary is not available
warning: print.m: fig2dev binary is not available
warning: print.m: pstoedit binary is not available
octave-3.4.0:73> print -deps CostVsIte.pdf
octave-3.4.0:74> print -deps CostVsIte.eps
octave-3.4.0:75> X2 = X_norm(2001:3000, :);
octave-3.4.0:76> y2 = y(2001:3000, :);
octave-3.4.0:77> [error_train, error_val] = learningCurve2(X1, y1, X2, y2, lambda);
1500 iterations taking a LOT of time. Try 300 iterations.
300 iterations took about 10 minutes. Shift to Normal equation or FMINUNC later.


FINAL ERROR: 

err =  0.30400
octave-3.4.0:63> p = predict(t,Xtest);
octave-3.4.0:64> err = mean(double(p~=ytest))
err =  0.090667
octave-3.4.0:65> p = predict(t,Xtest);
octave-3.4.0:66> err = mean(double(p~=ytest))
err =  0.093333
octave-3.4.0:67> p = predict(t,Xtest);
octave-3.4.0:68> err = mean(double(p~=ytest))
err =  0.097333
octave-3.4.0:69> p = predict(t,Xtest);
octave-3.4.0:70> err = mean(double(p~=ytest))
err =  0.12667
octave-3.4.0:71> p = predict(t,Xtest);
octave-3.4.0:72> err = mean(double(p~=ytest))
err =  0.092000
Error = No of misclassifications/Total Tuples



octave-3.4.0:97> for i = 1:size(p)
if(ytest(i)==1 && p(i)==1)
tp++;
end
end
octave-3.4.0:98> tp
tp =  48
octave-34.0:99> for i = 1:size(p)
if(ytest(i)==1 && p(i)==0)
fn++;
end
end
octave-3.4.0:100> fn
fn =  30

for i = 1:size(p)
if(ytest(i)==0 && p(i)==1)
fp++;
end
end
octave-3.4.0:103> fp
fp =  35



tp=25
fn=53
fp=16
Recall = 0.32
Precision = 0.60

For threshold = 0.6 
Precisioin - 0.42
Recall- 0.60

Threshold = 0.5
tp = 136
fn=6
fp=222
Precision = 38%
Recall = 96%
