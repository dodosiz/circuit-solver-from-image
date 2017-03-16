%% detector uses the SURF algorithm to find features on an image and
% on a test image, then matches both features and plots them

% -----------------DEBUGGING--------------------
% circuit = rgb2gray(imread('./images/selfmade/circuits/circuit_09b.png'));
% component = rgb2gray(imread('./images/selfmade/components/resistor.png'));
% 
% detection_threshold = 500;
% -----------------END--------------------

% ----------------PLOT CONTROL---------------
show_me = 0; % 1 to plot results
% -----------------END-----------------------

% detect SURF points
cirPoints = detectSURFFeatures(circuit);
cirPoints = cirPoints.selectStrongest(detection_threshold);
compPoints = detectSURFFeatures(component);

% extract features
[cirFeatures1, cirPoints] = extractFeatures(circuit,cirPoints);
[compFeatures1, compPoints] = extractFeatures(component,compPoints);

% find location of matching points
indexPairs = matchFeatures(cirFeatures1,compFeatures1);

% plot the points
cirMatchedPoints = cirPoints(indexPairs(:,1),:);
compMatchedPoints = compPoints(indexPairs(:,2),:);
if show_me == 1  
    figure; 
    showMatchedFeatures(circuit,component,cirMatchedPoints,compMatchedPoints);
end