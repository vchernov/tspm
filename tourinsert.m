function [population distances] = tourinsert(tour, pos, population, distances, locations)
% Inserts the tour to the specified position and updates its distance information.

population(:,pos) = tour;
distances(pos) = tourdistance(tour, locations);

