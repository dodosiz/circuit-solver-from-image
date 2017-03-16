function [ answer ] = is_numeric( input_string )
% [ answer ] = is_numeric( input_string )
% iterates over input_string and check if each character is between '0' and
% '9' if answer = 1 it is numeric
lower_limit = int64('0');
upper_limit = int64('9');
for i = 1:length(input_string)
    if int64(input_string(i)) < lower_limit || int64(input_string(i)) > upper_limit
        answer = 0;
        return;
    end
end
answer = 1; % string is numeric
        
end

