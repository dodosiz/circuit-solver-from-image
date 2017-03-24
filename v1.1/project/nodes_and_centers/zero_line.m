% sometimes the cell array unique_lines has entries with []
% this will result to an error so the purpose of this script
% is to delete those lines with empty brackets []

% find empty brackets
zero_p = [];
for i = 1:length(unique_lines(:,1))
    if unique_lines{i} ~= 0
        zero_p(i) = 1;
    else
        zero_p(i) = 0;
    end
end

% fill a temporary cell array
counter = 1;
for i = 1:length(zero_p(1,:))
    if zero_p(i) == 1
        linarios(counter,:) = unique_lines(i,:);
        counter = counter + 1;
    end
end

% replace the original array with the temporary
clear unique_lines
for i = 1:length(linarios(:,1))
    unique_lines(i,:) = linarios(i,:);
end
clear linarios i zero_p