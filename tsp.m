% Genetic Algorithm parameters
populationSize = 50;
mutationRate = 0.2;
iterations = 1000;

[locations names] = cities();

% initialization, random population is generated
population = zeros(size(locations, 1), populationSize);
distances = zeros(populationSize, 1);
for n=1:populationSize
	tour = randtour(locations);
	[population distances] = tourinsert(tour, n, population, distances, locations);
end

[population distances] = sortpopulation(population, distances);
fprintf('Initial distance: %f\n', distances(1));

results = zeros(iterations, 1); % history of best distances

% evolution loop
for iter=1:iterations
	parents = roulettewheel(distances, 2);
	child = crossover(population, parents(1), parents(2));
	if rand() < mutationRate
		child = mutate(child);
	end
	[population distances] = tourinsert(child, populationSize, population, distances, locations);

	[population distances] = sortpopulation(population, distances);

	results(iter) = distances(1);
end

% presanting of the results
fprintf('Final distance: %f\n', distances(1));
drawtour(population(:,1), locations, names);

figure
plot(results, '.-')
xlabel('iteration number')
ylabel('shortest distance')
print -dpng 'results.png'

