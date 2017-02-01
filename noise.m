M = zeros(320);
M(1:320,1:320) = 255;



for i = 1:320
    for j=1:320
        r = randi([1,320],1,1);
        c = randi([1,320],1,1);
        noise_val = randi([-16,255],1,1);
        M(r,c)= noise_val; 
    end
end
imshow(M)

