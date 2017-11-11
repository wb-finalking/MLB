function P = gaussian_pos_prob(X, Mu, Sigma, Phi)
%GAUSSIAN_POS_PROB Posterior probability of GDA.
%   p = GAUSSIAN_POS_PROB(X, Mu, Sigma) compute the posterior probability
%   of given N data points X using Gaussian Discriminant Analysis where the
%   K gaussian distributions are specified by Mu, Sigma and Phi.
%
%   Inputs:
%       'X'     - M-by-N matrix, N data points of dimension M.
%       'Mu'    - M-by-K matrix, mean of K Gaussian distributions.
%       'Sigma' - M-by-M-by-K matrix (yes, a 3D matrix), variance matrix of
%                   K Gaussian distributions.
%       'Phi'   - 1-by-K matrix, prior of K Gaussian distributions.
%
%   Outputs:
%       'p'     - N-by-K matrix, posterior probability of N data points
%                   with in K Gaussian distributions.

N = size(X, 2);
K = length(Phi);
P = zeros(N, K);

%%%%%%%%%%%%%   TO DO  %%%%%%%%%%%%%%%%%
num_n=size(X,2);
num_k=length(Phi);
for i=1:num_n
    for j=1:num_k
        P(i,j)=Phi(j)*(1/(2*pi*sqrt(det(Sigma(:,:,j)))))*exp(-0.5*((X(:,i)-Mu(:,j))'*inv(Sigma(:,:,j))*(X(:,i)-Mu(:,j))));
    end
end

sum_P=sum(P,2);
P=P./repmat(sum_P,1,num_k);
% Your code HERE
