function str= inputString(prompt, possibilities)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

% possibilites is a cell array
    while true
        str=input(prompt, 's');
        inputIsValid=0;
        i=1;
        while ~inputIsValid || i<=length(possibilities)
            if strcmp(str, possibilities(i))
                inputIsValid=1;
            end
            i=i+1;
        end
        if inputIsValid
            break;
        end
    end 
end

