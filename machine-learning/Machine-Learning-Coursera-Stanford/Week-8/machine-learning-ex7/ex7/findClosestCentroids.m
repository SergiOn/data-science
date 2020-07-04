function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

m = size(X, 1);

% https://www.mathworks.com/help/matlab/ref/norm.html

% for i = 1:m
%     X_item = X(i, :);
%     minusCols = centroids - X_item;
%     powerCols = minusCols.^2;
%     sumCols = sum((powerCols), 2);
%     root = nthroot(sumCols, 2);
%     [minValue, closestIndex] = min(root);
%     idx(i) = closestIndex;
% end

for i = 1:m

    compare = zeros(K, 1);
    X_item = X(i, :);

    for j = 1:K
        centroids_item = centroids(j, :);
        normalized = norm(X_item - centroids_item);
        compare(j) = normalized.^2;
    end
    
    [minValue, closestIndex] = min(compare);
    idx(i) = closestIndex;
end



% =============================================================

end

