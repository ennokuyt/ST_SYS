function Char_col = give_col_char(CC, LL)
    
    WHITE = "white";
    BLACK = "black";
    GREY = "blue";
    RED = "red";
    U1 = "green";
    
    if CC == WHITE
        Char_col = "W";
        return
    end
    
    if CC == BLACK
        Char_col = "K";
        return
    end
    
    if CC == GREY
        Char_col = "G";
        return
    end
    
    if CC == RED
       if LL > 45
           Char_col = "R";
           return
       else
           Char_col = "P";
           return
       end
    end
    
    if CC == U1
        Char_col = "K";
        return
    end
    
    Char_col = "U";
 
end