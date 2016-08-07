function mutant = mutate(tour)
% Swaps two random genes (cities), except the first one.

mutant = tour;

pos = 1 + randperm(size(tour, 1) - 1);
pos = pos(1:2);
mutant(pos) = mutant([pos(2) pos(1)]);

