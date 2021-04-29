function light = parse_color(LightSensor)
    
    global white
    global red
    global purple
    global black
    global grey
    
    W = white;
    R = red;
    P = purple;
    B = black;
    G = grey;
    
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