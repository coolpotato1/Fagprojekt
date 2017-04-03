function num = inputNumber(prompt)
    while true
        num = str2double(input(prompt, 's'));
        if ~isnan(num)
            break;
        end
        disp('Error')
    end 
end 