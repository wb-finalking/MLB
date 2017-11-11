function [idx, ctrs, iter_ctrs] = kmeans(X, K)
%KMEANS K-Means clustering algorithm
%
%   Input: X - data point features, n-by-p maxtirx.
%          K - the number of clusters
%
%   OUTPUT: idx  - cluster label
%           ctrs - cluster centers, K-by-p matrix.
%           iter_ctrs - cluster centers of each iteration, K-by-p-by-iter
%                       3D matrix.

% YOUR CODE HERE
[n,p]=size(X);
ctrs=rand(K,p);
ctrs=repmat(max(X,[],1)-min(X,[],1),K,1).*ctrs+repmat(min(X,[],1),K,1);
dist=zeros(n,K);
error=1;
Epsilon=0.001;
iter=0;

while(error>Epsilon&&iter<1000)
    iter=iter+1;
    error=0;
    for i=1:K
        dist(:,i)=sum((X-repmat(ctrs(i,:),n,1)).*(X-repmat(ctrs(i,:),n,1)),2);
    end
    [~,idx]=max(dist,[],2);

    for i=1:K
        mask=zeros(n,1);
        mask(idx==i)=1;
        tmp=ctrs(i,:);
        ctrs(i,:)=sum(X.*repmat(mask,1,p),1)/sum(mask);
        error=error+sum((tmp-ctrs(i,:)).*(tmp-ctrs(i,:)),2);
    end
    %iter_ctrs=cat(3,iter_ctrs,ctrs);
end

end
