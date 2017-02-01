img = imread('cameraman.png');

filt = fspecial('sobel');

outimg = imfilter(double(img), filt);
imagesc(outimg);
colormap gray;


img1 = double(imread('octagon.png'))/255;

%obtain gradient
[gx gy]=imgradientxy(img1,'sobel');

imshow((gy+4)/8)
%imshow(gx,[-4 4])
%imshow(gx,[])

%gradient magnitude
[gmag gdir] = imgradient(gx, gy); %magnitude and direction
imshow(gmag/(4 * sqrt(2))) % gmag = sqrt(gx^2 + gy^2) -> sqrt(32) -> 4 * sqrt(2) -> gmag is scaled by dividing it

%direction
imshow((gdir + 180)/360)
