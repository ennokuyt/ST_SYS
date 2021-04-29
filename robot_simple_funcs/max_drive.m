function New_Movement = max_drive(Old_State, New_State, Old_Movement)
    
    if New_State == Old_State
        New_Movement = Old_Movement;
        return
    end
    
    if New_State == "RR"
        New_Movement = "SPEED";
        return
    elseif New_State == "PP"
        New_Movement = "STOP";
        return
    elseif New_State == "WW"
        New_Movement = "STRAIGHT";
        return
    elseif New_State == "WK" || New_State == "GK" || New_State == "RK" || New_State == "PK"
        New_Movement = "LEFT";
        return
    elseif New_State == "KW" || New_State == "KG" || New_State == "KR" || New_State == "KP"
        New_Movement = "RIGHT";
        return
    elseif New_State == "GG"
        New_Movement = "SLOW";
        return
    else
        New_Movement = "ELSE";
        return
end
