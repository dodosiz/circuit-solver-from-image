function [ position ] = has_unit( string1 )
% [ position ] = has_unit( string1 )
% checks if string1 contains substring 'Ohm', 'mH', 'nF', 'V' or
% 'A' and returns position
ohm = 0; henry = 0; farad = 0; volt = 0; amper = 0;
ohm = strfind(string1, 'Ohm');
henry = strfind(string1, 'mH');
farad = strfind(string1, 'nF');
volt = strfind(string1, 'V');
amper = strfind(string1, 'A');

% find which value does the string contain and store it in a variable
% containing the position of the value substring

position = 0; % it will stay zero if no unit is found
if ohm
    position = ohm;
elseif henry
    position = henry;
elseif farad
    position = farad;
elseif volt
    position = volt;
elseif amper
    position = amper;
else 
    position = -1;
end


end

