


fid = fopen('text.txt');
content = fscanf(fid,'%c',Inf);
fclose(fid);

x=processEmail(content)



