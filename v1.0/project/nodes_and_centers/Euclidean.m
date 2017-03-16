function [ distance ] = Euclidean( Point1x, Point1y, Point2x, Point2y )
%Euclidean Finds the euclidean distance of two points

distance = sqrt(double((Point2x - Point1x)^2 + (Point2y - Point1y)^2));

end

