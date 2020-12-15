% Mengjie, CSP (EE4/MSc), 2020, Imperial College.
% 23/12/2019

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Display the received image by converting bits back into R, B and G
% matrices
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Inputs
% bitsIn (Px1 Integers) = P demodulated bits of 1's and 0's
% Q (Integer) = Number of bits in the image
% x (Integer) = Number of pixels in image in x dimension
% y (Integer) = Number of pixels in image in y dimension
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Outputs
% None
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [img]=fImageSink(bitsIn,Q,x,y)

temp=reshape(bitsIn,8,[]);

red=temp(:,1:10000);
green=temp(:,10001:20000);
blue=temp(:,20001:30000);

red=red';
green=green';
blue=blue';

red=bi2de(red);
green=bi2de(green);
blue=bi2de(blue);

R1=reshape(red,100,[]);
G1=reshape(green,100,[]);
B1=reshape(blue,100,[]);

img=zeros(100,100,3);

img(:,:,1)=R1;
img(:,:,2)=G1;
img(:,:,3)=B1;

img=uint8(img);





end 