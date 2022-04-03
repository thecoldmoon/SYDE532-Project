%% Set up 

% Types of Values for Agents, 0 will be empty space
types = [1,2,3];

% Agent moves/changes if threshold is met. Set a % of grid for empty space
THRESHOLD = 0.6;
PERCENTAGE_EMPTY = 0.05;
GRID_SIZE = 100;
iterations = 200;
old_grid = [];
data = [];
% Grid randomized between 1-3, 100x100
grid = randi([1 3],GRID_SIZE,GRID_SIZE);

% Choose Random Points for Empty Space
ZEROS_SIZE = round(40*40*PERCENTAGE_EMPTY);
x = randi([1, 40],1,ZEROS_SIZE);
y = randi([1, 40],1,ZEROS_SIZE);

zero_locations = [x;y]';

% Assign Zeros to Random Points
for a = 1:ZEROS_SIZE
    grid(x(a),y(a)) = 0;
end

% Run Simulation
for a = 1:iterations
    for m = 1:GRID_SIZE
        for n = 1:GRID_SIZE
            if grid(m,n) ~= 0

                %% If threshold is met, move to empty location (or update value at current)
                if (avg_neighbour_value(m,n,GRID_SIZE,grid) > THRESHOLD)
                    % Choose random place to replace
                    row = randi([1, ZEROS_SIZE],1);
                    new_x = zero_locations(row, 1);
                    new_y = zero_locations(row, 2);
                    zero_locations(row, 1) = m;
                    zero_locations(row, 2) = n;
                    grid(new_x, new_y) = grid(m,n);
                    grid(m,n) = 0;
                end
                
            end
        end
    end

    %% Check convergence, display final result
    if isequal(old_grid,grid)
        disp(f);
        figure;
        pcolor(grid);
        title('Converged Grid')
        break;
    end
    old_grid = grid;
end