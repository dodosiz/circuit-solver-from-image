% initialize Z matrix
z = [];
dimension = length(nodes) + length(voltages);
for i = 1:dimension
    z(i,1) = 0;
end

% fill the i part
for i = 1:length(nodes)
    for j = 1:length(currents)
        % positive end of current source is connected with node
        if nodes{i}{1}(1) == currents(j).positive(1) && nodes{i}{1}(2) == currents(j).positive(2)
            z(i,1) = z(i,1) + currents(j).value;
        end
        % negative end of current source is connected with node
        if nodes{i}{1}(1) == currents(j).negative(1) && nodes{i}{1}(2) == currents(j).negative(2)
            z(i,1) = z(i,1) - currents(j).value;
        end
    end
    ending = i;
end

% fill the e part
for i = 1:length(voltages)
    z(ending+i,1) = voltages(i).value;
end

clear dimension ending i j