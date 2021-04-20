function New_State = check_state(Col_L, Col_R)

    %%% 30 MOET 45 ZIJN!!!

    CL = readColor(Col_L);
    CR = readColor(Col_R);
    
    if CL == "white"  && CR == "white"
         New_State = "WW";
    end
    
    if CL == "white"  && CR == "black"
        New_State = "WK";
    end
    
    if CL == "black"  && CR == "white"
        New_State = "KW";
    end
    
    if CL == "black"  && CR == "black"
        New_State = "KK";
    end
    
    if CL == "blue" && CR == "white"
        New_State = "BW";
    end
    
    if CL == "white"  && CR == "blue"
        New_State = "BW";
    end
    
    if CL == "black"  && CR == "blue"
        New_State = "KB";
    end
    
    if CL == "blue" && CR == "black"
        New_State = "BK";
    end
    
    if CL == "red" || CR == "red"
        
        if CL == "red" && CR == "red"
            if LL > 30 && LR > 30
                New_State = "RR";
            elseif LL < 30 && LR < 30
                New_State = "PP";
            else
                New_State = "error: one is red, one is purple"
            end
            
        elseif CL == "red" && CR == "white"
            if LL > 30
                New_State = "RW";
            else 
                New_State = "PW";
                
        elseif CL == "white" && CR == "red"
            if LL > 30
                New_State = "RW";
            else 
                New_State = "PW";
            
            
    end
    
   
    
    
    New_State = "error: no color state found"
    
end