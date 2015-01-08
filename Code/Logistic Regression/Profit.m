function P = Profit(Xtest, ytest, Probsorted, IX, p)
% Number of training examples
[m, n] = size(Xtest);
Profit = zeros(750,1);
TP = 0;
FP = 0;
K = 0;
for i = 1:m
K = K+1;
TP = 0;
FP = 0;
X_sub = Probsorted(1:i, :);
y_sub = IX(1:i); 

for i = 1:size(X_sub)

if(ytest(IX(i))==1 && p(IX(i))==1)
TP++;
end

if(ytest(i)==0 && p(i)==1)
FP++;
end

P(K) = 10*TP - FP*5;
end
end