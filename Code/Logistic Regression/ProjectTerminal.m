octave-3.4.0:1> pwd
ans = /Users/Admin
 cd /Users/Admin/Desktop/Octstuff/mlclass-ex2
 data = load('bankhalf.txt');
cd /Users/Admin/Desktop/Octstuff/mlclass-02
X = data(:, [1:16]);
y = data(:, 17);
[X_norm, mu, sigma] = featureNormalize(X);
X_norm = [ones(4521,1), X_norm];
[m, n] = size(X_norm);
n
n =  17
initial_theta = zeros(n , 1);
m
m =  4521
X1 = X_norm(1:2000, :);
size(X1);
size(X1)
y1 = y(1:2000,:);
y1
y1 =

   0
   0
   0
   0
   0
   0
   0
   0
   0
   0
   0
   0
   0
   1
   0
   0
   0
   0
   0
   0
   0

 Xcv = X_norm(2001:3000, :);
ycv = y(2001:3000, :);

Xtest = X_norm(3001:3750,:);

ytest = y(3001:3750, :);
size(ytest)

[theta, J_history] = gradDReg(X1, y1, initial_theta, 0.3, 1500, 0);
plot([1:1500], J_history)
[theta, J_history] = gradDReg(X1, y1, initial_theta, 0.3, 1500, 0);
 [theta, J_history] = gradDReg(X1, y1, initial_theta, 0.01, 1500, 0);
plot([1:1500], J_history);
[theta, J_history] = gradDReg(X1, y1, initial_theta, 0.005, 1500, 0);
plot([1:1500], J_history);
[theta, J_history] = gradDReg(X1, y1, initial_theta, 1, 1500, 0);
plot([1:1500], J_history);
[theta, J_history] = gradDReg(X1, y1, initial_theta, 3, 1500, 0);
 gradDReg(X1, y1, initial_theta, 3, 1500, 0);
plot([1:1500], J_history);
 [theta, J_history] = gradDReg(X1, y1, initial_theta, 5, 1500, 0);
octave-3.4.0:42> plot([1:1500], J_history);octave-3.4.0:43> [theta, J_history] = gradDReg(X1, y1, initial_theta, 0.03, 1500, 0);
octave-3.4.0:44> plot([1:1500], J_history);octave-3.4.0:45> [theta, J_history] = gradDReg(X1, y1, initial_theta, 0.03, 500, 0);
[error_train, error_val] = learningCurve2(X1, y1, Xcv, ycv, 0); 
 
plot([1:2000], error_train);
hold on;
plot([1:2000], error_val);
hold off;
[l, t, v] = validationCurve(X1, y1, Xcv, ycv);
plot(l, t);
hold on
plot(l, v);
hold off
[l, t, v] = validationCurve(X1, y1, Xcv, ycv);
plot(l, t);
 hold on
 plot(l, v);
 hold off
plot(l, t);
hold off
p = predict(theta, Xt);
 p = predict(theta, Xtest);
 p
p =

   0
   0
   1
   1
   0
   1
   1
   1
   1
   0
   0
   1
   0
   0
   0
   0
   0
   0
   0
   0
   0
tp =0; fp=0; fn=0;
for i = 1:size(p)
if(ytest(i)==1 && p(i)==1)
tp++;
 end
end
 tp
tp =  73
for i = 1:size(p)
if(ytest(i)==1 && p(i)==0)
fn++;
end
end
fn
fn =  5
octave-3.4.0:72> for i = 1:size(p)
> if(ytest(i)==0 && p(i)==1)
> fp++;
> end
> end
octave-3.4.0:73> fp
fp =  203
octave-3.4.0:74> p = predict(theta, Xtest);
octave-3.4.0:75> for i = 1:size(p)
> if(ytest(i)==1 && p(i)==1)
> tp++;
> end
> end
octave-3.4.0:76> tp = 0; fp = 0; fn = 0;
octave-3.4.0:77> for i = 1:size(pred)
if(ytest(i)==1 && pred(i)==1)
tp++;
end
end
octave-3.4.0:78> tp
tp =  37
octave-3.4.0:79> for i = 1:size(pred)
if(ytest(i)==1 && pred(i)==0)
fn++;
end
end
octave-3.4.0:80> fn
fn =  41
octave-3.4.0:81> for i = 1:size(pred)
if(ytest(i)==0 && pred(i)==1)
fp++;
end
end
octave-3.4.0:82> 
octave-3.4.0:82> fp
fp =  28

for i =1:size(ytest)
if(ytest(i)==1)
un++;
end
end
Xtestsorted = [Xtest, ytest];
octave-3.4.0:87> psorted = p;
octave-3.4.0:88> find(psorted>=0.5)
ans =

     6
    28
    34
    40
    63
    75
    77
    89
    92
    95
   124
   142
   153
   158
   161
   172
   177
   203
   206
   211
   225
octave-3.4.0:89> indp = find(psorted>= 0.5)
indp =

     6
    28
    34
    40
    63
    75
    77
    89
    92
    95
   124
   142
   153
   158
   161
   172
   177
   203
   206
   211
   225
