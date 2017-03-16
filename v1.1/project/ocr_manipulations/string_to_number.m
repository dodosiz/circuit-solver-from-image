%% string_to_number script converts the previously string-type instance
% variable value to a number
RESISTORS_NUMBER = length(resistors);
CURRENTS_NUMBER = length(currents);
VOLTAGES_NUMBER = length(voltages);
% convert string value to number for resistors
for i = 1:RESISTORS_NUMBER
    value = resistors(i).value;
    resistors(i).value = str2double(value);
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

clear resistor capacitor inductor voltage current;
clear i index1 index2 x y z component_number;
clear words iteration;

