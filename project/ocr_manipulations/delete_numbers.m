% the purpose of this script is to delete consecutive cells in the word box
% array, wich are numbers

% wherever you find consecutive numbers replace the first one with '-'
word = char(words(1));
previous_word = is_numeric(word);
for i = 2:length(words)
    word = char(words(i));
    current_word = is_numeric(word);
    if previous_word == 1 && current_word == 1
        words(i-1) = cellstr('-');
        wordBox(i-1,:) = 0;
    end
    previous_word = is_numeric(word);
end

% now build from the beginning the previous arrays, now without consecutive
% numbers
words_new = {};
j = 1;
for i = 1:length(words)
    if ~strcmp(char(words(i)),'-')
        words_new(j) = words(i);
        wordBox_new(j,:) = wordBox(i,:);
        j = j + 1;
    end
end

words_new = words_new';
clear words wordBox
words = words_new;
wordBox = wordBox_new;
clear i j previous_word words_new word current_word wordBox_new