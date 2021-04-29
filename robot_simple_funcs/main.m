% Initialise max
init;

while 1
    
    % Read lights
    LL = readLightIntensity(Col_L, 'reflected');
    LR = readLightIntensity(Col_R, 'reflected');
    
    % Check if required to stop
    if check_stop(Vision, Mot_L, Mot_R)
        break
    end
    
    CL = readColor(Col_L);
    CR = readColor(Col_R);
    
    % Update states
    Old_State = New_State;
    New_State = check_state(CL, CR, LL, LR, Old_State);
    
    % Update movement parameters
    Old_Movement = New_Movement;
    New_Movement = max_drive(Old_State, New_State, Old_Movement);
    
    % Move
    Move_Max = drive(Old_Movement, New_Movement, Mot_L, Mot_R);
    start(Mot_L);
    start(Mot_R);
    
    % Pause to next step
    pause(0.03+Move_Max);
    
end




    