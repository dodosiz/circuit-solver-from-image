function [ unit, value ] = string_value( string1, string2 )
% [ unit, value ] = string_value( string1, string2 )
% takes an expresion from the ocr algorithm like '5 Ohm'
% and finds which part of the expresion belongs to 
% a number('5') and which to a unit('Ohm')
position = has_unit(string1);

% initialize for error handling
unit = '';
value = '';
% if substring is in position 1 it means we have the unit in that string
if (position == 1) % unit found, must find value now
    unit = string1;
    value = '';
elseif (position > 1)
    value = string1(1:position-1);
    unit = string1(position:length(string1));
elseif is_numeric(string1) % value found, must find unit now
    value = string1;
    unit = '';
end

if strcmp(unit,'')
    position = has_unit(string2);
    if (position == 1) % unit found, must find value now
        unit = string2;
    elseif (position > 1)
        value = string2(1:position-1);
    	unit = string2(position:length(string2));
    end
end

if strcmp(value,'')
    if is_numeric(string2) % value found, must find unit now
        value = string2;
    end
end
 
% if values and units not found the easy way, search based on regular
% expressions

expression = '[0123456789]';

if strcmp(value,'') || strcmp(unit,'') 
    if regexp(string1,expression)
        startIndex = regexp(string1,expression);
        value = string1(startIndex:length(string1));
        unit = string2;
    else
        startIndex = regexp(string2,expression);
        value = string2(startIndex:length(string2));
        unit = string1;
    end
end
end

