function [out]  = myconv(fx,gx,type,edge)


%2D convolution for gray images with different types and edge padding
%options
%
%[out]  = myconv(fx,gx,type,edge)
%Input:
%     -fx:gray image
%     -gx:kernel
%     -type:convolution with size specified by SHAPE:
%     'full'  - (default) returns the full 2-D convolution,
%     'same'  - returns the central part of the convolution
%               that is the same size as A.
%     'valid' - returns only those parts of the convolution
%               that are computed without the zero-padded edges.
%               size(C) = max([ma-max(0,mb-1),na-max(0,nb-1)],0).

%     -edge:Boundary options
%       'zero'  Input arry is zeros
%       'reflect across edge'  Input array values outside the bounds of the array
%                              are computed by mirror-reflecting the array across
%                              the array border.
%
%       'copy edge'  Input array values outside the bounds of the array
%                    are assumed to equal the nearest array border
%                    value.
%
%       'wrap around'   Input array values outside the bounds of the array
%                    are computed by implicitly assuming the input array
%                    is periodic.
%This function can use in any size of fx and gx
%author:Yuhan,Chen


%fx = im2double(fx)*255;%change unit8 to double
[m,n] = size(fx);
[a,b] = size(gx);
fm=zeros(m+2*a,n+2*b);
fm(a+1:m+a,b+1:n+b)=fx;
[p,q] = size(fm);
%chose pading edge options
switch edge    
    case('zero')
    case('wrap around')
        fm(1:a,b+1:n+b)=fx(m-a+1:m,1:n);
        fm(a+m+1:m+2*a,b+1:n+b)=fx(1:a,1:n);
        fm(a+1:m+a,1:b)=fx(1:m,n-b+1:n);
        fm(a+1:m+a,n+b+1:n+2*b)=fx(1:m,1:b);
        fm(1:a,1:b)=fx(m-a+1:m,n-b+1:n);
        fm(m+a+1:m+2*a,1:b)=fx(1:a,n-b+1:n);
        fm(1:a,n+b+1:n+2*b)=fx(m-a+1:m,1:b);
        fm(m+a+1:m+2*a,n+b+1:n+2*b)=fx(m-a+1:m,n-b+1:n);
    case('copy edge')
        for i=1:a
            fm(i,b+1:n+b)=fx(1,1:n);
        end
        for i=p-a+1:p
            fm(i,b+1:n+b)=fx(m,1:n);
        end
        for i=1:b
            fm(1:p,i)=fm(1:p,b+1);
        end
        for i=q-b+1:q
            fm(1:p,i)=fm(1:p,q-b);
        end
    case('reflect across edge')
        for i=1:a
            fm(a-i+1,b+1:q-b)=fx(i,1:n);
            fm(m+a+i,b+1:q-b)=fx(m+1-i,1:n);
        end
        for i=1:b
            fm(1:p,b-i+1)=fm(1:p,b+i);
            fm(1:p,n+b+i)=fm(1:p,n+b+1-i);
        end
end
fx=fm;
out=zeros(p+a-1,q+b-1);
%2-D conv
for i = 1:q+b-1
    for j = 1:p+a-1
        for k = 1:b
            for l = 1:a
                if (i-k + 1 >= 1) && (j - l + 1 >= 1) && (i-k + 1 <= q) && (j - l + 1 <= p)
                    out(j,i) = out(j,i) + fx(j - l + 1,i - k + 1)*gx(l,k);
                end
            end
        end
    end
end
[om,on]= size(out);
%Choose size
switch type
      case('full')
          out=out(a+1:om-a,b+1:on-b);
      case('same')
          out=out(a+2:om-a-1,b+2:on-b-1);
      case('valid')
          out=out(a+3:om-a-2,b+3:on-b-2);
end
out=uint8(out);
end

