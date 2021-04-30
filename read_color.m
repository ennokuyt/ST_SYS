function color = read_color(rgb) % Gemiddelde van twee sensors
    r = rgb(1);
    g = rgb(2);
    b = rgb(3);
    white = [260, 255, 300];
    grey = [90, 93, 108];
    purple = [115, 30, 50];
    black = [31, 30, 44];
    red = [215, 25, 31];
    
    distance_white = dot([r g b] - white, [r g b] - white);
    distance_grey = dot([r g b] - grey, [r g b] - grey);
    distance_purple = dot([r g b] - purple, [r g b] - purple);
    distance_black = dot([r g b] - black, [r g b] - black);
    distance_red = dot([r g b] - red, [r g b] - red);
    
    min_dist = min([distance_white, distance_grey, distance_purple, distance_black, distance_red]);
    
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
        
%     r_white = 260;
%     g_white = 255;
%     b_white = 300;
%     
%     r_grey = 90;
%     g_grey = 93;
%     b_grey = 108;
%     
%     r_purple = 115;
%     g_purple = 30;
%     b_purple = 50;
%     
%     r_black = 31;
%     g_black = 30;
%     b_black = 44;
%     
%     r_red = 215;
%     g_red = 25;
%     b_red = 31;
    
    
    