function [ Mu , Sigma , Phi] = param_MLE( X , Y )
% assumption : 2-classifier Y has just 0 or 1
% Inputs:
%       'X'     - M-by-N matrix, N data points of dimension M.
%       'Y'     - 1-by-N matrix, N data points.
% Outputs:
%       'Mu'    - M-by-K(2) matrix, mean of K(2) Gaussian distributions.
%       'Sigma' - M-by-M-by-K(2) matrix (yes, a 3D matrix), variance matrix of
%                   K Gaussian distributions.
%       'Phi'   - 1-by-K(2) matrix, prior of K Gaussian distributions.
%

num_k=size(X,1);
Mu=zeros(num_k,2);
Sigma=zeros(num_k,num_k,2);
Phi=zeros(1,2);


X0=X(:,find(Y==0));
X1=X(:,find(Y==1));

Mu(:,1)=mean(X0,2);
Mu(:,2)=mean(X1,2);

num_n0=size(X0,2);
Sigma(:,:,1)=(X0-repmat(Mu(:,1),1,num_n0))*(X0-repmat(Mu(:,1),1,num_n0))'/num_n0;
num_n1=size(X1,2);
Sigma(:,:,1)=(X1-repmat(Mu(:,1),1,num_n1))*(X1-repmat(Mu(:,1),1,num_n1))'/num_n1;

Phi(1)=num_n0/(num_n0+num_n1);
Phi(2)=1-Phi(1);
end

