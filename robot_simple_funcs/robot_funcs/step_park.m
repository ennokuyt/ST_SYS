function [speed_left, speed_right, current_pos, step_time, prev_dist_out] = ...
    step_park(left_light, right_light, dist, prev_dist_in, speed_left, speed_right, current_pos)

    prev_dist_out = prev_dist_in;
    if current_pos == "driving"
        %TODO
        [speed_left, speed_right, ~, step_time] = ...
            step_drive(left_light, right_light, dist, speed_left, speed_right, true);
        current_pos = "driving";
        return
        
    elseif (left_light == "purple") || (right_light == "purple")
        [speed_left, speed_right, ~, step_time] = ...
            step_drive(left_light, right_light, dist, speed_left, speed_right, true);
        current_pos = "middle";
        return
        
    else
        if (prev_dist_in > 0.5 && current_pos == "left") || current_pos == "right"
            speed_left = 20
            speed_right = 20;
            step_time = 1.5;
            current_pos = "driving";
            return
        elseif current_pos == "middle"
            speed_left = -15;
            speed_right = 15;
            step_time = 0.8;
            current_pos = "farleft";
            return
        elseif current_pos == "farleft"
            speed_left = 15;
            speed_right = -15;
            step_time = 0.5;
            prev_dist_out = dist;
            current_pos = "left";
            return
        elseif current_pos == "left"
            speed_left = 15;
            speed_right = -15;
            step_time = 0.6; %Check dit
            current_pos = "right";
        end
    end
        
        
        