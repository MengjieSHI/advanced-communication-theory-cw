% Mengjie, CSP (EE4/MSc), 2020, Imperial College.
% 23/12/2019

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Reads an image file with AxB pixels and produces a column vector of bits
% of length Q=AxBx3x8 where 3 represents the R, G and B matrices used to
% represent the image and 8 represents an 8 bit integer. If P>Q then
% the vector is padded at the bottom with zeros.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Inputs
% filename (String) = The file name of the image
% P (Integer) = Number of bits to produce at the output - Should be greater
% than or equal to Q=AxBx3x8
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Outputs
% bitsOut (Px1 Integers) = P bits (1's and 0's) representing the image
% x (Integer) = Number of pixels in image in x dimension
% y (Integer) = Number of pixels in image in y dimension
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%P=a*b*3*8;
function [bitsOut,x,y]=fImageSource(filename,P)
img=imread(filename);
[x,y,c]=size(img);

R=de2bi(img(:,:,1));
G=de2bi(img(:,:,2));
B=de2bi(img(:,:,3));

R=R';
G=G';
B=B';

R1=reshape(R,[],1);
G1=reshape(G,[],1);
B1=reshape(B,[],1);

bitsOut=[R1;G1;B1];


end