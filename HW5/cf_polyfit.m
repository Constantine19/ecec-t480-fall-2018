function [a, r_2, syx] = cf_polyfit(x,y)

x = x';
y = y';
z = [ones(size(x)) x x.^2];
a = z\y;

Sr = sum((y-z*a).^2);
r_2 = 1 - Sr / sum((y - mean(y)).^2);
syx = sqrt(Sr/(length(x)-length(a)));
   
end
