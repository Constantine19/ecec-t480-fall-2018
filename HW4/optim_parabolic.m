function y = optim_parabolic(func, lower, upper, max_iter, max_error)
% Finds the maximum of a one-dimensional function between
% two bounds using the parabolic interpolation approach. 
% The inputs are the function(anonymous), lower and
% upper bounds, maximum number of iterations, and the maximum
% relative error. The outputs are the location of the 
% maximum and the maximum value.
x1 = (lower+upper)/2;
output =[];

for ii = 0:max_iter
    x3 = (func(lower)*(x1.^2-upper.^2)+func(x1)*(upper.^2-lower.^2)+func(upper)*(lower.^2-x1.^2))/(2*func(lower)*(x1 - upper) + 2*func(x1)*(upper - lower) + 2*func(upper)*(lower - x1));
    output = [output; x3, func(x3)];
    if (abs(x3-x1)<max_error) break; end
    
    if(func(x3)>func(x1))
        lower=x1;
        x1=x3;
    else
        upper=x1;
        x1 = x3;
    end
end

output = [output; x3, func(x3)]
%fprintf('Maximum | Maximum Value')
%fprintf('\n%f %f\n',output.')

end
