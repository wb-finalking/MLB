load kmeans_data.mat
[idx, ctrs, iter_ctrs] = kmeans(X, 2);
kmeans_plot(X, idx, ctrs, iter_ctrs);

%%

load digit_data.mat

[idx, ctrs, iter_ctrs] = kmeans(X, 10);
show_digit(ctrs);

[idx, ctrs, iter_ctrs] = kmeans(X, 20);
show_digit(ctrs);

[idx, ctrs, iter_ctrs] = kmeans(X, 50);
show_digit(ctrs);

%%
img = imread('sample0.jpg');
fea = double(reshape(img, size(img, 1)*size(img, 2), 3));
% YOUR (TWO LINE) CODE HERE
[idx, ctrs, iter_ctrs] = kmeans(fea, 64);
fea=ctrs(idx,:);
imshow(uint8(reshape(fea, size(img))));
