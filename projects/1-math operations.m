%% Simon Yoon ECE210A HW1 
clc
clear all
close all
%% Question 1
a = log10(34);
b = 6*exp(j*(3*pi/4));
c = atan(sqrt(65)) + 24;
d =  sqrt(3)/2 + j*(1/2);
y = [a;b;c;d]
%% Question 2
e = b*d;
x = [real(e), imag(e), abs(e), angle(e)]
%% Question 3
matproduct = y*x
z = transpose(y).*x;
mattranpose = repmat(z,4,1)
%% Question 4
arith = matproduct + (1/2)*mattranpose
elementmult = matproduct.*mattranpose
subtracttwo = matproduct - 2
conjtranpose = matproduct'
diagadd = mattranpose + 3*eye(4)
%% Question 5
n = rad2deg(angle(e))
longv = linspace(1, 1500, 1500)
specv = 1:0.4:n