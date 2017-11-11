function y = knn_hack(X, X_train, y_train, K)
%KNN k-Nearest Neighbors Algorithm.
%
%   INPUT:  X:         testing sample features, P-by-N_test matrix.
%           X_train:   training sample features, P-by-N matrix.
%           y_train:   training sample labels, 1-by-N row vector.
%           K:         the k in k-Nearest Neighbors
%
%   OUTPUT: y    : predicted labels, 1-by-N_test row vector.
%

% YOUR CODE HERE

    [IDX, ~] = knnsearch(X_train',X','k',K);
    digits=y_train(IDX);
    y=[];
    for i=1:size(digits,1)
        num=[0:9];
        c = histc(digits(i,:),num);
        [~,max_idx]=max(c);
        y=[y max_idx-1];
    end


end

