function [sp,Pathre]=shortestpath(m,V,pr,pc,qr,qc,type)

%find the shortest path in 4-/8-/m-path
%[sp,Pathre]=shortestpath(m,V,pr,pc,qr,qc,record,sp,p,Path,Pathre,type)
%Input:
%      -m  matrix
%      -V  valid path value
%      -pr the row of start pixel
%      -pc the column of start pixel
%      -qr the row of target pixel
%      -qc the column of target pixel
%      -type the type of path searching
%
%author:Chen,Yuhan

s=size(m);
record=zeros(s(1),s(2));%record of visiting
Path=[pr,pc];
record(pr,pc)=1;
Pathr='NaN';
sp='NaN';
p=0;
switch type
    case('four')
        [sp,Pathre]=FourPath(m,V,pr,pc,qr,qc,record,sp,p,Path,Pathr);
    case('eight')
        [sp,Pathre]=EightPath(m,V,pr,pc,qr,qc,record,sp,p,Path,Pathr);
    case('m')
        [sp,Pathre]=MPath(m,V,pr,pc,qr,qc,record,sp,p,Path,Pathr);
end
end