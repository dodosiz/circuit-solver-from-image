function [ centers, component_number ] = componentData( type, detectionParam, clusteringParam, circuit_number )
%% [ centers, component_number ] = componentData( type, detectionParam, clusteringParam, circuit_number ) 
% returns the usefull data of a component
%
% *type* can be one of {'resistor','inductor','capacitor','voltage','current'}
% *detectionParam* is the SURF threshold
% *clusteringParam* is the cluster radius threshold
% *ocr_value* is 1 if we want ocr or 0 if we don't
path1='./images/selfmade/circuits/';
path2='./images/selfmade/components/';
% --------------------Load component--------------------
component = rgb2gray(imread([path2 type '.png'])); % component image to detect
% --------------------Load circuit--------------------
circuit = rgb2gray(imread([path1 'circuit_0' num2str(circuit_number) 'b.png'])); % circuit image used for detection
% --------------------Find------------------------------
currComponent = COMPONENT;
[currComponent.centers, currComponent.component_number] = find_me(circuit, component, detectionParam, clusteringParam);
centers = currComponent.centers;
component_number = currComponent.component_number;
end

