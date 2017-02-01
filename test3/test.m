sigma = 5;
hsize = 31;
h = fspecial('gaussian', hsize, sigma);
surf(h);


imagesc(h);
im=rgb2gray(imread('logo.png'));
out = imfilter(im, h);




for i = 3:5:10
    h = fspecial('gaussian', hsize, i);
    out = imfilter(im, h);
    figure;
    imshow(out);
end
