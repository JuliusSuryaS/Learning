figure;
img = imread('cameraman.png');
temp = img(50:200,20:100);
imshowpair(img,temp,'montage')
hold off;

figure;
c = normxcorr2(temp,img);
imshow(c)

figure,surf(c), shading flat

[ypeak, xpeak] = find(c==max(c(:)));


[ypeak, xpeak]
yoffset = ypeak - size(temp,1)
xoffset = xpeak - size(temp,2)




figure;
hx = axes;
imshow(img,'Parent',hx);
imrect(hx, [xoffset,yoffset,size(temp,2),size(temp,1)])
hold on
plot(xpeak,ypeak,'rx','markersize',20)
hold on
plot(xoffset,yoffset,'bx','markersize',20)
