%% disconnected is a script that finds resistors not connected
% to the main nodes and adds them with one connected

% find the disconnected resistors
for i=1:length(resistors)
    resistors(i).connected = 0;
    % iterate through all nodes
    for j=1:length(nodes)
        % if the nodes of the resistor happen to be selected
        if nodes{j}{1} == resistors(i).node1
            resistors(i).connected = 1;
        end
        if nodes{j}{1} == resistors(i).node2
            resistors(i).connected = 1;
        end
    end
end

% replace the disconnected nodes with connected ones
for i=1:length(resistors)
    % if you find a disconnected resistor
    if resistors(i).connected == 0;
        for j=1:length(resistors)
            % iterate through all the other resistors
            if j ~= i
                % when one of the two nodes is equal
                if resistors(i).node1 == resistors(j).node1
                    % and the other resistor happens to be connected
                    if resistors(j).connected == 1
                        % then sum up the two registors
                        resistors(j).value = resistors(j).value + resistors(i).value;
                    end
                end
                if resistors(i).node2 == resistors(j).node2
                    if resistors(j).connected == 1
                        resistors(j).value = resistors(j).value + resistors(i).value;
                    end
                end
                % check also diagonal matchings they can be a headache
                if resistors(i).node2 == resistors(j).node1
                    if resistors(j).connected == 1
                        resistors(j).value = resistors(j).value + resistors(i).value;
                    end
                end
                if resistors(i).node1 == resistors(j).node2
                    if resistors(j).connected == 1
                        resistors(j).value = resistors(j).value + resistors(i).value;
                    end
                end
            end
        end
    end
end