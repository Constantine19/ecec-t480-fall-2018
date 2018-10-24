function x = gauss_jordan(a,b)

M = [a b];
n = size(M);
n = n(1);
M = rref(M);
x(n) = M(n,n+1) / M(n,n);
for i = n-1:-1:1
    sub = 0;
    for j = i+1:n
        sub = sub + M(i,j)*x(j);
    end
    x(i) = ( M(i,n+1) - sub ) / M(i,i);
end
x = x.';
end

