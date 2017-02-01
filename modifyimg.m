img1 = imread('cube.jpg');
imshow(img1);

img2 = imread('logo.png');
imshow(img2(:,:,1));

img3 = (img1 + img2(:,:,1))/2;
% img4 = img1/2 + img2(:,:,1)/2;
% figure;
% imshow(img3);
% plot(img3(250,:));
% hold off;
% 
% 
% img4 = img1 - img2(:,:,1);
% figure;
% imshow(img4);
% plot(img4(250,:));


noise = randn(1,100000);

[n,x]=hist(noise, linspace(-3,3,21))
plot(x,n)
