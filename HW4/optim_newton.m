function initial_guess = optim_newton(func , dfunc, initial_guess, upper, max_error, max_iteration)

    i = 1;
    error = 1;
    output_array = [];
    
    while i < max_iteration && error > max_error
        output_array = [output_array; i, initial_guess, func(initial_guess), error];
        initial_guess_old = initial_guess;
        i = i+1;
        initial_guess = initial_guess - func(initial_guess)/dfunc(initial_guess);
        if initial_guess > upper
            initial_guess = upper;
        end
        error = abs((initial_guess - initial_guess_old)/initial_guess)*100;
    end
    output_array = [output_array; i, initial_guess, func(initial_guess), error];
    fprintf('\n%d %f %f %f\n', output_array.')

end