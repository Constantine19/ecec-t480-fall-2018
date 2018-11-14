function xr = false_position(func, lower, upper, max_iteration, max_error) 
%   Finds the roots of a function using the false position approach.
%   Inputs are the function(anonymous), upper and lower limits, maximum
%   number of iterations, and maximum absolute relative error. The outputs
%   should be the root and a table of iteration results.
%

    i = 1;
    %xr = upper - ((func(upper)*(lower))/(func(lower)-func(upper)));
    xr = upper - (func(upper)*(lower-upper))/(func(lower)-func(upper));
    error = 1;
    output_array = [];
    
    while i < max_iteration && error > max_error
        output_array = [ output_array; i, lower, upper, xr, func(xr), error];
        xr_old = xr;
        if func(lower)*func(xr) > 0
            lower = xr;
        else
            upper = xr;
        end
        
        xr = upper - (func(upper)*(lower-upper))/(func(lower)-func(upper));
        error = abs((xr - xr_old)/xr)*100;
        i = i+1;
    end
    
    output_array = [ output_array; i, lower, upper, xr, func(xr), error];
    fprintf('\n%d %f %f %f %f %f\n', output_array.')

end