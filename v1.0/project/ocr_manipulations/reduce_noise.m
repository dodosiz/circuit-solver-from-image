% find if a word isn't a number or a value and delete it
for i = 1:length(words)
    if (is_numeric(words{i}) == 0) && (has_unit(words{i}) == -1)
        words{i} = 'delete';
        for j = 1:length(wordBox(i,:))
            wordBox(i,j) = 0;
        end
    end
end

new_words = {};
new_box = [];
counter = 1;
for i = 1:length(words)
    if ~strcmp(words{i},'delete')
        new_words{counter} = words{i};
        for j = 1:length(wordBox(i,:))
            new_box(counter,j) = wordBox(i,j);
        end
        counter = counter + 1;
    end
end
new_words = new_words';

clear words wordBox
clear i j counter
words = new_words;
wordBox = new_box;
clear new_words new_box