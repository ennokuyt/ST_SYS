function [speed_left, speed_right, parked, current_pos, step_time, prev_dist] = step_park(left_light, right_light, dist, prev_dist, speed_left, speed_right, current_pos)
    if current_pos == "driving"
        %TODO
        [speed_left, speed_right, ~, parked, step_time] = step_drive(left_light, right_light, dist, speed_left, speed_right, parking, step_time);
        current_pos = "driving";
        return
    elseif (left_light == "purple") && (right_light == "purple")
        [speed_left, speed_right, ~, parked, step_time] = step_drive(left_light, right_light, dist, speed_left, speed_right, parking, step_time);
        current_pos = "middle";
        return
    else
        if (prev_dist > 0.5 && current_pos == "left") || current_pos == "right"
            speed_left = 20;
            speed_right = 20;
            step_time = 1.5;
            current_pos = "driving";
            parked = 0;
            return
        elseif current_pos == "middle"
            speed_left = -15;
            speed_right = 15;
            step_time = 0.8;
            current_pos = "farleft";
            parked = 1;
            return
        elseif current_pos == "farleft"
            speed_left = 15;
            speed_right = -15;
            step_time = 0.5;
            prev_dist = dist;
            current_pos = "left";
            return
        elseif current_pos == "left"
            speed_left = 15;
            speed_right = -15;
            step_time = 1.3; %Check dit
            current_pos = "right";
        end
    end
        
        
        