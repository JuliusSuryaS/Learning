img1 = rgb2gray(imread('edge_img1.jpg'));
img2 = rgb2gray(imread('edge_img2.jpg'));
img2 = img2(1:204, 1:204);
imshowpair(img1, img2, 'montage');

edge_im1 = edge(img1, 'canny'); % result in binary where 0 is black and 1 is white
edge_im2 = edge(img2, 'canny');
imshowpair(edge_im1, edge_im2, 'montage');


% combine the edge image because it is binary using "&" operand

result_im = edge_im1 & edge_im2;
imshow(result_im)

