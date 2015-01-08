function [C, sigma] = dataset3Params(X, y, Xval, yval)

C = 1;
sigma = 0.3;

Carr = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigmaArr = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

% bestC = 0;
% bestSigma = 0;

model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
predictions = svmPredict(model, Xval);
minErr = mean(double(predictions~=yval));

for c = 1:length(Carr)
    for s = 1:length(sigmaArr)
        model= svmTrain(X, y, Carr(c), @(x1, x2) gaussianKernel(x1, x2, sigmaArr(s)));
        predictions = svmPredict(model, Xval);
        err = mean(double(predictions~=yval));
        if(err<=minErr)
            C = Carr(c);
            sigma = sigmaArr(s);
            minErr = err;
        end;
    end;
end;





% =========================================================================

end