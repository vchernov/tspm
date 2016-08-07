function d = tourdistance(tour, locations)
% Calculates distance of the tour.

x = locations(tour,2); % longitude
y = locations(tour,1); % latitude

dx = circshift(x, -1) - x;
dy = circshift(y, -1) - y;

d = sum(sqrt(dx .* dx + dy .* dy));

