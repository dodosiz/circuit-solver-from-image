% initialize A array
A = [];
dimension = length(nodes) + length(voltages);
N = length(nodes);
M = length(voltages);
for i = 1:dimension
    for j = 1:dimension
        A(i,j) = 0;
    end
end

% fill G part of A array
for i = 1:length(nodes)
    for j = 1:length(nodes)
        % diagonal in array
        if i == j
            node = nodes{i}{1};
            for k = 1:length(resistors)
                % resistor is connected with node
                if (resistors(k).node1(1) == node(1) && resistors(k).node1(2) == node(2)) || (resistors(k).node2(1) == node(1) && resistors(k).node2(2) == node(2))
                    A(i,j) = A(i,j) + 1/resistors(k).value;
                end
            end
        else
            % here we have two nodes
            node1 = nodes{i}{1};
            node2 = nodes{j}{1};
            for k = 1:length(resistors)
                % resistor is connected with node1 and node2
                if (resistors(k).node1(1) == node1(1) && resistors(k).node1(2) == node1(2)) || (resistors(k).node2(1) == node1(1) && resistors(k).node2(2) == node1(2))
                    if (resistors(k).node1(1) == node2(1) && resistors(k).node1(2) == node2(2)) || (resistors(k).node2(1) == node2(1) && resistors(k).node2(2) == node2(2))
                        A(i,j) = A(i,j) - 1/resistors(k).value;
                    end
                end
            end
        end
    end
end

% fill B and C part of A array
for i = 1:length(nodes)
    for j = 1:length(voltages)
        if nodes{i}{1}(1) == voltages(j).positive(1) && nodes{i}{1}(2) == voltages(j).positive(2)
            A(i,N+j) = 1;
            A(N+j,i) = 1;
        end
        if nodes{i}{1}(1) == voltages(j).negative(1) && nodes{i}{1}(2) == voltages(j).negative(2)
            A(i,N+j) = -1;
            A(N+j,i) = -1;
        end
    end
end

clear dimansion i j k node node1 node2 M N