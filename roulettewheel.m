function sel = roulettewheel(distances, N)
% Randomly selects N indices from the distances vector. Elements with less distance value have more probability to be chosen.

sized = size(distances, 1);
maxd = max(distances);

w = 1 - distances ./ maxd;
bonus = round(w * sized);
cnt = sized + sum(bonus);

ind = zeros(cnt, 1);
ind(1:sized) = 1:sized;

m = sized + 1;
for k=1:size(bonus, 1)
	b = bonus(k);
	ind(m:m-1+b) = k;
	m = m + b;
end

ind = ind(randperm(size(ind, 1)));
[inds upos] = unique(ind, 'first');
ind = ind(sort(upos));
sel = ind(1:N);

