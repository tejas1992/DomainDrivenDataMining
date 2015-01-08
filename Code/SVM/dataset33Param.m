function [C, sigma] = dataset33Param(X, y, Xval, yval)
% You need to return the following variables correctly.
C = 1;
sigma = 0.3;


Carr = [0.01, 0.03, 0.1, 0.3, 1, 3];
sigmaArr = [0.01, 0.03, 0.1, 0.3, 1, 3];

% bestC = 0;
% bestSigma = 0;





model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
predictions = svmPredict(model, Xval);
ind1 = find(predictions==1);
minErr = mean(double(predictions(ind1)~=yval(ind1)));

for c = 1:length(Carr)
    for s = 1:length(sigmaArr)
        model= svmTrain(X, y, Carr(c), @(x1, x2) gaussianKernel(x1, x2, sigmaArr(s)));
        predictions = svmPredict(model, Xval);
        err = mean(double(predictions(ind1)~=yval(ind1)));
        if(err<=minErr)
            C = Carr(c);
            sigma = sigmaArr(s);
            minErr = err;
        end;
    end;
end;





% =========================================================================

end