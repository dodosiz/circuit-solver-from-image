function [words, wordBox] = ocrOnCircuit(cir_number)
    % [words, wordBox] = ocrOnCircuit(cir_number)
    % applies the optical character recognition algorithm on the image
    % and plots the results
    
    % ----------------PLOT CONTROL---------------
    show_me = 0; % 1 to plot results
    % -----------------END-----------------------

    path1 = './images/selfmade/circuits/';
    I = rgb2gray(imread([path1 'circuit_0' int2str(cir_number) 'b.png'])); % circuit image used for detection
    I = imbinarize(I);
    SE = strel('diamond', 1);
    I = double(imdilate(I,SE));
    % Perform OCR
    results = ocr(I, 'TextLayout', 'Auto');

    % Recognized words
    words = results.Words;

    % Location of recognized words
    wordBox = results.WordBoundingBoxes;
    
    % delete from the results the wrong values
    reduce_noise;
    
    % Show the location of the words in the original image
    if show_me == 1
        figure;
        Iname = insertObjectAnnotation(I, 'rectangle', wordBox, words);
        imshow(Iname);
    end
end