% Create 10k random integers with unifom distribution
uniform = rand(1,10000);

% load uniform results into the array
k = 3;

% populating the exponential array
%exp_vals = exp((1/uniform)*(-k));

exp_vals = zeros (1,10000);
result = 0;

for i = 1 : 10000
    result = exp((uniform(i))*(k));
    exp_vals(i) = result;
end

% plot
histfit(exp_vals,100,'exponential');

