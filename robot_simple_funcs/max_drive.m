function drive = max_drive(Old_state, New_state)

    if New_state == "PP"
        val = readDistance(myUltrasonicSensor);
        stop(mA);
        stop(mC);
    end
    
    if New_state == "RR"
        mA.Speed = 30;
        mC.Speed = 30;
        start(mA);
        start(mC);
        
    elseif New_state == "WW"
        mA.Speed = 20;
        mC.Speed = 20;
        start(mA);
        start(mC);
    

end
