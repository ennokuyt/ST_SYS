% Initialize states
speed_left = 0;
speed_right = 0;
parking = false;
parked = false;

% Initialize physical object and begin colors (Set manual for new robot)
robot_init;

while parking == false
    
    % Get info from lightsensors and distance
    leftLightSensor = readLightIntensity(Col_L, 'reflected');
    rightLightSensor = readLightIntensity(Col_R, 'reflected');
    dist = readDistance(myUltrasonicSensor);

    % Parse lightsensor info to 'our' light values we use in software (e.g. 100 -> 'red')
    left_light = parse_color(leftLightSensor);
    right_light = parse_color(rightLightSensor);
    
    % One step function to get new motor values, updating states
    [speed_left, speed_right, parking, parked, step_time] = step_drive(left_light, right_light, dist, speed_left, speed_right, parking, step_time);

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



