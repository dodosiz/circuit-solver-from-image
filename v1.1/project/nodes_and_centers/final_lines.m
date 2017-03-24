% choose the non duplicated lines
unique_lines = {};
counter = 1;
for i = 1:length(lines_approved)
    is_duplicated = 0;
    for j = 1:length(lines_approved)
        if i ~= j
            % two lines have the same value
            if lines_approved{i}(1) == lines_approved{j}(1)
                if lines_approved{i}(2) == lines_approved{j}(2) && lines_approved{i}(3) == lines_approved{j}(3)
                    is_duplicated = 1;
                end
            end
        end
    end
    if is_duplicated == 0
        % find the length of the approved line before registration
        first_point = reg_lines{lines_approved{i}(1),1};
        second_point = reg_lines{lines_approved{i}(1),2};
        length_of_line = int64(sqrt((second_point(1) - first_point(1)).^2 + (second_point(2) - first_point(2)).^2));
        % line number, center and length
        unique_lines(counter,1:4) = {lines_approved{i}(1) lines_approved{i}(2) lines_approved{i}(3) length_of_line};
        counter = counter + 1;
    end
end

% choose the line with the greatest length
for i = 1:length(unique_lines)
    % if the line is the longest the 1 will stay
    unique_lines{i,5} = 1;
end

% deletes an entry that consists of []
zero_line;
for i = 1:length(unique_lines(:,1))
    for j = (i+1):length(unique_lines(:,1))
        % centers are the same
        if unique_lines{i,2} == unique_lines{j,2} && unique_lines{i,3} == unique_lines{j,3}
            % the other line is longer
            if unique_lines{j,4} > unique_lines{i,4}
                unique_lines{j,5} = 0;
            else
                unique_lines{i,5} = 0;
            end
        end
    end
end

% register the final lines in a cell
final_results = {};
counter = 1;
for i = 1:length(unique_lines(:,1))
    % the line is the longest
    if unique_lines{i,5} == 1
        line_number = unique_lines{i,1};
        % final_results = [first node] [second node] center.x center.y
        final_results(counter,1:4) = {reg_lines{line_number,1} reg_lines{line_number,2} unique_lines{i,2:3}};
        counter = counter + 1;
    end
end

clear counter first_point i is_duplicated j length_of_line
clear line_number lines_approved points reg_lines
clear second_point unique_lines
clear harris_margin

