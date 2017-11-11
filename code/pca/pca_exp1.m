load('ORL_data', 'fea_Train', 'gnd_Train', 'fea_Test', 'gnd_Test');

% YOUR CODE HERE

% 1. Feature preprocessing
mu=sum(fea_Train,1)/size(fea_Train,1);
sigma=std(fea_Train,1,1);
feaTrain2=(fea_Train-repmat(mu,size(fea_Train,1),1))./repmat(sigma,size(fea_Train,1),1);
% mu=sum(fea_Test,1)/size(fea_Test,1);
% sigma=std(fea_Test,1,1);
%feaTest=(fea_Test-repmat(mu,size(fea_Test,1),1))./repmat(sigma,size(fea_Test,1),1);
% 2. Run PCA
[eigvector, eigvalue] = pca(feaTrain2);
% 3. Visualize eigenface
n=size(eigvalue,1);
tmp = [eigvector ; diag(eigvalue)']';  
tmp = sortrows(tmp,n+1) ;  
eigvector = tmp(:,1:n)';
Y=eigvector(:,n-5:n);
show_face(Y',1,1)
% 4. Project data on to low dimensional space
low_train=fea_Train*Y;% n-by-p
low_test=fea_Test*Y;% n-by-p
% 5. Run KNN in low dimensional space
y=knn(low_test', low_train', gnd_Train, 5);
% 6. Recover face images form low dimensional space, visualize them
recover_test=low_test*Y';
show_face(recover_test,20,2)
