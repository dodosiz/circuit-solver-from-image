% find and save the connected nodes to the resistor object
for i = 1:length(resistors)
    for j = 1:length(final_results(:,1))
        if resistors(i).center(1) == final_results{j,3} && resistors(i).center(2) == final_results{j,4}
            resistors(i).node1 = final_results{j,1};
            resistors(i).node2 = final_results{j,2};
        end
    end
end

% find positive and negative nodes connected with voltage sources
for i = 1:length(voltages)
    for j = 1:length(final_results(:,1))
        if voltages(i).center(1) == final_results{j,3} && voltages(i).center(2) == final_results{j,4}
            % up point is possitive and down negative
            if voltages(i).orientation > -45 && voltages(i).orientation < 45
                % y1 < y2
                if final_results{j,1}(2) < final_results{j,2}(2)
                    voltages(i).positive = final_results{j,1};
                    voltages(i).negative = final_results{j,2};
                else
                    voltages(i).positive = final_results{j,2};
                    voltages(i).negative = final_results{j,1};
                end
            % down point is possitive and up negative
            elseif voltages(i).orientation < -135 % added (i)
                % y1 > y2
                if final_results{j,1}(2) > final_results{j,2}(2)
                    voltages(i).positive = final_results{j,1};
                    voltages(i).negative = final_results{j,2};
                else
                    voltages(i).positive = final_results{j,2};
                    voltages(i).negative = final_results{j,1};
                end
            % left point is possitive and right negative
            elseif voltages(i).orientation > -135 && voltages(i).orientation < -45
                % x1 < x2
                if final_results{j,1}(1) < final_results{j,2}(1)
                    voltages(i).positive = final_results{j,1};
                    voltages(i).negative = final_results{j,2};
                else
                    voltages(i).positive = final_results{j,2};
                    voltages(i).negative = final_results{j,1};
                end
            % right point is possitive and left negative
            elseif voltages(i).orientation > 45 && voltages(i).orientation < 135
                % x1 > x2
                if final_results{j,1}(1) > final_results{j,2}(1)
                    voltages(i).positive = final_results{j,1};
                    voltages(i).negative = final_results{j,2};
                else
                    voltages(i).positive = final_results{j,2};
                    voltages(i).negative = final_results{j,1};
                end
            end
        end
    end
end

% find positive and negative nodes connected with current sources
for i = 1:length(currents)
    for j = 1:length(final_results(:,1))
        if currents(i).center(1) == final_results{j,3} && currents(i).center(2) == final_results{j,4}
            % up point is possitive and down negative
            if currents(i).orientation > -45 && currents(i).orientation < 45
                % y1 < y2
                if final_results{j,1}(2) < final_results{j,2}(2)
                    currents(i).positive = final_results{j,1};
                    currents(i).negative = final_results{j,2};
                else
                    currents(i).positive = final_results{j,2};
                    currents(i).negative = final_results{j,1};
                end
            % down point is possitive and up negative
            elseif currents(i).orientation < -135
                % y1 > y2
                if final_results{j,1}(2) > final_results{j,2}(2)
                    currents(i).positive = final_results{j,1};
                    currents(i).negative = final_results{j,2};
                else
                    currents(i).positive = final_results{j,2};
                    currents(i).negative = final_results{j,1};
                end
            % left point is possitive and right negative
            elseif currents(i).orientation > -135 && currents(i).orientation < -45
                % x1 < x2
                if final_results{j,1}(1) < final_results{j,2}(1)
                    currents(i).positive = final_results{j,1};
                    currents(i).negative = final_results{j,2};
                else
                    currents(i).positive = final_results{j,2};
                    currents(i).negative = final_results{j,1};
                end
            % right point is possitive and left negative
            elseif currents(i).orientation > 45 && currents(i).orientation < 135
                % x1 > x2
                if final_results{j,1}(1) > final_results{j,2}(1)
                    currents(i).positive = final_results{j,1};
                    currents(i).negative = final_results{j,2};
                else
                    currents(i).positive = final_results{j,2};
                    currents(i).negative = final_results{j,1};
                end
            end
        end
    end
end

clear i j