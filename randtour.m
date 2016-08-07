function tour = randtour(locations)
% Generates random tour.

% starting city is always unchanged
tour = [1; 1 + randperm(size(locations, 1) - 1)'];

