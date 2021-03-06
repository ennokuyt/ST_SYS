function New_State = check_state(Col_L, Col_R, LL, LR, Old_State)

    CL = readColor(Col_L);
    CR = readColor(Col_R);
    
    Char_L = give_col_char(CL, LL);
    Char_R = give_col_char(CR, LR);
    
    if Char_L == "U" || Char_R == "U"
        New_State = Old_State;
    else
        New_State = append(Char_L, Char_R);
    end
end