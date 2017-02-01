img = rgb2gray(imread('img.jpg'));
img = im2double(img);


im_test = imfilter(img, padarray(5,[5 5]));


fblur = fspecial('gaussian', [31 31], 5);
ori = padarray(2,[15 15]);
res = ori - fblur;
new_img = imfilter(img,res);


fblur = fspecial('gaussian', [11 11], 5);
figure
ori = padarray(2,[5 5]);
res = ori - fblur;
new_img2 = imfilter(img,res);

imshow([img new_img new_img2 im_test]);