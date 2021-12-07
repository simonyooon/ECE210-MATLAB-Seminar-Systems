% Simon Yoon ECE210A HW2 
clc
clear
close all

%% Question 1


x100 = linspace(0, 2*pi, 100);
x1000 = linspace(0, 2*pi, 1000);
y100 = cos(x100./2);
y1000 = cos(x1000./2);

dy100dx100 = diff(y100)./diff(x100);    % Derivative cos(x/2) = -(1/2)*sin(x/2)
dy1000dx1000 = diff(y1000)./diff(x1000);

checkd100 = -(1/2)*sin(x100/2);
checkd1000 = -(1/2)*sin(x1000/2);
ediffd100 = checkd100(1:end-1) - dy100dx100;
ediffd1000 = checkd1000(1:end-1) - dy1000dx1000;
maxdiffd100 = max(ediffd100); % = 0.0079
maxdiffd1000 = max(ediffd1000); % = 7.8618e-04 ... length 1000 to produce better results

integ100 =  cumsum(y100 * (2*pi)/100);  % Integral cos(x/2) = 2*sin(x/2)
integ1000 =  cumsum(y1000 * (2*pi)/1000);
checkinteg100 = 2*sin(x100./2);
checkinteg1000 = 2*sin(x1000./2);
diffinteg100 = checkinteg100 - integ100; 
diffinteg1000 = checkinteg1000 - integ1000; 

maxdiffinteg100 = max(diffinteg100);   % 0.0059
maxdiffinteg1000 = max(diffinteg1000); % = 5.8348e-04 ...  length 1000 to produce better results

hold on;
figure(1); 
title('Integral Approximation of cos(x/2)');
plot(x1000, integ1000);

%% Question 2


M = linspace (1,100, 100);
A = reshape(M,10,10,1);
Aud = flipud(A);
A(4,:) = fliplr(A(4,:)); 
AColsum = sum(A,1);
ARowProd = prod(A,2);
Adiagonal = diag(A);
A(7,:) = [];

%% Question 3


% for loop w/o preallocation
tic
for i = 1:300
    for j = 1:300
        B(i,j) = 1/(2*pi) * 10/((i-150)^2 + (j-150)^2 + 10^2)^(3/2);
    end
end
toc
 
% for loop with preallocation
B = zeros(300,300);
tic
for i = 1:300
   for j = 1:300
       B(i,j) = 1/(2*pi) * 10/((i-150)^2 + (j-150)^2 + 10^2)^(3/2);
   end
end
toc

% element-wise matrix operations
tic
    a = 1:300;
    b = a; 
    
    [i,j] = meshgrid(a,b);
    
    C = 1/(2*pi) * 10./((i-150).^2 + (j-150).^2 + 10^2).^(3/2);
    
toc