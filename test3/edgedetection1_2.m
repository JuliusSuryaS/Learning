img_color = imread('octg.jpg');
img = rgb2gray(img_color);
img_norm = double(img)/255;
sigma = 5;
hsize = 31;
blur_filter = fspecial('gaussian',hsize, sigma);
% surf(blur_filter)

% 1. D(h * f) --> filter(smooth) the image and derivate the result
% Associative with
% 2. (Dh) * f --> derivate the kernel and filter(smooth) with image

% 1 and 2 Produce the same result where number 2 result in better
% performance.
% (Dh)* result in correlated so it needs to be convoluted

% Compare value with  (Dh)* f --> derivate the kernel and filter with image
[gx gy] = imgradientxy(blur_filter,'sobel');

img_result_gx = imfilter(img_norm, gx, 'conv'); % the result is correlated
img_result_gy = imfilter(img_norm, gy, 'conv'); % the result is correlated


%===============================================
% Compare value with  D(h*f) --> smooth image first then derivate
img_smooth = imfilter(img_norm,blur_filter);
[g_x g_y] = imgradientxy(img_smooth, 'sobel');

figure;
imshowpair(img_result_gx, g_x, 'montage'); 
hold off;

figure;
imshowpair(img_result_gy, g_y, 'montage'); 


% Additional----
%==============================================
%second derivatives of [gx gy] (D^2h) * f
[gxx gxy]= imgradient(gx, 'sobel');
[gyx gyy] = imgradient(gy, 'sobel');
img_result_gxx  = imfilter(img_norm, gxx, 'conv');
img_result_gxy  = imfilter(img_norm, gxy, 'conv');
img_result_gyx  = imfilter(img_norm, gyx, 'conv');
img_result_gyy  = imfilter(img_norm, gyy, 'conv');

figure;
imshowpair(img_result_gxx, img_result_gyx, 'montage')
