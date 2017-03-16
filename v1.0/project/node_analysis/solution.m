x = inv(A) * z;
voltage_number = 1;

path1 = './images/selfmade/circuits/';
I = rgb2gray(imread([path1 'circuit_0' int2str(cir_number) 'b.png'])); 

for i = 1:length(x)
    if i <= length(nodes)
        strin = strcat('node ', num2str(i), ' = ', num2str(x(i)), ' volts');
        position = [nodes{i}{1}(1) nodes{i}{1}(2)];
        I = insertText(I,position,strin,'FontSize',24,'TextColor','black');
    else
        % we put a minus sign to display the current direction correctly
        strin = strcat('voltage source of ',num2str(z(i)),' volts = ',num2str(-x(i)),' Amperes');
        position = voltages(voltage_number).center;
        I = insertText(I,position,strin,'FontSize',24,'TextColor','black');
        voltage_number = voltage_number + 1;
    end
end

imshow(I)

clear i x z voltage_number strin position path1