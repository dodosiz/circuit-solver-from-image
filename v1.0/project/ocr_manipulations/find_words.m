%% find_words matches each word from the ocr algorithm results to
% an existing element
x=wordBox(:,1:2);

%----------------RESISTOR-----------------
y=resistor.centers;
iteration = resistor.component_number;
resistors = [];
for i = 1:iteration
    resistors(i).center = int64(resistor.centers(i,:)); % round the result
    z = sum((ones(length(x(:,1)),1)*y(i,:)-x).^2,2);
    index1 = find(z==min(z),1);
    z(index1) = max(z);
    index2 = find(z==min(z),1);
    [resistors(i).unit, resistors(i).value] = string_value(cell2mat(words(index1)), cell2mat(words(index2)));
end

%----------------CAPACITOR-----------------
y=capacitor.centers;
iteration = capacitor.component_number;
capacitors = [];
for i = 1:iteration
    capacitors(i).center = int64(capacitor.centers(i,:));
    z = sum((ones(length(x(:,1)),1)*y(i,:)-x).^2,2);
    index1 = find(z==min(z),1);
    z(index1) = max(z);
    index2 = find(z==min(z),1);
    [capacitors(i).unit, capacitors(i).value] = string_value(cell2mat(words(index1)), cell2mat(words(index2)));
end

%----------------INDUCTOR-----------------
y=inductor.centers;
iteration = inductor.component_number;
inductors = [];
for i = 1:iteration
    inductors(i).center = int64(inductor.centers(i,:));
    z = sum((ones(length(x(:,1)),1)*y(i,:)-x).^2,2);
    index1 = find(z==min(z),1);
    z(index1) = max(z);
    index2 = find(z==min(z),1);
    [inductors(i).unit, inductors(i).value] = string_value(cell2mat(words(index1)), cell2mat(words(index2)));
end

%----------------VOLTAGE-----------------
y=voltage.centers;
iteration = voltage.component_number;
voltages = [];
for i = 1:iteration
    voltages(i).center = int64(voltage.centers(i,:));
    z = sum((ones(length(x(:,1)),1)*y(i,:)-x).^2,2);
    index1 = find(z==min(z),1);
    z(index1) = max(z);
    index2 = find(z==min(z),1);
    [voltages(i).unit, voltages(i).value] = string_value(cell2mat(words(index1)), cell2mat(words(index2)));
end

%----------------CURRENT-----------------
y=current.centers;
iteration = current.component_number;
currents = [];
for i = 1:iteration
    currents(i).center = int64(current.centers(i,:));
    z = sum((ones(length(x(:,1)),1)*y(i,:)-x).^2,2);
    index1 = find(z==min(z),1);
    z(index1) = max(z);
    index2 = find(z==min(z),1);
    [currents(i).unit, currents(i).value] = string_value(cell2mat(words(index1)), cell2mat(words(index2)));
end