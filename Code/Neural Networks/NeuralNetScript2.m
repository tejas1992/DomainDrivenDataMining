




































 input_layer_size = 16;
 hidden_layer_size = 16;
 num_labels = 1;

>>
>> %Loading Training Data
>> fprintf('Loading Data ...\n');
Loading Data ...
>>
>> data = load('bankhalf.txt');
>> X = data([1:2000], [1:16]);
>> y = data([1:2000], 17);
>>
>> [m n] = size(X)
m =  2000
n =  16
>>
>> fprintf('Program paused. Press enter to continue.\n');
Program paused. Press enter to continue.
>> pause;

>> %Random Initialization of Weights
>>
>> fprintf('Initializing Parameters.....');
Initializing Parameters.....>>
<tializeWeights(input_layer_size, hidden_layer_size);
<tializeWeights(hidden_layer_size, hidden_layer_size);
>> initial_Theta3 = randInitializeWeights(hidden_layer_size, num_labels);
>>
>>
>> % Unroll parameters
<tial_Theta1(:) ; initial_Theta2(:); initial_Theta3(:)];
>>
>> %applying gradientDescent
>> alpha = 0.01;
>> iterations = 500;
<den_layer_size, num_labels, X, y, alpha, iterations);
>>

Xtest = data([3001:3750], [1:16]);
ytest = data([3001:3750], 17);

a3 = predict2(theta, input_layer_size, hidden_layer_size, num_labels, Xtest, ytest, 0);


tp =0;
fp=0;
fn=0;

%finding true positives
for i = 1:size(a3)
if(ytest(i)==1 && a3(i)==1)
tp++;
end
end

%finding false positives
for i = 1:size(a3)
if(ytest(i)==0 && a3(i)==1)
fp++;
end
end

%finding false negatives
for i = 1:size(a3)
if(ytest(i)==1 && a3(i)==0)
fn++;
end
end

