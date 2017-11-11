function img = hack_pca(filename)
% Input: filename -- input image file name/path
% Output: img -- image without rotation

img_r = double(imread(filename));
[h,w]=size(img_r);
% YOUR CODE HERE
    [row,col]=find(img_r<100);
    X=[col,h-row];
%     plot(col,h-row,'r.','MarkerSize',12)
    [eigvector, eigvalue] = pca(X);
    n=size(eigvalue,1);
    tmp = [eigvector ; diag(eigvalue)']';  
    tmp = sortrows(tmp,n+1) ;  
    eigvector = tmp(:,1:n)';
    Y=eigvector(:,n);
    if(Y(1,:)<0)
        Y=-Y;
    end
    theta=acos(Y'*[1;0]/norm(Y));
    
    
    img=255*ones(2*h,2*w);
%     theta=acos(0.866);
    if(Y(2,:)>0)
        for i=1:size(img,1)
            for j=1:size(img,2)
                %img(int16(i*cos(theta)-j*sin(theta)+w*sin(theta)+1),int16(i*sin(theta)+j*cos(theta)))=img_r(i,j);
                tmp_i=i-h;
                tmp_j=j-w;
                tmp_col=int16(tmp_j*cos(theta)-tmp_i*sin(theta));
                tmp_row=h-int16(tmp_j*sin(theta)+tmp_i*cos(theta));
                if(tmp_row>=1&&tmp_row<=h&&tmp_col>=1&&tmp_col<=w)
                    img(2*h-i,j)=img_r(tmp_row,tmp_col);
                end
            end
        end
    else
        theta=-theta;
        for i=1:size(img,1)
            for j=1:size(img,2)
                %img(int16(i*cos(theta)-j*sin(theta)+w*sin(theta)+1),int16(i*sin(theta)+j*cos(theta)))=img_r(i,j);
                tmp_i=i-h;
                tmp_j=j-w;
                tmp_col=int16(tmp_j*cos(theta)-tmp_i*sin(theta));
                tmp_row=-int16(tmp_j*sin(theta)+tmp_i*cos(theta));
                if(tmp_row>=1&&tmp_row<=h&&tmp_col>=1&&tmp_col<=w)
                    img(2*h-i+1,j)=img_r(tmp_row,tmp_col);
                end
            end
        end
    end
        
end