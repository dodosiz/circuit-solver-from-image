addpath('.\recognize');
addpath('.\ocr_manipulations');
addpath('.\classes');
addpath('.\nodes_and_centers');
addpath('.\node_analysis');

%% Step 1 - define usefull parameters
warning('off'); %#ok<WNOFF>
cir_number = 8; % which circuit you want to solve

%% Step 2 - recognize characters
[words, wordBox] = ocrOnCircuit(cir_number);
delete_numbers;

%% Step 3 - find data of each component
resistorTemp = COMPONENT;
[resistorTemp.centers, resistorTemp.component_number] = componentData('resistor', 200, 200, cir_number);
voltageTemp = COMPONENT;
[voltageTemp.centers, voltageTemp.component_number] = componentData('voltage', 200, 200, cir_number);
currentTemp = COMPONENT;
[currentTemp.centers, currentTemp.component_number] = componentData('current', 200, 200, cir_number);
resistor = COMPONENT;
voltage = COMPONENT;
current = COMPONENT;
elixir; % delete temporary components

%% Step 4 - filter the words for better results
find_words;
string_to_number; % convert instance variable value to a number

%% Step 5 - find the nodes and centers on the circuit
corner_detector;
lines;
near_from_center;
final_lines;

%% Step 6 - estimate the source (voltage or current) orientation
voltageSourceRotation;
currentSourceRotation;

%% Step 7 - Solve the circuit using modified nodal analysis
chooseNodes;
nodeConnectionWithComponent;
disconnected;
A_array;
z_matrix;
solution;
