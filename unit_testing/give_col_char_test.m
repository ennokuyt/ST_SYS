% test give_col_char
C_red = "red";
C_white = "white";
C_black = "black";
C_blue = "blue";
L_small = 45;
L_big = 46;

%preconditions

%%Test 1: test ground colors where L is not bigger than 45 
Char_col = give_col_char(C_white, L_small);
assert(Char_col == "W")

Char_col = give_col_char(C_black, L_small);
assert(Char_col == "K")

Char_col = give_col_char(C_blue, L_small);
assert(Char_col == "G")

Char_col = give_col_char(C_red, L_small);
assert(Char_col == "P")

%%Test 2: test ground colors where L is bigger than 45 
Char_col = give_col_char(C_white, L_big);
assert(Char_col == "W")

Char_col = give_col_char(C_black, L_big);
assert(Char_col == "K")

Char_col = give_col_char(C_blue, L_big);
assert(Char_col == "G")

Char_col = give_col_char(C_red, L_big);
assert(Char_col == "R")

%To run execute "result = runtests('give_col_char_test');"
%For details run "rt = table(result)"
