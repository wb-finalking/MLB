function idx = spectral(W, k)
%SPECTRUAL spectral clustering
%   Input:
%     W: Adjacency matrix, N-by-N matrix
%     k: number of clusters
%   Output:
%     idx: data point cluster labels, n-by-1 vector.

% YOUR CODE HERE
    n=size(W,2);
    D=diag(sum(W,2));
    D=D+0.000001*eye(n);
    [d,v]=eig(D^-0.5*(D-W)*D^-0.5);
    tmp = [d ; diag(v)']';  
    tmp = sortrows(tmp,n+1) ;  
    d = tmp(:,1:n)';
    Y=d(:,2:k);
    %idx = kmeans(Y, k);
    idx=litekmeans(Y, k);
    
end
