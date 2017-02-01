
a=0;
z=320;




mod(280,40)
M = zeros(320);
%M(1:40,1:40) = 255;
%M(1:40,81:120) = 255;
%M(41:80,41:80) = 255;
%M(41:80,121:160) = 255;


for i=1:320
    if mod(i-1,80) == 0
      y = i + 39;
    for j=1:320
        if mod(j-1,80) == 0
            M(i:y,j:j+39) = 255;
            
        end
        
    end
    end
    
    if(i==y)
    for j=1:320
        if mod(j+39,80) == 0
            M(y+1:y+40,j:j+39) = 255;
            
        end
        
    end
    end
    
    
         
end
imshow(M);


for i = 1:320
    for j=1:320
        r = randi([1,320],1,1);
        c = randi([1,320],1,1);
        noise_val = randi([-16,16],1,1);
        M(r,c)= noise_val; 
    end
end
imshow(M);

IMG = imread('Marketing.png');
IMG_size = size(IMG);
for i = 1:512
    for j=1:512
        r = randi([1,512],1,1);
        c = randi([1,512],1,1);
        noise_val = randi([-16,16],1,1);
        IMG(r,c)= noise_val; 
    end
end
imshow(IMG)
%Im = imnoise(IMG,'salt & pepper');
%imshow(Im)