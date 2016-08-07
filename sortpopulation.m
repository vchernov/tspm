function [population distances] = sortpopulation(population, distances)
% Sorts population by distances.

[distances ind] = sort(distances);
population = population(:,ind);

