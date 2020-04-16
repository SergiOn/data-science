function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
% J = 0;
% grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

coef = 1 / m;
h0X = sigmoid(X * theta);

calcCost = -y .* log(h0X) - (1 - y) .* log(1 - h0X);
J = coef * sum(calcCost) + (lambda / (2 * m)) * sum(power(theta(2:end, :), 2));

calcGrad = X' * (h0X - y);
gradTemp = (coef * calcGrad);
grad = [
    gradTemp(1, :);
    gradTemp(2:end, :) + (lambda / m) * theta(2:end, :)
];

% =============================================================

end
