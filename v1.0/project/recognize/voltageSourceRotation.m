% Look at rotation_explanation.png to understand the result

% To plot results give 1
plotting = 0;

% Load two images
path1 = './images/selfmade/circuits/';
path2 = './images/selfmade/components/';
original = rgb2gray(imread([path1 'circuit_0' int2str(cir_number) 'b.png'])); % circuit image used for detection
original = imbinarize(original);
component = rgb2gray(imread([path2 'voltage.png']));
component = imbinarize(component);

% Iterate through each voltage source
for i = 1:length(voltages)
    voltCenter = voltages(i).center;
    
    % Detect SURF features on each image
    originalPoints = detectSURFFeatures(original,'ROI',[voltCenter(1)-60, voltCenter(2)-60, 160, 160]);
    compPoints = detectSURFFeatures(component);

    % Extract the features
    [originalFeatures, originalPoints] = extractFeatures(original,originalPoints);
    [compFeatures, compPoints] = extractFeatures(component,compPoints);

    % Find matched features
    indexPairs = matchFeatures(originalFeatures, compFeatures);
    matchedOriginal  = originalPoints(indexPairs(:,1));
    matchedComp = compPoints(indexPairs(:,2));

    % Plot them all together
    if plotting == 1
        showMatchedFeatures(original,component,matchedOriginal,matchedComp);
    end
    
    % Estimate the geometric transform using MSAC
    [tform] = estimateGeometricTransform(...
    matchedComp, matchedOriginal, 'similarity');
    
    % Compute the inverse transformation matrix
    Tinv  = tform.invert.T;
    ss = Tinv(2,1);
    sc = Tinv(1,1);
    
    % Result = angle of rotation
    theta_recovered = atan2(ss,sc)*180/pi;
    
    % Save the result in voltage object
    voltages(i).orientation = int64(theta_recovered);

end

clear compFeatures component compPoints i indexPairs
clear inlierComp inlierOriginal matchedComp matchedOriginal
clear original originalFeatures originalPoints path1 path2
clear sc ss tform Tinv voltCenter theta_recovered