octave-3.4.0:90> indp p
parse error:

  syntax error

>>> indp p
         ^

octave-3.4.0:90> p
p =

   0
   0
   0
   0
   0
   1
   0
   0
   0
   0
   0
   0
   0
   0
   0
   0
   0
   0
   0
   0
   0
p = predict(theta, Xtest);
p
p =

   0
   0
   1
   1
   0
   1
   1
   1
   1
   0
   0
   1
   0
   0
   0
   0
   0
   0
   0
   0
   0
Prob = sigmoid(Xtest*theta);
prob
 Prob
Prob =

   0.36704
   0.48408
   0.57354
   0.55042
   0.48774
   0.72071
   0.61778
   0.54061
   0.62497
   0.36255
   0.37333
   0.54307
   0.43357
   0.40684
   0.38928
   0.46199
   0.39748
   0.47631
   0.42632
   0.33525
   0.43779

 [Probsorted, IX] = sort(Prob, 'descend');
 Probsorted
Probsorted =

   0.99666
   0.96148
   0.95780
   0.95018
   0.93961
   0.92726
   0.92526
   0.92387
   0.91922
   0.90869
   0.90472
   0.88600
   0.88451
   0.86807
   0.86492
   0.86421
   0.86355
   0.85680
   0.84035
   0.83914
   0.83334
octave-3.4.0:97> IX
IX =

   674
   645
   142
   731
   735
   454
   643
    92
   334
   615
   153
   158
   432
   306
   361
   685
   464
   380
   499
   557
   305
octave-3.4.0:98> ytest(674)
ans =  1
octave-3.4.0:99> ytest(92)
ans = 0
octave-3.4.0:100> p(92)
ans =  1
octave-3.4.0:101> p
p =

   0
   0
   1
   1
   0
   1
   1
   1
   1
   0
   0
   1
   0
   0
   0
   0
   0
   0
   0
   0
   0
C_TP = lift(Xtest, ytest, Probsorted, IX);
C_TP = lift(Xtest, ytest, Probsorted, IX, p);
C_TP
C_TP =

    1
    1
    2
    3
    4
    4
    5
    5
    6
    6
    6
    6
    7
    8
    9
   10
   10
   10
   11
   12
   13
octave-3.4.0:104> size(C_TP)
ans =

   750     1

plot([1:750], C_TP);
hold on

 plot([1:73], [1:73]);
 hold off;
P = Profit(Xtest, ytest, Probsorted, IX, p);
 P
P =

 Columns 1 through 11:

     44     44     87    130    174    174    218    217    260    260    260

 Columns 12 through 22:

    259    303    347    391    435    435    435    479    523    567    610

 Columns 23 through 33:

    653    652    696    695    694    738    738    782    826    869    913

 Columns 34 through 44:

    913    957    956   1000   1043   1043   1086   1086   1130   1174   1218

 Columns 45 through 55:

   1218   1218   1262   1262   1262   1261   1261   1305   1305   1305   1348

 Columns 56 through 66:
octave-3.4.0:111> size(P)
ans =

     1   750

 plot([1:750], P)
P = Profit(Xtest, ytest, Probsorted, IX, p);
plot([1:750], P)
P = Profit(Xtest, ytest, Probsorted, IX, p);
 plot([1:750], P)
max(P)
ans =  410
 find(P = 410)
ans =  1
octave-3.4.0:119> P
P =  410
octave-3.4.0:120> P = Profit(Xtest, ytest, Probsorted, IX, p);
octave-3.4.0:131> find(P==410)
ans =

   147   148

octave-3.4.0:132> 

octave-3.4.0:13> data = load('bankhalf.txt');
octave-3.4.0:14> X = data(:, [1:16]);
octave-3.4.0:15> y = data(:, 17);
octave-3.4.0:16> [X_norm, mu, sigma] = featureNormalize(X);
octave-3.4.0:17> X2 = X_norm.^2;
octave-3.4.0:18> X3 = X_norm.^3;
octave-3.4.0:19> X4 = X_norm.^4;
octave-3.4.0:20> X_norm = [ones(4521,1), X_norm]; %Appending ones
octave-3.4.0:21> X1 = [X_norm(1:2000, :), X2(1:2000, :), X3(1:2000, :), X4(1:2000, :);







octave-3.4.0:198> C = 0.1
C =  0.10000
octave-3.4.0:199> sigma = 3
sigma =  3
octave-3.4.0:200> model= svmTrain(training, trainy, C, @(x1, x2) gaussianKernel(x1, x2, sigma));

Training ......................................................................
..................................................... Done! 

octave-3.4.0:201> pred = svmPredict(model, Xtest);octave-3.4.0:202> for i = 1:size(pred)
if(ytest(i)==1 && pred(i)==1)
tp++;
end
end
octave-3.4.0:203> tp
tp =  94
octave-3.4.0:204> 94-40
ans =  54
octave-3.4.0:205> tp = 0
tp = 0
octave-3.4.0:206> for i = 1:size(pred)
if(ytest(i)==1 && pred(i)==1)
tp++;
end
end
octave-3.4.0:207> tp
tp =  54
octave-3.4.0:208> 
