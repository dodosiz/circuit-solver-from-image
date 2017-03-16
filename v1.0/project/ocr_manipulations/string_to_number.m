%% string_to_number script converts the previously string-type instance
% variable value to a number
RESISTORS_NUMBER = length(resistors);
INDUCTORS_NUMBER = length(inductors);
CAPACITORS_NUMBER = length(capacitors);
CURRENTS_NUMBER = length(currents);
VOLTAGES_NUMBER = length(voltages);
% convert string value to number for resistors
for i = 1:RESISTORS_NUMBER
    value = resistors(i).value;
    resistors(i).value = str2double(value);
end
% convert string value to number for inductors
for i = 1:INDUCTORS_NUMBER
    value = inductors(i).value;
    inductors(i).value = str2double(value);
end
% convert string value to number for capacitors
for i = 1:CAPACITORS_NUMBER
    value = capacitors(i).value;
    capacitors(i).value = str2double(value);
end
% convert string value to number for currents
for i = 1:CURRENTS_NUMBER
    value = currents(i).value;
    currents(i).value = str2double(value);
end
% convert string value to number for voltages
for i = 1:VOLTAGES_NUMBER
    value = voltages(i).value;
    voltages(i).value = str2double(value);
end
clear RESISTORS_NUMBER INDUCTORS_NUMBER CAPACITORS_NUMBER
clear CURRENTS_NUMBER VOLTAGES_NUMBER i value


