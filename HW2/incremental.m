function y = incremental(func, lower, upper, number_of_regions)
%   Finds regions of roots using the incremental area.
%   Requires the function(anonymous), upper and lower limit, and the
%   number of regions between the limits as input. The output should
%   be an array of regions where there are zero crossings.
%
    dh = abs(upper-lower) / (number_of_regions-1);
    y = [];
    
    for i = 1:(number_of_regions-1)
        if func(lower)*func(lower+dh)< 0
            y = [y; lower lower + dh];
        end
        lower = lower + dh;
    end
end