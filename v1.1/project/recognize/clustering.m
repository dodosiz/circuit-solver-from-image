%% clustering is a script that takes previously defined interest points, clusters
% them into groups and finds the center of each cluster
component_not_found = 1;
% -----------------DEBUGGING--------------------
% clustering_threshold = 200; % see for component_number but first run detector
% -----------------END--------------------

% --------------For many matched points--------------------
if cirMatchedPoints.Count > 2
    component_not_found = 0;
    for estimation=2:6
        [idx, centers] = kmeans( cirMatchedPoints.Location, estimation );
        if determineClusters(centers, clustering_threshold)==1
            break
        end
    end
    [idx, centers] = kmeans( cirMatchedPoints.Location, estimation-1 );
    component_number = estimation - 1;
end

% --------------------------------If matched points are only 2-----------
if cirMatchedPoints.Count == 2 && determineClusters( cirMatchedPoints.Location, clustering_threshold ) == 0 % there are two points that are far
    component_not_found = 0;
    centers = cirMatchedPoints.Location;
    component_number = 2;
end 
if cirMatchedPoints.Count == 2 && determineClusters( cirMatchedPoints.Location, clustering_threshold ) == 1 % there are two points that are near
    component_not_found = 0;
    for estimation=2:6
        [idx, centers] = kmeans( cirMatchedPoints.Location, estimation );
        if determineClusters(centers, clustering_threshold)==1
            break
        end
    end
    [idx, centers] = kmeans( cirMatchedPoints.Location, estimation-1 );
    component_number = estimation - 1;
end

% -----------------------------If you only have 1 matched point-------
if cirMatchedPoints.Count == 1
    component_not_found = 0;
    centers = cirMatchedPoints.Location;
    component_number = 1;
end

% -----------------DEBUGGING PRINT----------------
% if component_not_found == 0
%     component_number
% else
%     component_not_found
% end
% -----------------------END-----------------------