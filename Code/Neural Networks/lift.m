function C_TP = lift(Xtest, ytest, Probsorted, IX, p)
% Number of training examples
[m, n] = size(Xtest);
C_TP = zeros(750,1);
TP = 0;
K = 0;
for i = 1:m
K = K+1;
TP = 0;
X_sub = Probsorted(1:i, :);
y_sub = IX(1:i); 

for i = 1:size(X_sub)
if(ytest(IX(i))==1 && p(IX(i))==1)
TP++;
C_TP(K) = TP;




end

end
end