function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
% J = 0;
% grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

coef = 1 / (2 * m);
h0x = X * theta;

calc_cost = h0x - y;
calc_cost_sum = sum(calc_cost.^2);

calc_reg = theta(2:end, :);
calc_reg_sum = sum(calc_reg.^2);

J = coef * calc_cost_sum + lambda * coef * calc_reg_sum;


coef_grad = 1 / m;
theta_temp = [zeros(size(theta(1, :), 1), 1); theta(2:end, :)];

grad = (coef_grad * X' * calc_cost) + (lambda * coef_grad * theta_temp);

% =========================================================================

grad = grad(:);

end
