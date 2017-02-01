s = [-1 0 0 1 1 1 0 -1 -1 0 1 0 0 0];
t = [1 1 0];

c=normxcorr2(t,s);
disp([1:size(c,2);c])
[maxval rowidx]=max(c)

final_rowidx = rowidx - size(t,2)+1
s_rowidx = s(1,final_rowidx:final_rowidx+size(t,2)-1)
