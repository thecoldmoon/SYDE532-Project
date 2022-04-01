function average_neighbour_value = avg_neighbour_value(m,n,grid)
    
    % Take in only available neighbours. This is 8 neighbours, so rid of first 4 if doing 4
    % neighbours
    elements = [];

    if m ~= 1 && n ~= 1
        elements = [elements, grid(m-1, n-1)];
    end
    if m ~= 1 && n ~= 40
        elements = [elements, grid(m-1, n+1)];
    end
    if m ~= 40 && n ~= 1
        elements = [elements, grid(m+1, n-1)];
    end
    if m ~= 40 && n ~= 40
        elements = [elements, grid(m+1, n+1)];
    end
    if m ~= 1
        elements = [elements, grid(m-1, n)];
    end
    if n ~= 1
        elements = [elements, grid(m, n-1)];
    end
    if m ~= 40
        elements = [elements, grid(m+1, n)];
    end
    if n ~= 40
        elements = [elements, grid(m, n+1)];
    end
    
    average_neighbour_value = sum(elements(elements~=grid(m,n) & elements~=0),'all')/size(elements(elements~=0),2);
end