sigma = 5;
hsize = 31;
h = fspecial('gaussian', hsize, sigma);

im = imread('img.jpg');

smoothed = imfilter(im, h, 0);
smoothed = imfilter(im, h, 'circular');
smoothed = imfilter(im, h, 'replicate');
smoothed = imfilter(im, h, 'symmetric');
imshow(smoothed);