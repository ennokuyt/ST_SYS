function Move_Max = drive(Old_Movement, New_Movement, Mot_L, Mot_R)
    
    if New_Movement == "SPEED"
        Mot_L.Speed = 30;
        Mot_R.Speed = 30;
        Move_Max = 0;
%         start(Mot_L);
%         start(Mot_R);
        return
    elseif New_Movement == "STRAIGHT"
        Mot_L.Speed = 20;
        Mot_R.Speed = 20;
        Move_Max = 0;
%         start(Mot_L);
%         start(Mot_R);
        return
    elseif New_Movement == "BLACKBLACK"
        drive(Old_Movement, Old_Movement, Mot_L, Mot_R)
        Move_Max = 0.5;
%         pause(0.5)
        return
    elseif New_Movement == "LEFT"
        Mot_L.Speed = 20;
        Mot_R.Speed = -20;
        Move_Max = 0.2;
%         start(Mot_L);
%         start(Mot_R);
%         pause(0.2);
        return
    elseif New_Movement == "RIGHT"
        Mot_L.Speed = -20;
        Mot_R.Speed = 20;
        Move_Max = 0.2;
%         start(Mot_L);
%         start(Mot_R);
%         pause(0.2);
        return
    elseif New_Movement == "SLOW"
        Mot_L.Speed = 10;
        Mot_R.Speed = 10;
        Move_Max = 0;
%         start(Mot_L);
%         start(Mot_R);
        return
    else
        Mot_L.Speed = 15;
        Mot_R.Speed = 15;
        Move_Max = 0;
%         start(Mot_L);
%         start(Mot_R);
        return
    end
end