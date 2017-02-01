
img_color = imread('octg.jpg');
img = rgb2gray(img_color);  %convert to grayscale
img_res1 =  (double(img))/255;
imshow(img_res1)

% show gradient in x and y
[gx, gy] = imgradientxy(img_res1,'sobel');
%imshow((gy+4)/8)
%imshow((gx+4)/8)

% show magnitude and direction of gradient
[gmag gdir] = imgradient(gx,gy);
gmag_normalize = gmag/ (4 * sqrt(2));
% imshowpair(gmag_normalize, gmag, 'montage')
gdir_normalize = (gdir + 180)/360;

gdir_normalize(8,89:96); %normalized value
gdir(8,89:96); %value in range of 0 - 360

%imshow(gdir_normalize);


img_res2=select_gdir(gmag, gdir,1, -180,90);
imshow(img_res2)

