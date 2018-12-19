m=[3,1,1;...
    0,2,0;...
    1,1,3];%input matirx
V=[0,1,2,3];
[sp4,Path4]=shortestpath(m,V,3,1,1,3,'four');%the shortest path of 4-path
[sp8,Path8]=shortestpath(m,V,3,1,1,3,'eight');%the shortest path of 8-path
[spm,Pathm]=shortestpath(m,V,3,1,1,3,'m');%the shortest path of m-path