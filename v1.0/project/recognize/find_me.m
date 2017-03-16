function [ centers, component_number ] = find_me( circuit, component, detection_threshold, clustering_threshold )
    % [ centers, component_number ] = find_me( circuit, component, detection_threshold, clustering_threshold ) 
    % finds component on circuit image 
    % *centers* are the places on image where a certain component is found
    % *component_number* is the number of times that component apears on
    % the image
    % set detection_threshold and clusterin_threshold to have the right
    % results
    
    % detect component on circuit
    detector;
    % find number of components
    clustering;
    if component_not_found == 1
        centers = 0; 
        component_number = 0;
    end
end

