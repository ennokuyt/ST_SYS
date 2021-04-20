function check_stop = check_stop(Vision, Mot_L, Mot_R)
val = readDistance(Vision);
check_stop = 0;
  if val < 0.1
      stop(Mot_L);
      stop(Mot_R);
      check_stop = 1;
  end
end