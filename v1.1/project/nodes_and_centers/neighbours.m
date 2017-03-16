function [ is_line ] = neighbours( x, y, I )
% neighbours finds the 3x3 neighbourhood of (x,y)
% point on image I and determines if it is on a line

condition = I(y,x) == 1 && I(y+1,x) == 1 && I(y-1,x) == 1 && I(y,x+1) == 1 && I(y,x-1) == 1 && I(y+1,x+1) == 1 && I(y-1,x-1) == 1 && I(y+1,x-1) == 1 && I(y-1,x+1) == 1;

if condition
    is_line = 0;
else
    is_line = 1;
end

end

