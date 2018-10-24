function x = inv_lu(A)

[l, u] = lu(A);
x = inv(l) * inv(u);

end

