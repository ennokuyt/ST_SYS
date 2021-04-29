clear;
Max_Verstappen = legoev3('usb');
Col_L = colorSensor(Max_Verstappen,1);
Col_R = colorSensor(Max_Verstappen,3);
Mot_L = motor(Max_Verstappen, 'A');
Mot_R = motor(Max_Verstappen, 'C');
Mot_L.Speed = 20;
Mot_R.Speed = 20;
Vision = sonicSensor(Max_Verstappen);

Old_State = "START";
New_State = "START";
Mot_Pow_L = Mot_L.Speed;
Mot_Pow_R = Mot_R.Speed;

Old_Movement = "START";
New_Movement = "START";