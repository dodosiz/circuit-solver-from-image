classdef Line
    %Line represents a line on image
    % with the line's equation
    
    properties
        % for regular lines
        slope = 0;
        b = 0;
        % for vertical lines
        is_vertical = 0;
        % the start and end point on image
        start_point = [];
        end_point = [];
    end
    
    methods
        function [values] = Properties(line)
            values = {};
            if line.is_vertical
                values(1,1:2) = {line.start_point  line.end_point};
            else
                values(1,1:4) = {line.start_point line.end_point line.slope line.b};
            end
        end
    end
    
end

