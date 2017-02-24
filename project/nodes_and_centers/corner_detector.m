% load image
path1 = './images/selfmade/circuits/';
I = rgb2gray(imread([path1 'circuit_0' int2str(cir_number) 'b.png'])); % circuit image used for detection
centers = [];
centers_counter = 1;
% Harris corner detector
C = corner(I);
harris_margin = 0.12;

%% Resistors
% find Euclidean distances from element centers
distances = [];
for j = 1:length(resistors)
    centers(centers_counter,1) = resistors(j).center(1);
    centers(centers_counter,2) = resistors(j).center(2);
    centers_counter = centers_counter + 1;
    for i = 1:length(C)
        distances(i,j) = Euclidean(resistors(j).center(1),resistors(j).center(2),C(i,1),C(i,2));
    end
end
% zero those points that are near to the centers
distances_range = [];
for j = 1:length(resistors)
    distances_range(j) = max(distances(:,j)) - min(distances(:,j));
    for i = 1:length(C)
        if distances(i,j) < harris_margin * distances_range(j)
            C(i,:) = 0;
        end
    end
end
%% Voltages
distances = [];
for j = 1:length(voltages)
    centers(centers_counter,1) = voltages(j).center(1);
    centers(centers_counter,2) = voltages(j).center(2);
    centers_counter = centers_counter + 1;
    for i = 1:length(C)
        distances(i,j) = Euclidean(voltages(j).center(1),voltages(j).center(2),C(i,1),C(i,2));
    end
end
% zero those points that are near to the centers
distances_range = [];
for j = 1:length(voltages)
    distances_range(j) = max(distances(:,j)) - min(distances(:,j));
    for i = 1:length(C)
        if distances(i,j) < harris_margin * distances_range(j)
            C(i,:) = 0;
        end
    end
end
%% Currents
distances = [];
for j = 1:length(currents)
    centers(centers_counter,1) = currents(j).center(1);
    centers(centers_counter,2) = currents(j).center(2);
    centers_counter = centers_counter + 1;
    for i = 1:length(C)
        distances(i,j) = Euclidean(currents(j).center(1),currents(j).center(2),C(i,1),C(i,2));
    end
end
% zero those points that are near to the centers
distances_range = [];
for j = 1:length(currents)
    distances_range(j) = max(distances(:,j)) - min(distances(:,j));
    for i = 1:length(C)
        if distances(i,j) < harris_margin * distances_range(j)
            C(i,:) = 0;
        end
    end
end
%% Remove words
margin = 2;
for i = 1:length(wordBox)
    for j = 1:length(C)
        if C(j,1)>wordBox(i,1)-margin && C(j,2)>wordBox(i,2)-margin
            if C(j,1)<(wordBox(i,1)+wordBox(i,3)+margin) && C(j,2)<(wordBox(i,2)+wordBox(i,4)+margin)
                C(j,:) = 0;
            end
        end
    end
end
% make a new vector of points
points = [];
counter = 1;
for i = 1:length(C)
    if C(i,1) ~= 0 && C(i,2) ~= 0
        points(counter,1) = C(i,1);
        points(counter,2) = C(i,2);
        counter = counter + 1;
    end
end
%% Remove points that are too close
for i = 1:length(points)
    for j = 1:length(points)
        if i ~= j
            euclidean_distance = Euclidean(points(i,1),points(i,2),points(j,1),points(j,2));
            if euclidean_distance < 10
                points(j,1) = -1;
                points(j,2) = -1;
            end
        end
    end
end
C = points;
% make a new vector of points
points = [];
counter = 1;
for i = 1:length(C)
    if C(i,1) ~= -1 && C(i,2) ~= -1
        points(counter,1) = C(i,1);
        points(counter,2) = C(i,2);
        counter = counter + 1;
    end
end

clear path1 margin j I i centers_counter euclidean_distance
clear distances_range distances counter C wordBox