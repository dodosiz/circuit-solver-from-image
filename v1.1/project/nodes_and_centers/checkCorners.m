% copy all Harris Corners into testPoints
testPoints(:,:) = points(:,:);
% how wide will the span be (look at for loops)
span = 15;
% iterate through all points
for k = 1:length(testPoints(:,1))
    % initialize sum array
    sum = [0, 0, 0, 0];
    % set x and y coordinates
    x = testPoints(k,2);
    y = testPoints(k,1);
    % fill each field of sum array
    for j = 1:4
        switch j
            % from top to bottom
            case 1
                for i = 1:span
                    if I(x + i, y) < 240
                        sum(j) = sum(j) + 1;
                    end
                end
            % from left to right
            case 2
                for i = 1:span
                    if I(x, y + i) < 240
                        sum(j) = sum(j) + 1;
                    end
                end
            % from bottom to top
            case 3
                for i = 1:span
                    if I(x - i, y) < 240
                        sum(j) = sum(j) + 1;
                    end
                end
            % from right to left
            case 4
                for i = 1:span
                    if I(x, y - i) < 240
                        sum(j) = sum(j) + 1;
                    end
                end
        end
    end
    % check if you have a corner, from the values in sum
    sortSum = sort(sum, 'descend');
    % find first and second max value
    for j = 1:2
        for i = 1:4
            if sortSum(j) == sum(i)
                maxVal(j) = i;
                sum(i) = 0;
                break
            end
        end
    end
    % this is not a corner
    if (maxVal(1) == 1 && maxVal(2) == 3) || (maxVal(2) == 1 && maxVal(1) == 3)
        testPoints(k,3) = 0;
    % this is also not a corner    
    elseif (maxVal(1) == 2 && maxVal(2) == 4) || (maxVal(2) == 2 && maxVal(1) == 4)
        testPoints(k,3) = 0;
    % this will be a corner
    else
        testPoints(k,3) = 1;
    end
end

clear points
j = 1;
for i = 1:length(testPoints(:,1))
    if testPoints(i,3) == 1
        points(j,1) = testPoints(i,1);
        points(j,2) = testPoints(i,2);
        j = j + 1;
    end
end