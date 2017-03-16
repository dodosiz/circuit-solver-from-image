lines_approved = {};
counter = 1;

% distance margin for a line to be approved
vertical_margin = vertical_margin(cir_number);
normal_margin = normal_margin(cir_number);

for i = 1:length(centers)
    y_center = centers(i,2);
    x_center = centers(i,1);
    for step=1:length(reg_lines)
    % in case of a vertical line
        if isempty(reg_lines{step,3})
            % find the point to start
            if reg_lines{step,1}(2) < reg_lines{step,2}(2)
                start_point = reg_lines{step,1};
                end_point = reg_lines{step,2};
            else
                % the oposite from before
                start_point = reg_lines{step,2};
                end_point = reg_lines{step,1};
            end
            x_point = start_point(1);
            for y_point = start_point(2):end_point(2)
                % check the distance
                if abs(y_point - y_center) < vertical_margin
                    if abs(x_point - x_center) < vertical_margin
                        % line is near from center
                        lines_approved{counter} = [step [x_center y_center]];
                        counter = counter + 1;
                        break
                    end
                end
            end
        else
            % find the point to start
            if reg_lines{step,1}(1) < reg_lines{step,2}(1)
                start_point = reg_lines{step,1};
                end_point = reg_lines{step,2};
            else
                % the oposite from before
                start_point = reg_lines{step,2};
                end_point = reg_lines{step,1};
            end
            for x_point = start_point(1):end_point(1)
                y_point = int64(reg_lines{step,3}*x_point + reg_lines{step,4});
                % check the distance
                if abs(y_point - y_center) < normal_margin
                    if abs(x_point - x_center) < normal_margin
                        % line is near from center
                        lines_approved{counter} = [step [x_center y_center]];
                        counter = counter + 1;
                        break
                    end
                end
            end
        end
    end
end