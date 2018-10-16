function y = fixed_point( func, initial_value, max_iteration, max_error)
%   Finds the root of a function using the fixed point approach.
%   Inputs are the func- tion(anonymous),initial guess, maximum number
%   of iterations, and maximum absolute rela- tive error. The outputs should
%   be the root and a table of iteration results.
%
    i = 1;
    y = func(initial_value);
    error = 1;
    output_array = [];
    
    while i < max_iteration && error > max_error
        output_array = [output_array; i, initial_value, error];
        initial_value_old = initial_value;
        i = i+1;
        initial_value = y;
        y = func(initial_value);
        error = abs((initial_value - initial_value_old)/initial_value)*100;
    end
    
    output_array = [output_array; i, initial_value, error];
    fprintf('%d %f %f \n', output_array.')
   
end

