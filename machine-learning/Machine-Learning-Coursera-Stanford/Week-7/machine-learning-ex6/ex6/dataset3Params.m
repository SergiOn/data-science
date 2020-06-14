function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
% C = 1;
% sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

values = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];

s = size(values);
rows = s(1);
cols = s(2) + 2;
results = zeros(rows.^2, cols);

for i = 1:rows % C
    for j = 1:rows % sigma

        C_temp = values(i);
        sigma_temp = values(j);
        index = (i - 1) * rows + j;
        
        model = svmTrain(X, y, C_temp, @(x1, x2) gaussianKernel(x1, x2, sigma_temp));
        predictions = svmPredict(model, Xval);
        prediction_error = mean(double(predictions ~= yval));

        results(index, :) = [C_temp sigma_temp prediction_error];
    end
end

% sort by 3rd column (prediction_error)
results_sorted = sortrows(results, 3);

C = results_sorted(1, 1);
sigma = results_sorted(1, 2);


% =========================================================================

end
