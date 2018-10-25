function x = determinant(a)
M = a;
n = size(a);
n = n(1);
for k = 1:n-1
    for i = k+1:n
        if abs(M(i,k)) > abs(M(k,k))
            M([k,i], :) = M([i,k], :);
        end
    end
    for j = k+1:n
        q = M(j,k) / M(k,k);
        for l = k+1:n
            M(j,l) = M(j,l) - q * M(k,l);
        end
    end
end
determinant = 1;
for i = 1:n
    determinant = determinant * M(i, i);
end

x = determinant;

end

