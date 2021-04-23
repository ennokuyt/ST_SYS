function Char_col = give_col_char(C, L)
    
    if C == "white"
        Char_col = "W";
        return
    end
    
    if C == "black"
        Char_col = "K";
        return
    end
    
    if C == "blue"
        Char_col = "G";
        return
    end
    
    if C == "red"
       if L > 45
           Char_col = "R";
           return
       else
           Char_col = "P";
           return
       end
    end
end