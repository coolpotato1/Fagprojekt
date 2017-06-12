function [ F ] = getField(field, s)
%This function extracts the relevant info from the field dataset.
    if(strcmp(s.B_choice, 'abs'))
        F=[field(:,1) field(:,2) field(:,3) calcMagnitude(field(:,4), field(:,5), field(:,6))];
    else
        F=[field(:,1) field(:,2) field(:,3) field(:,getFieldColumn(s.B_choice))];
    end

end

