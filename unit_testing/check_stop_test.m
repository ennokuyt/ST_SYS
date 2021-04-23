%test check_stop
val_zero = 0;
val_small = 0.01;
val_equal = 0.1;
val_big = 0.11;

%preconditions
%check_stop = check_stop(Vision, Mot_L, Mot_R);
%assert(readDistance(Vision) >= 0.1,'Value is too big')

%%Test 1: test if both motors stop when value is less than 0.1
%check_stop = check_stop(Vision, Mot_L, Mot_R);
%assert(check_stop == 1)

%Hardware: kijken naar de kleurcode via apparaatje en hiermee unit test
%schrijven. Stel hij komt op paars dan moet hij stoppen is blijkbaar een
%integration test.
