function [A, r2] = cf_polyfit2(coordinate, order)

vals = zeros(order+1, length(coordinate))';
vals(1:end,1) = 1;
xvals = coordinate(1:end,1);
yvals = coordinate(1:end,2);

St = 0;
Sr = 0;
n = length(xvals);
a1 = (n*sum(xvals .* yvals) - sum(xvals) * sum(yvals)) / (n*sum(xvals.^2) - (sum(xvals))^2);
a0 = (sum(yvals)/length(yvals)) - a1*(sum(xvals)/n);
vals(1:end,2) = xvals;
for i = 1:length(coordinate)
    for j = 2:order
        vals(i,j+1) = xvals(i)^(j);
    end
    St = St + (yvals(i) - (sum(yvals)/length(yvals)))^2;
    Sr = Sr + (yvals(i) - a0 - a1*xvals(i))^2;
end

A = inv(vals' * vals)*vals'*yvals;
A = flip(A);
r2 = (St - Sr)/St;
end
