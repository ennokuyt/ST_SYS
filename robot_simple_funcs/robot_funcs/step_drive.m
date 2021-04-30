function [speed_left, speed_right, parking_out, step_time] = step_drive(left_light, right_light, dist, speed_left, speed_right, parking_in)
    
    step_time = 0;
    parking_out = parking_in;
    
    if dist < 0.10
        speed_left = 0;
        speed_right = 0;
        return
    end

    if left_light == "red" && right_light == "red"
        speed_left = 50;
        speed_right = 50;
        return
        
    elseif left_light == "purple" && right_light == "purple"
        speed_left = 21;
        speed_right = 21;
        step_time = 0.1;
        parking_out = true;
        return
        
    elseif left_light == "white" && right_light == "white"
        speed_left = 21;
        speed_right = 21;
        return
        
    elseif left_light == "black" && right_light == "black"
        if parking_in == true
            speed_left = 0;
            speed_right = 0;
            return
            
        elseif speed_left < 0
            speed_left = -21;
            %speed_right = speed_right (weet niet of dit bij MATLAB moet)
            step_time = 0.5;
            return
        else
            speed_right = -21;
            %speed_left = speed_left (same als hierboven)
            step_time = 0.5;
            return
        end
        % pause(0.5)

    elseif left_light ~= "black" && right_light == "black"
        speed_left = 21;
        speed_right = -21;
        step_time = 0.2;
        return
        % pause(0.2)
        
    elseif left_light == "black" && right_light ~= "black"
        speed_left = -21;
        speed_right = 21;
        step_time = 0.2;
        return
        % pause(0.2) 
        
    elseif left_light == "grey" && right_light == "grey"
        speed_left = 11;
        speed_right = 11;
        step_time = 0.2;
        return
        % pause(0.2) 
        
    else
        speed_left = 16;
        speed_right = 16;
        return 
    end
end

