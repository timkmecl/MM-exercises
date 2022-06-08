function [kontrolne1,kontrolne2] = sub_demo(b,c,risanje)
% SUB_DEMO demonstrira en korak subdivizije za ravninsko
% Bezierovo krivuljo. Pri tem je b tabela 2x(n+1) kontrolnih tock.
% c je subdivizijski parameter 0 <= c <= 1.

n = size(b, 2);

leva = zeros(size(b));
desna = zeros(size(b));

leva(:, 1) = b(:, 1);

for i = (n-1):-1:1
    b(:, 1:i) = (1-c) .* b(:, 1:i) + c .* b(:, 2:(i+1));
    leva(:, n - i + 1) = b(:, 1);
end
desna = b;

kontrolne1 = leva;
kontrolne2 = desna;

end