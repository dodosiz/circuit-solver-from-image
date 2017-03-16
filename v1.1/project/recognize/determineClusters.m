function [ estimation ] = determineClusters( vector, threshold )
% [ estimation ] = determineClusters( vector, threshold ) 
% determines the optimum number of clusters to use for the kmeans method
%
% *vector* are the centers of the clusters returned from kmeans() method
% *threshold* is the minimum acceptable distance between the centers
%
% *estimation* is equal to 1 if the centers have a distance smaller than
% threshold and 0 otherwise
%
estimation = 0;
for i=1:length(vector)
    for j=1:length(vector)
        if j~=i
            if abs(vector(j,1)-vector(i,1))<threshold && abs(vector(j,2)-vector(i,2))<threshold
                estimation = 1;
            end
        end
    end
end

end

