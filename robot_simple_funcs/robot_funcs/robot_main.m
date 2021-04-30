% Initialize physical object and color values (Set manual for new robot)
robot_init;

% Initialize states
speed_left = 0;
speed_right = 0;
parking = false;
current_pos = "middle";
prev_dist = 0;


while parking == false
    
    % Get info from lightsensors and distance
    leftLightSensor = readColorRGB(Col_L);
    rightLightSensor = readColorRGB(Col_R);
    dist = readDistance(Vision);

    % Parse lightsensor info to 'our' light values we use in software (e.g. 100 -> 'red')
    left_light = read_color(leftLightSensor);
    right_light = read_color(rightLightSensor);
    
    % One step function to get new motor values, updating states
    [speed_left, speed_right, parking, step_time] = ...
        step_drive(left_light, right_light, dist, speed_left, speed_right, parking);

    % Stop robot in case of obstacle
    if speed_left == 0 && speed_right == 0
        stop(Mot_L);
        stop(Mot_R);
        break
    end
    
    % Update motors and start them
    Mot_L.Speed = speed_left; 
    Mot_R.Speed = speed_right;
    start(Mot_L);
    start(Mot_R);
   
    pause(0.03+step_time)
end


while true
    
    % Get info from lightsensors and distance
    leftLightSensor = readColorRGB(Col_L);
    rightLightSensor = readColorRGB(Col_R);
    dist = readDistance(Vision);

    % Parse lightsensor info to 'our' light values we use in software (e.g. 100 -> 'red')
    left_light = read_color(leftLightSensor);
    right_light = read_color(rightLightSensor);

    % parking function
    [speed_left, speed_right, current_pos, step_time, prev_dist] = ...
        step_park(left_light, right_light, dist, prev_dist, speed_left, speed_right, current_pos);
    
    % Stop robot in case of obstacle or when fully parked
    if speed_left == 0 && speed_right == 0
        stop(Mot_L);
        stop(Mot_R);
        break
    end
    
    % Update motors and start them
    Mot_L.Speed = speed_left;
    Mot_R.Speed = speed_right;
    start(Mot_L);
    start(Mot_R);
   
    pause(0.03+step_time)
    
end
