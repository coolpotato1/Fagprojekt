function choice = displayMenu( options )
%Display a menu for the user, and let the user make a choice
% Input: options, a cell array of strings with options
% Output: number (integer)

    %options is a cell array of strings
    % print the options
    for i=1:length(options)
        fprintf('%d. %s\n', i, options{i});
    end
    choice=0;
    % ask user for choice until valid choice is chosen
    while ~any(choice == 1:length(options))
        choice = inputNumber('Please choose a menu item: ');
    end
end

