clc;
clear;
close all;

x = 1:0.2:5;
y = exp(x).*sin(2*x);

mu = 0.001;
theta = [0;0;0];

hasil = [];

for n = 1:20

    if n == 1
        phi = [0;
               x(1);
               0];
    else
        phi = [-y(n-1);
                x(n);
                x(n-1)];
    end

    yhat = phi'*theta;

    e = y(n) - yhat;

    theta = theta + mu*e*phi;

    hasil = [hasil;
             n y(n) yhat e theta(1) theta(2) theta(3)];

end

disp(' ')
disp('Tabel Hasil Identifikasi Online')
disp(' ')
disp(' n      y(n)      yhat      error        a         b         c')
disp(hasil)

a = theta(1);
b = theta(2);
c = theta(3);

fprintf('\nParameter akhir:\n');
fprintf('a = %f\n',a);
fprintf('b = %f\n',b);
fprintf('c = %f\n',c);