% Simon Yoon ECE210A HW 4
clc
clear
close all
%% rand tests / errors

% # elements > # vectors
testv = rand(5, 1) + 1j*rand(5, 1);

v1 = rand(5, 3) + 1j*rand(5, 3);
orthnorm1 = gramSchmidt(v1);
isOrthonormal(orthnorm1)
proj1 = orthoProj(testv, orthnorm1);
error1 = norm(testv - proj1);

% # vectors = # elements 
v2 = rand(5, 5) + 1j*rand(5, 5);
orthnorm2 = gramSchmidt(v2);
isOrthonormal(orthnorm2)
proj2 = orthoProj(testv, orthnorm2);
error2 = norm(testv - proj2);

answer = table(error1,error2)
if error1 > error2
    fprintf('Error 1 is larger than error 2');
  else
    fprintf('Error 2 is larger than error 1');
end
%% Gaussians


x = linspace(0,2*pi,100);
y = sin(x);
plot(x,y)
hold on 
mu = 0:pi/2:2*pi;

%plotter

gaussians = zeros(numel(x),5);
for i = 1:numel(mu)
    hold on 
    f = 1/(sqrt(2*pi))*exp((-(x-mu(i)).^2));
    plot(x,f)
    gaussians(:,i) = f;
end
title('Sinusoid and Gaussians')
legend('y = sin(x)', '\mu = 0', '\mu = \pi/2', '\mu = \pi', '\mu = 3\pi/2', '\mu = 2\pi')
xlabel('x')
ylabel('y')
    
basis = gramSchmidt(gaussians);
sin_est = orthoProj(y, basis);

figure
subplot(2,1,1)
plot(x,y)
hold on
plot(x,sin_est)
title('Sine and Estimated Sine')
xlabel('x')
ylabel('y')
legend('Sine', 'Estimated sine')

subplot(2,1,2)
for i=1:5
    hold on
    plot(x,basis(:,i))
end
title('Orthonormal basis functions')
xlabel('x')
ylabel('y')

%% gramSchmidt

function gs = gramSchmidt(V)
[m,n]=size(V);
gs=zeros(m,n);
    gs(:, 1) = V(:, 1)/norm(V(:, 1));
    for i = 2:n
        w = V(:, i);
        sum = zeros(m, 1);
        for j = 1:i-1
            v = gs(:, j);
            sum = sum + (dot(v, w)/(norm(v))^2)*v;
        end
        gs(:, i) = (w - sum)/norm(w - sum);
    end
end
%% isOrthonormal

function bool = isOrthonormal(V)
[m,n] = size(V);
tolerance = 10*eps;
if V == zeros(m,n) 
    error('The set that contains just zero vectors is not orthonormal.');
        for i = 1:n
        v1 = V(1:m, i);
        if norm(v1) - 1 <= tolerance
            bool = 1;
        else
            bool = 0;
            return
        end
        end
else
 
    for i = 1:round(n/2)
        v2 = V(1:m, i);
        for j = (i + 1):n
            w = V(1:m, j);
            d = dot(v2, conj(w));
            if d <= tolerance
                bool = 1;
            else
                bool = 0;
                return
                end
            end
        end
    end
end
%% orthoProj

function proj = orthoProj(V, orthnorm)
    [m, n] = size(orthnorm);
    proj = zeros(m, 1);
    for i = 1:n
        proj = proj + (dot(V, orthnorm(:, i))).*orthnorm(:, i);
    end
end