function []=choosePlot(field)
% Lets user choose a desired plot, and calls the plotting commands so that
% the desired plot is visualized
% Input: field, data array
% Output: none

    %Define options:
    %options is a cell array of strings
    options=cell(4,1);
    options{1}='Quiver plot';
    options{2}='4D colorscale abs plot';
    options{3}='3D scatter comp in plane plot';
    options{4}='3D surface comp in plane plot';
    % display menu and let user decide
    choice=displayMenu(options);
    % Show the desired plot to the user
    if choice==1
        % Function for quiver plot
    elseif choice==2
        % Function for 4D plot
    elseif choice==3
        s=generateStructFor3DPlot(field);
        % Function for 3D scatter
    else
        s=generateStructFor3DPlot(field);
        plotSurface(field, s);
    end
end 

