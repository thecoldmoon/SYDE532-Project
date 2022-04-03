%% Set up 

% Types of Values for Agents, 0 will be empty space
opinions = 10;

% Agent moves/changes if threshold is met. Set a % of grid for empty space
THRESHOLD = 0.6;
GRID_SIZE = 100;
iterations = 200;
old_grid = [];
data = [];
% Grid randomized between 1-3, 100x100
grid = randi([1,opinions],GRID_SIZE,GRID_SIZE);
figure;
pcolor(grid);

for a = 1:GRID_SIZE-30
    grid(1,a) = 9;
end
for a = 1:GRID_SIZE-30
    grid(100,a) = 1;
end
for a = 1:GRID_SIZE-30
    grid(50,a) = 0;
end

% Run Simulation
for a = 1:iterations
    for m = 1:GRID_SIZE
        for n = 1:GRID_SIZE
            if grid(m,n)
                grid(m,n) = round(avg_neighbour_value(m,n,GRID_SIZE, grid));
            end
        end
    end

    %% Check convergence, display final result
    if mod(a, 5) == 0
       figure;
       pcolor(grid);
    end
    if isequal(old_grid,grid)
        disp(a)
        disp(unique(grid))
        figure;
        pcolor(grid);
        title('Converged Grid')
        break;
    end
    old_grid = grid;
end