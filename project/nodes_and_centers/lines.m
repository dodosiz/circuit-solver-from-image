% load an image
path1 = './images/selfmade/circuits/';
I = rgb2gray(imread([path1 'circuit_0' int2str(cir_number) 'b.png'])); % circuit image used for detection
I = imbinarize(I);
reg_lines = {};
lines_count = 1;
% choose one point
for j = 1:length(points)
    xj = points(j,1);
    yj = points(j,2);
    % make all posible pairs of points
    for i = j+1:length(points)
        % some margins used to find lines
        bucket = 0;
        buttom = 40;
        xi = points(i,1);
        yi = points(i,2);
        % compute the line equation
        slope = (yi-yj)/(xi-xj);
        b = yj - slope * xj;
        % if the line is vertical (slope = inf)
        if xj == xi || abs(slope) > 70
            if yi < yj
                for y = yi:yj
                    bucket = bucket + neighbours(xj,y,I);
                end
                if bucket > buttom
                    % asign data into a line object
                    line1 = Line;
                    line1.start_point = [xj yj];
                    line1.end_point = [xi yi];
                    line1.is_vertical = 1;
                    line1.slope = 0;
                    line1.b = 0;
                    reg_lines(lines_count,1:2) = Properties(line1);
                    lines_count = lines_count + 1;
                end
            else
                for y = yi:-1:yj
                    bucket = bucket + neighbours(xj,y,I);
                end
                if bucket > buttom
                    % asign data into a line object
                    line1 = Line;
                    line1.start_point = [xj yj];
                    line1.end_point = [xi yi];
                    line1.is_vertical = 1;
                    line1.slope = 0;
                    line1.b = 0;
                    reg_lines(lines_count,1:2) = Properties(line1);
                    lines_count = lines_count + 1;
                end
            end
        % if it is a normal line
        else
            if xi < xj
                for x = xi:xj
                    y = int64(slope*x+b);
                    bucket = bucket + neighbours(x,y,I);
                end
                if bucket > buttom
                    y = slope*x+b;
                    % asign data into a line object
                    line1 = Line;
                    line1.start_point = [xj yj];
                    line1.end_point = [xi yi];
                    line1.is_vertical = 0;
                    line1.slope = slope;
                    line1.b = b;
                    reg_lines(lines_count,1:4) = Properties(line1);
                    lines_count = lines_count + 1;
                end
            else
                for x = xi:-1:xj
                    y = int64(slope*x+b);
                    bucket = bucket + neighbours(x,y,I);
                end
                if bucket > buttom
                    % asign data into a line object
                    line1 = Line;
                    line1.start_point = [xj yj];
                    line1.end_point = [xi yi];
                    line1.is_vertical = 0;
                    line1.slope = slope;
                    line1.b = b;
                    reg_lines(lines_count,1:4) = Properties(line1);
                    lines_count = lines_count + 1;
                end
            end
        end
    end
end

clear b bucket buttom i I j line1 lines_count path1
clear slope x xi xj y yi yj