function  h  = H( x )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

    x_c=unique(x);
    for i=1:length(x_c)
        x_c_num(i)=length(find(x==x_c(i)));
    end
    p=x_c_num/length(x);
    h=-sum(log(x)/log(2));
    
end

