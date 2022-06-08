function [x, y, t, len] = brah(T1,T2,st_tock);
%RISI_BRAH narise brahistohrono
%RISI_BRAH(T1,T2,st_tock)
%T1=[x_1;y1]; T_2=[x_2;y_2]
%st_tock je stevilo razdelitev intervala [x_1,x_2]

[k, theta] = isci_theta_k(T2(1) - T1(1), T2(2) - T1(2))
x = @(th) 0.5 * k^2 * (th - sin(th)) + T1(1);
y = @(th) -0.5 * k^2 * (1 - cos(th)) + T1(2);


% figure
% plot(x(ths), y(ths));

g = 9.81;
t = (k / sqrt(2*g)) * theta;

%  phi = atan2(T2(2) - T1(2), T2(1) - T1(1));
%  a = g * sin(phi);
%  t_prem = sqrt(-2*sqrt((T2(2) - T1(2))^2 + (T2(1) - T1(1))^2) / a)
%-- t_prem = sqrt(-2*((T2(2) - T1(2))^2 + (T2(1) - T1(1))^2) / (g * (T2(2) - T1(2))))

x_low = x(pi);

dx = @(th) 0.5 * k^2 * (1 - cos(th));
dy = @(th) -0.5 * k^2 * sin(th);
len = integral(@(th) sqrt(dx(th).^2 + dy(th).^2), 0, theta);

end


function [k,theta]=isci_theta_k(b,B);
%ISCI_THETA doloci theta^*, resitev g(theta)=0
%Predpostavka: T1(0,0), T2(b,B)
%[k,theta]=ISCI_THETA_K(b,B);

g = @(th) 1 - cos(th) + (B/b) * (th - sin(th));
theta = fsolve(g, 1.99*pi);
k = sqrt(2*b ./ (theta - sin(theta)));

end