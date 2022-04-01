function average_neighbour_value = avg_neighbour_value(m,n,grid)
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
    
    average_neighbour_value = size(sum(elements(elements~=grid(m,n) & elements~=0),2),'all')/size(elements(elements~=0),2);
end