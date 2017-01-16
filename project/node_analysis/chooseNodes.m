% this cell will contain the nodes we want to solve
nodes = {};
evidence = 0;
counter = 1;
duplicated = 0;

% iterate through all nodes in final results
for j = 1:2
    for i = 1:length(final_results(:,1))
        testNode = final_results(i,j);
        % the nearby node, this is to check if both nodes are the same
        % that happens when two elements have the same pair of nodes
        if j == 2
            friendTest = final_results(i,1);
        else
            friendTest = final_results(i,2);
        end
        for jn = 1:2
            for in = 1:length(final_results(:,1))
                if jn == 2
                    friendSome = final_results(in,1);
                else
                    friendSome = final_results(in,2);
                end
                if jn ~= j || in ~= i
                    someNode = final_results(in,jn);
                    % find if the node is found more than once
                    if (testNode{1}(1) == someNode{1}(1) && testNode{1}(2) == someNode{1}(2))
                        % we don't count when elements have the same pair
                        % of nodes
                        if (friendTest{1}(1) ~= friendSome{1}(1) || friendTest{1}(2) ~= friendSome{1}(2))
                            evidence = evidence + 1;
                        end
                    end
                end
            end
        end
        % if so add the node to the nodes cell
        if evidence > 0
            for k = 1:length(nodes)
                if nodes{k}{1}(1) == testNode{1}(1) && nodes{k}{1}(2) == testNode{1}(2)
                    duplicated = 1;
                end
            end
            if ~duplicated
                nodes{counter,1} = testNode;
                counter = counter + 1;
            end
            evidence = 0;
            duplicated = 0;
        end
    end
end

clear counter duplicated evidence i in j jn k
clear some someNode testNode