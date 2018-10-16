function initial_guess = modified_secant(func, initial_guess, per_fraction, max_iteration, max_error)
%   Finds the root of a function using the modified secant approach.
%   Inputs are the function(anonymous),initial guess,perturbation fraction,
%   maximum number of iterations, and maximum absolute relative error.
%   The outputs should be the root and a table of iteration results.
%
    i = 1;
    error = 1;
    output_array = [];
    
    while i < max_iteration && error > max_error
        output_array = [output_array; i, initial_guess, func(initial_guess), error];
        initial_guess_old = initial_guess;
        i = i + 1;
        initial_guess = initial_guess - (per_fraction*initial_guess*func(initial_guess))/(func(initial_guess + per_fraction * initial_guess) - func(initial_guess));
        error = abs ((initial_guess - initial_guess_old)/initial_guess) * 100;
    end
    
    output_array = [output_array; i, initial_guess, func(initial_guess), error];
    fprintf('\n%d %f %f %f\n', output_array.')
end

