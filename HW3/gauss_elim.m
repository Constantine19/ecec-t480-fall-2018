function x = gauss_elim(a,b)
%GAUSS_ELIM Summary of this function goes here

M = [a b];
n = size(M);
n = n(1);
for k = 1:n-1
    for i = k+1:n
        if abs(M(i,k)) > abs(M(k,k))
            M([k,i], :) = M([i,k], :);
        end
    end
    for j = k+1:n
        q = M(j,k) / M(k,k);
        for l = k+1:n+1
            M(j,l) = M(j,l) - q * M(k,l);
        end
    end
end
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

