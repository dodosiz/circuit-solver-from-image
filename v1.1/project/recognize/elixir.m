% Many components get wrongly chosen, because we didn't define precisely
% the parameters. In this case, this script selects the right components,
% based on the Euclidean distance between the component centre and the edge
% of the wordBox, which contains the value of the respective component, as
% an example 'Ohm' for resistor.

% if there are resistors, find the right ones
if resistorTemp.component_number > 0
    distances = []; % this array will contain the distances from the wordBox edge
    indexR = 1; % this index will be used to register the component data
    for i=1:length(words)
        if strcmp(words(i),'Ohm') % if you find the value-word
            % resistor on place i
            boxCornerX = wordBox(i,1);
            boxCornerY = wordBox(i,2);
            % register all the distances between centres and wordBox edges
            for j = 1:length(resistorTemp.centers(:,1))
                resistorX = resistorTemp.centers(j,1);
                resistorY = resistorTemp.centers(j,2);
                distances(j) = Euclidean(boxCornerX,boxCornerY,resistorX,resistorY);
            end
            % find the smallest distance, this will be the actual component
            for j = 1:length(distances)
                if distances(j) == min(distances)
                    resistor.centers(indexR,1) = resistorTemp.centers(j,1);
                    resistor.centers(indexR,2) = resistorTemp.centers(j,2);
                    indexR = indexR + 1;
                end
            end
        end
    end
    resistor.component_number = indexR - 1;
end

% find the voltage sources, follow the same method
if resistorTemp.component_number > 0
    distances = [];
    indexV = 1;
    for i=1:length(words)
        if strcmp(words(i),'Volt')
            % voltage source on place i
            boxCornerX = wordBox(i,1);
            boxCornerY = wordBox(i,2);
            for j = 1:length(voltageTemp.centers(:,1))
                voltageX = voltageTemp.centers(j,1);
                voltageY = voltageTemp.centers(j,2);
                distances(j) = Euclidean(boxCornerX,boxCornerY,voltageX,voltageY);
            end
            for j = 1:length(distances)
                if distances(j) == min(distances)
                    voltage.centers(indexV,1) = voltageTemp.centers(j,1);
                    voltage.centers(indexV,2) = voltageTemp.centers(j,2);
                    indexV = indexV + 1;
                end
            end
        end
    end
    voltage.component_number = indexV - 1;
end

% find the current sources, follow the same method again
if currentTemp.component_number > 0
    distances = [];
    indexC = 1;
    for i=1:length(words)
        if strcmp(words(i),'A')
            % current source on place i
            boxCornerX = wordBox(i,1);
            boxCornerY = wordBox(i,2);
            for j = 1:length(currentTemp.centers(:,1))
                currentX = currentTemp.centers(j,1);
                currentY = currentTemp.centers(j,2);
                distances(j) = Euclidean(boxCornerX,boxCornerY,currentX,currentY);
            end
            for j = 1:length(distances)
                if distances(j) == min(distances)
                    current.centers(indexC,1) = currentTemp.centers(j,1);
                    current.centers(indexC,2) = currentTemp.centers(j,2);
                    indexC = indexC + 1;
                end
            end
        end
    end
    current.component_number = indexC - 1;
end

clear boxCornerX boxCornerY currentTemp currentX currentY
clear distances i indexC indexR indexV j resistorTemp resistorX
clear resistorY voltageTemp voltageX voltageY