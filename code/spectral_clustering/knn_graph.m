function W = knn_graph(X, k, threshold)
%KNN_GRAPH Construct W using KNN graph
%   Input: X - data point features, n-by-p maxtirx.
%          k - number of nn.
%          threshold - distance threshold.
%
%   Output:W - adjacency matrix, n-by-n matrix.

% YOUR CODE HERE

    [n,p]=size(X);
    [IDX, ~] = knnsearch(X,X,'k',k);
    W=zeros(n,n);
    for i=1:n
        W(i,IDX(i,:))=diag((repmat(X(i,:),k,1)-X(IDX(i,:),:))*(repmat(X(i,:),k,1)-X(IDX(i,:),:))')';
    end
    W=W.^0.5;
    W=(W+W')/2;
    W(W>threshold)=0;
    
%     W=zeros(n);
%     for i=1:n
%         for j=1:n
%             W(i,j) = exp(-norm(X(i,:)-X(j,:)));
%         end
%     end
%     W = W - eye(n);
%     W(W<threshold)=0;
end
