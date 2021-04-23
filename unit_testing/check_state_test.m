%test check_state
%add hardware color codes
Col_L_white = readColor(Col_L); %moet worden aangepast naar daadwerkelijke codes
Col_R_white = readColor(Col_R);
Col_L_black = 122;
Col_R_black = 122;
Col_L_red = 122;
Col_R_red = 122;
Col_L_blue = 122;
Col_R_blue = 122;
L_small = 45;
L_big = 46;

%preconditions

%%Test 1: test same colors and L is smaller than 46
New_State = check_state(Col_L_white, Col_R_white, L_small, L_small);
assert(New_State == "WW")

New_State = check_state(Col_L_black, Col_R_black, L_small, L_small);
assert(New_State == "KK")

New_State = check_state(Col_L_red, Col_R_red, L_small, L_small);
assert(New_State == "PP")

New_State = check_state(Col_L_blue, Col_R_blue, L_small, L_small);
assert(New_State == "GG")

%%Test 2: test same colors and L is bigger than 45
New_State = check_state(Col_L_white, Col_R_white, L_big, L_big);
assert(New_State == "WW")

New_State = check_state(Col_L_black, Col_R_black, L_big, L_big);
assert(New_State == "KK")

New_State = check_state(Col_L_red, Col_R_red, L_big, L_big);
assert(New_State == "RR")

New_State = check_state(Col_L_blue, Col_R_blue, L_big, L_big);
assert(New_State == "GG")

%%Test 3: test different color combinations and L is smaller than 46
New_State = check_state(Col_L_white, Col_R_black, L_small, L_small);
assert(New_State == "WK")

New_State = check_state(Col_L_black, Col_R_red, L_small, L_small);
assert(New_State == "KP")

New_State = check_state(Col_L_red, Col_R_blue, L_small, L_small);
assert(New_State == "PG")

New_State = check_state(Col_L_blue, Col_R_white, L_small, L_small);
assert(New_State == "GW")

%%Test 4: test different color combinations and L is bigger than 45
New_State = check_state(Col_L_white, Col_R_black, L_big, L_big);
assert(New_State == "WK")

New_State = check_state(Col_L_black, Col_R_red, L_big, L_big);
assert(New_State == "KR")

New_State = check_state(Col_L_red, Col_R_blue, L_big, L_big);
assert(New_State == "RG")

New_State = check_state(Col_L_blue, Col_R_white, L_big, L_big);
assert(New_State == "GW")

%%Test 5: test different color combinations and the first L-value is bigger than 45
New_State = check_state(Col_L_white, Col_R_black, L_big, L_small);
assert(New_State == "WK")

New_State = check_state(Col_L_black, Col_R_red, L_big, L_small);
assert(New_State == "KP")

New_State = check_state(Col_L_red, Col_R_blue, L_big, L_small);
assert(New_State == "RG")

New_State = check_state(Col_L_blue, Col_R_white, L_big, L_small);
assert(New_State == "GW")

%%Test 6: test different color combinations and the second L-value is bigger than 45
New_State = check_state(Col_L_white, Col_R_black, L_small, L_big);
assert(New_State == "WK")

New_State = check_state(Col_L_black, Col_R_red, L_small, L_big);
assert(New_State == "KR")

New_State = check_state(Col_L_red, Col_R_blue, L_small, L_big);
assert(New_State == "PG")

New_State = check_state(Col_L_blue, Col_R_white, L_small, L_big);
assert(New_State == "GW")
