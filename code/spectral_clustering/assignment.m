function  idx = assignment( idx , gnd )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
    gnd_c=unique(gnd);
    for i=1:length(gnd_c)
        gnd_c_num(i)=length(find(gnd==gnd_c(i)));
    end
    idx_c=unique(idx);
    for i=1:length(idx_c)
        idx_c_num(i)=length(find(idx==idx_c(i)));
    end
    if(length(idx_c)~=length(gnd_c))
        error('class number not match!')
    end
    k=length(idx_c);
    A=abs(repmat(idx_c_num,k,1)-repmat(gnd_c_num',1,k));
    T=hungarian(A);
    for i=1:k
        idx(idx==idx_c(i))=gnd_c(T(i));
    end
end

