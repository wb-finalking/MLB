function digits = hack(img_name)
%HACK Recognize a CAPTCHA image
%   Inputs:
%       img_name: filename of image
%   Outputs:
%       digits: 1x5 matrix, 5 digits in the input CAPTCHA image.

load('hack_data');
% YOUR CODE HERE

X = extract_image(img_name);
%show_image(X)
digits=knn_hack(X, hack_feature,hack_label, 5);

end