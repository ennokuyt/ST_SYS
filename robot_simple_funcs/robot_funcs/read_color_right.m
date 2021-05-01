function color = read_color_right(rgb) % Gemiddelde van twee sensors
    r = rgb(1);
    g = rgb(2);
    b = rgb(3);
    white = [245, 230, 260];
    grey = [86, 87, 93];
    purple = [105, 26, 37];
    black = [25, 25, 27];
    red = [191, 20, 20];
    
    distance_white = dot([r g b] - white, [r g b] - white);
    distance_grey = dot([r g b] - grey, [r g b] - grey);
    distance_purple = dot([r g b] - purple, [r g b] - purple);
    distance_black = dot([r g b] - black, [r g b] - black);
    distance_red = dot([r g b] - red, [r g b] - red);
    
    min_dist = min([distance_white, distance_grey, distance_purple, distance_black, distance_red]);
    
    color = 'white';
    if distance_white == min_dist
        color = 'white';
    elseif distance_grey == min_dist
        color = 'grey';
    elseif distance_purple == min_dist
        color = 'purple';
    elseif distance_black == min_dist
        color = 'black';
    elseif distance_red == min_dist
        color = 'red';
    end
    
    return

    
    
    