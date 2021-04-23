init;

while 1
    
    LL = readLightIntensity(Col_L, 'reflected');
    LR = readLightIntensity(Col_R, 'reflected');
    
    if check_stop(Vision, Mot_L, Mot_R)
        break
    end
    
    Old_State = New_State;
    New_State = check_state(Col_L, Col_R, LL, LR, Old_State);
    
  
    
%     max_drive(Old_State, New_State);
    
    pause(0.2)
    
end




    