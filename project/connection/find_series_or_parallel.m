%% find_series_or_parallel is a script that takes each element
% and finds whether it's connected serial or parallel

% USEFULL PARAMETERS
% number of each element category
RESISTORS_NUMBER = length(resistors);
INDUCTORS_NUMBER = length(inductors);
CAPACITORS_NUMBER = length(capacitors);
CURRENTS_NUMBER = length(currents);
VOLTAGES_NUMBER = length(voltages);
SERIES = 0; % used later to indicate if an element is connected serial
PARALLEL = 0;
y_coordinates = []; % an array of all the y-axis element coordinates
counter = 1; % just a typical counter
% SAVE EACH Y-AXIS COORDINATE IN AN ARRAY
for i = 1:RESISTORS_NUMBER
    y_coordinates(counter) = resistors(i).center(2);
    resistors(i).place = counter; % place is a variable that helps us later
    counter = counter +1;
end
for i = 1:INDUCTORS_NUMBER
    y_coordinates(counter) = inductors(i).center(2);
    inductors(i).place = counter;
    counter = counter +1;
end
for i = 1:CAPACITORS_NUMBER
    y_coordinates(counter) = capacitors(i).center(2);
    capacitors(i).place = counter;
    counter = counter +1;
end
for i = 1:CURRENTS_NUMBER
    y_coordinates(counter) = currents(i).center(2);
    currents(i).place = counter;
    counter = counter +1;
end
for i = 1:VOLTAGES_NUMBER
    y_coordinates(counter) = voltages(i).center(2);
    voltages(i).place = counter;
    counter = counter +1;
end

% CLUSTER THE COORDINATES INTO TWO CLUSTERS AND DETERMINE IF PARALLEL OR SERIES
y_coordinates = y_coordinates';
categories = kmeans(y_coordinates,2);
index_in_categories1 = find(categories==1,1);
index_in_categories2 = find(categories==2,1);
if y_coordinates(index_in_categories1) < y_coordinates(index_in_categories2) % the higher an element sits
    SERIES = 1;                                                              % means that it is connected
    PARALLEL = 2;                                                            % serial with the rest of the circuit
else
    SERIES = 2;
    PARALLEL = 1;
end

% SAVE CONNECTION STATUS IN INSTANCE VARIABLE CONNECTION
for i = 1:RESISTORS_NUMBER
    if categories(resistors(i).place) == SERIES
        resistors(i).connection = 'series';
    else
        resistors(i).connection = 'parallel';
    end
end
for i = 1:INDUCTORS_NUMBER
    if categories(inductors(i).place) == SERIES
        inductors(i).connection = 'series';
    else
        inductors(i).connection = 'parallel';
    end
end
for i = 1:CAPACITORS_NUMBER
    if categories(capacitors(i).place) == SERIES
        capacitors(i).connection = 'series';
    else
        capacitors(i).connection = 'parallel';
    end
end
for i = 1:CURRENTS_NUMBER
    if categories(currents(i).place) == SERIES
        currents(i).connection = 'series';
    else
        currents(i).connection = 'parallel';
    end
end
for i = 1:VOLTAGES_NUMBER
    if categories(voltages(i).place) == SERIES
        voltages(i).connection = 'series';
    else
        voltages(i).connection = 'parallel';
    end
end

% CLEAR ALL TRASH
if RESISTORS_NUMBER > 0
    resistors = rmfield(resistors,'place');
end
if INDUCTORS_NUMBER > 0
    inductors = rmfield(inductors,'place');
end
if CAPACITORS_NUMBER > 0
    capacitors = rmfield(capacitors,'place');
end
if VOLTAGES_NUMBER > 0
    voltages = rmfield(voltages,'place');
end
if CURRENTS_NUMBER > 0
    currents = rmfield(currents,'place');
end
clear CAPACITORS_NUMBER categories counter CURRENTS_NUMBER
clear i index_in_categories1 index_in_categories2
clear INDUCTORS_NUMBER PARALLEL RESISTORS_NUMBER
clear SERIES VOLTAGES_NUMBER y_coordinates
