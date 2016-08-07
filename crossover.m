function child = crossover(population, parent1, parent2)

child = zeros(size(population, 1), 1);

% copy random portion of genes from the first parent
range1 = 1 + randperm(size(population, 1) - 1);
range1 = sort(range1(1:2));
slice1 = range1(1):range1(2);
genes1 = population(slice1, parent1);
child(slice1) = genes1;

% copy rest of the genes from the second parent
p2 = population(:, parent2);
genes2 = p2(find(not(ismember(p2, genes1))));
slice2 = [1:range1(1)-1, range1(2)+1:size(child, 1)];
child(slice2) = genes2;

