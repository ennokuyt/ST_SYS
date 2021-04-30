function light = parse_color(LightSensor, side)
    
    global white_left
    global black_left
    global purple_left
    global grey_left
    global red_left

    global white_right
    global black_right
    global purple_right
    global grey_right
    global red_right
    
    if side == "left"
        W = white_left;
        R = red_left;
        P = purple_left;
        B = black_left;
        G = grey_left;
    elseif side == "right"
        W = white_right;
        R = red_right;
        P = purple_right;
        B = black_right;
        G = grey_right;
    end
    
    if (LightSensor > R-5 && LightSensor < R+5)
        light = "red";
    elseif (LightSensor > P-5 && LightSensor < P+5)
        light = "purple";
    elseif (LightSensor > W-5 && LightSensor < W+5)
        light = "white";
    elseif (LightSensor > B-5 && LightSensor < B+5)
        light = "black";
    elseif (LightSensor > G-5 && LightSensor < G+5)
        light = "grey";
    else
        light = "unknown";
    end
end