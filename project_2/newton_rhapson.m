function out = newton_rhapson(f, df, initial, maxiter, maxerr)
%   Finds the root of a function using the Newton-Rhapson approach.
%   Inputs are the function(anonymous),the derivative of the function(anonymous),
%   initial guess, maximum number of iterations, and maximum absolute relative error.
%   The outputs should be the root and a table of iteration results.
%
iter = 0;
err = 1;
out = [];
while err > maxerr && maxiter > iter
    out = [out; iter, initial, f(initial) , err];
    initial_old = initial;    
    iter = iter + 1;
    initial = initial - f(initial)/df(initial);    
    err = abs((initial-initial_old)/initial)*100;
end
out = [out; iter, initial, f(initial) , err];

