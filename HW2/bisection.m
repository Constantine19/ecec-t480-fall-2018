function y = bisection(func, lower, upper, max_iteration, max_error)
%   Finds the root of a function using the bisection approach.
%   Inputs are the func- tion(anonymous), upper and lower limits,
%   maximum number of iterations, and maximum absolute relative error.
%   The outputs should be the root and a table of iteration results.
%
    i = 1;
    x3 = (upper+lower)/2;
    error = 1;
    output_array = [];
    
    while i < max_iteration && error > max_error
        output_array = [ output_array; i, lower, upper, x3, func(x3), error];
        x3_old = x3;
        if func(lower)*func(x3) < 0
            upper = x3;
        else
            lower = x3;
        end
        x3 = (upper + lower)/2;
        error = abs((x3 - x3_old)/x3)*100;
        i = i+1;
    end

    output_array = [ output_array; i, lower, upper, x3, func(x3), error];
    fprintf('\n%d %f %f %f %f %f\n', output_array.')

end