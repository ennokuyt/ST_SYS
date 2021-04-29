% Physical robot init
clear;
Max_Verstappen = legoev3('usb');
Col_L = colorSensor(Max_Verstappen,1);
Col_R = colorSensor(Max_Verstappen,3);
Mot_L = motor(Max_Verstappen, 'A');
Mot_R = motor(Max_Verstappen, 'C');
Vision = sonicSensor(Max_Verstappen);

% Beginning colors init
global white
global black
global purple
global grey
global red

white = 100;
black = 15;
purple = 54;
grey = 40;
red = 92;