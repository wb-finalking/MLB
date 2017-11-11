function mi = MI( idx , gnd )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明

    gnd_c=unique(gnd);
    for i=1:length(gnd_c)
        gnd_c_num(i)=length(find(gnd==gnd_c(i)));
    end
    idx_c=unique(idx);
    for i=1:length(idx_c)
        idx_c_num(i)=length(find(idx==idx_c(i)));
    end
    p_idx=idx_c_num/length(idx);
    p_gnd=gnd_c_num/length(gnd);
    p=zeros(length(idx),length(gnd));
    mi=0;
    for i=1:length(idx_c)
        for j=1:length(gnd_c)
            p(i,j)=sum((idx==idx_c(i))==(gnd==gnd_c(i)))/length(gnd);
            mi=mi+p(i,j)*log(p(i,j)/(p_idx(i)*p_gnd(j)))/log(2);
        end
    end

end

