I1=imread('lena-gray.bmp');
I2=imread('lena512color.tiff');%Input image
k1=[1,2,1;0,0,0;-1,-2,-1];%Input kernel
k2=[1,0,-1;2,0,-2;1,0,-1];
L1=[0,-1,0;-1,4,-1;0,-1,0];
L2=[-1,-1,-1;-1,8,-1;-1,-1,-1];
S=[1/9,1/9,1/9;1/9,1/9,1/9;1/9,1/9,1/9];
%I2=conv(I,k1,'full');
Ip=[];
Ip=uint8(Ip);
for i=1:3
Ip(:,:,i)=myconv(I2(:,:,i),L2,'full','wrap around');
end
imshow(Ip)
