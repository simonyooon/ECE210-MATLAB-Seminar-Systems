%% Simon Yoon ECE210AHW3

clear 
clc
close all 
%% Question 1

A = ones(100,100);
B = A;
C = A;

a = 1:100;
b = 1:100;

[i,j] = meshgrid(a,b);

matrixAq1 = ((i-25).^2 + (j-75).^2).^(1/2); 
matrixAq2 = ((i-75).^2 + (j-25).^2).^(1/2); 
A(matrixAq1<10 | matrixAq2<10) = 0;

matrixBq1 = ((i-25).^2 + (j-25).^2).^(1/2); 
matrixBq2 = ((i-75).^2 + (j-75).^2).^(1/2); 
B(matrixBq1<10 | matrixBq2<10) = 0;

matrixCq1 = ((i-50).^2 + (j-50).^2).^(1/2); 
C(matrixCq1>10) = 0;

figure(1);
Ccomp = ones(100,100) - C;
imshow(Ccomp)
figure(2);
imshow(A)
figure(3);
imshow(Ccomp&A)
figure(4);
imshow(A&B)
figure(5);
imshow(A&B&Ccomp)

%% Question 2

[value,index] = findThreshold(normpdf(linspace(0,5,100),0,1), 0.05)
%% Question 3

x = linspace(-5.25,5.25, 9999);
y = sinc(x);            
[zeros, extrema] = fx(x,y);

extract = y(5000:5953);  
[firstVal, firstInd] = findThreshold(extract,0.2) 

%%
function [val,ind] = findThreshold(X,threshold) % function for Question 2
    ind = find(X<threshold);
    ind = ind(1);
    val = X(ind);
end