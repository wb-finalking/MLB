load('TDT2_data', 'fea', 'gnd');

% YOUR CODE HERE
k=5
W = constructW(fea);
idx1 = spectral(W, k);
idx1=assignment( idx1 , gnd );
ac=sum(idx1==gnd)/length(idx1);
%mi=MI( idx1 , gnd )/max(H(idx1),H(gnd));
mi=MutualInfo(idx1,gnd)



idx2 = litekmeans(fea, k);
idx2=assignment( idx2 , gnd );
ac=sum(idx2==gnd)/length(idx2);
mi=MI( idx2 , gnd )/max(H(idx2),H(gnd));
mi=MutualInfo(idx2,gnd)