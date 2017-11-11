fileFolder=fullfile('image');
dirOutput=dir(fullfile(fileFolder,'*'));
fileNames={dirOutput.name}';
X = extract_image2(img_name);
show_image(X)

hack_feature=[];
hack_label=[];
for i=1:30
    img_name=[num2str(i),'.jpg'];
    X = extract_image(img_name);
    hack_feature=[hack_feature,X];
    
    
end