function [T] = miska(a,sirPozicija,N,risi)
% function [T] = miska(a,sirPozicija,N,risi)

if nargin < 4
    risi = false;
end

% slikica_mis = imread('mis_clipart.jpg'); 
% slikica_mis  = flipud(slikica_mis);
% slikica_sir = imread('sir_clipart.jpg'); 
% slikica_sir  = flipud(slikica_sir);
% markersize = [1/2,1/2]; %//The size of marker is expressed in axis units, NOT in pixels
% x_low = @(x) x - markersize(1)/2; %//Left edge of marker
% x_high = @(x) x + markersize(1)/2;%//Right edge of marker
% y_low = @(y) y - markersize(2)/2; %//Bottom edge of marker
% y_high = @(y) y + markersize(2)/2;%//Top edge of marker

% T(i) je stevilo korakov miske

T = zeros(1,N);

% izris zacetnega stanja:

if risi
    axis([-a,a,-a,a]);
    grid on;
    hold on;
    plot(0,0,'ro');
end
%imagesc([x_low(a) x_high(a)], [y_low(sirPozicija) y_high(sirPozicija)], slikica_sir);  

misPoz = [0 0];
for i = 1:n
    ok = 0
    while ~ok
       move = randi(4);
       ok = 1;
       if move == 1 && misPoz(1) < a
           misPoz(1) = misPoz(1) + 1;
       elseif move == 1 && misPoz(1) > -a
           misPoz(1) = misPoz(1) - 1;
       elseif move == 1 && misPoz(2) < a
           misPoz(1) = misPoz(2) + 1;
       elseif move == 1 && misPoz(2) > -a
           misPoz(1) = misPoz(2) - 1;
       else
           ok = 0;
       end
    end
    misPoz
    %imagesc([x_low(a) x_high(a)], [y_low(sirPozicija) y_high(sirPozicija)], slikica_sir);
    pause(1)
    if misPoz == sirPozicija
       break 
    end
end

end