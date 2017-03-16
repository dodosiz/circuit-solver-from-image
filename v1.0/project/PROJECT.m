tic;
addpath('.\recognize');
addpath('.\ocr_manipulations');
addpath('.\connection');
addpath('.\classes');
addpath('.\nodes_and_centers');
addpath('.\node_analysis');
addpath('.\parameters');
%% Step 1 - define usefull parameters
warning('off'); %#ok<WNOFF>
parameters;
cir_number = 9; % which circuit you want to solve

%% Step 2 - recognize characters
[words, wordBox] = ocrOnCircuit(cir_number);
delete_numbers;

%% Step 3 - find data of each component
resistor = COMPONENT;                                                     % detection and clustering are not functions
[resistor.centers, resistor.component_number] = componentData('resistor', detection(cir_number,1), clustering(cir_number, 1), cir_number);
capacitor = COMPONENT;
[capacitor.centers, capacitor.component_number] = componentData('capacitor', detection(cir_number, 2), clustering(cir_number, 2), cir_number);
inductor = COMPONENT;
[inductor.centers, inductor.component_number] = componentData('inductor', detection(cir_number, 3), clustering(cir_number, 3), cir_number);
voltage = COMPONENT;
[voltage.centers, voltage.component_number] = componentData('voltage', detection(cir_number, 4), clustering(cir_number, 4), cir_number);
current = COMPONENT;
[current.centers, current.component_number] = componentData('current', detection(cir_number, 5), clustering(cir_number, 5), cir_number);
clear detection clustering;
%% Step 4 - filter the words for better results
find_words;
string_to_number; % convert instance variable value to a number
find_series_or_parallel; % save to instance variable connection the type of connection
clear resistor capacitor inductor voltage current;
clear i index1 index2 x y z component_number;
clear words iteration;
%% Step 5 - find the nodes and centers on the circuit
% define parameters
parameters2;
corner_detector; % DEBUG HERE
clear path1 margin j I i centers_counter euclidean_distance
clear distances_range distances counter C wordBox
lines;
near_from_center; % DEBUG HERE
final_lines;
clear harris_margin
%% Step 6 - estimate the source (voltage or current) orientation
voltageSourceRotation;
currentSourceRotation;
clear plotting
%% Step 7 - Solve the circuit using modified nodal analysis
chooseNodes;
nodeConnectionWithComponent;
disconnected;
A_array;
z_matrix;
solution;
toc;