img = rgb2gray(imread('img.jpg'));
figure;
imshow(img); %Original
%Apply non linear noise
noise_img = imnoise(img, 'salt & pepper', 0.02);
figure;
imshow(noise_img); %Noise


%Apply a median filter
median_filter = medfilt2(noise_img);
figure;
imshow(median_filter); %Noise Removal