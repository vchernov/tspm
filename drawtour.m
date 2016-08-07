function drawtour(tour, locations, names)
% Plots the tour graph.

x = locations(tour,2); % longitude
y = locations(tour,1); % latitude

figure
hold on

plot(x, y, '-go', 'MarkerSize', 8)

% mark starting city
plot(x(1), y(1), 'r*', 'MarkerSize', 8)

% connection between first end last city
plot([x(1) x(end)], [y(1) y(end)], '-g')

text(x+0.1, y+0.1, names(tour))

xlim([min(x)-3 max(x)+3])
ylim([min(y)-1 max(y)+1])

print -dpng 'tour.png'

