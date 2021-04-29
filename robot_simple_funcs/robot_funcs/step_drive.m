function [speed_left, speed_right, parking] = step_drive(left_light, right_light, dist, speed_left, speed_right)

    if dist < 0.10
        speed_left = 0;
        speed_right = 0;
        parking = false;
        return
    end

    if left_light == "red" && right_light == "red"
        speed_left = 50;
        speed_right = 50;
        parking = false;
        return
        
    elseif left_light == "purple" && right_light == "purple"
        speed_left = 21;
        speed_right = 21;
        % pause(0.1) 
        parking = true;
        return
        
    elseif left_light == "white" && right_light == "white"
        speed_left = 21;
        speed_right = 21;
        parking = false;
        return
        
    elseif left_light == "black" && right_light == "black"
        if speed_left < 0
            speed_left = -21;
            %speed_right = speed_right (weet niet of dit bij MATLAB moet)
            parking = false;
            return
        else
            speed_right = -21;
            %speed_left = speed_left (same als hierboven)
            parking = false;
            return
        end
        % pause(0.5)

    elseif left_light ~= "black" && right_light == "black"
        speed_left = 21;
        speed_right = -21;
        parking = false;
        return
        % pause(0.2)
        
    elseif left_light == "black" && right_light ~= "black"
        speed_left = -20;
        speed_right = 20;
        parking = false;
        return
        % pause(0.2) 
        
    elseif left_light == "grey" && right_light == "grey"
        speed_left = 11;
        speed_right = 11;
        parking = false;
        return
        % pause(0.2) 
        
    else
        speed_left = 16;
        speed_right = 16;
        parking = false;
        return 
    end
end

