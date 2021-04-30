% Physical robot init
clear;
Max_Verstappen = legoev3('usb');
Col_L = colorSensor(Max_Verstappen,1);
Col_R = colorSensor(Max_Verstappen,3);
Mot_L = motor(Max_Verstappen, 'A');
Mot_R = motor(Max_Verstappen, 'C');
Vision = sonicSensor(Max_Verstappen);

% Beginning colors init
global white_left
global black_left
global purple_left
global grey_left
global red_left

global white_right
global black_right
global purple_right
global grey_right
global red_right

white_left = 100;
black_left = 11;
purple_left = 38;
grey_left = 32;
red_left = 92;

white_right = 100;
black_right = 11;
purple_right = 38;
grey_right = 32;
red_right = 92;

while true
    leftLightSensor = readLightIntensity(Col_L, 'reflected')
    rightLightSensor = readLightIntensity(Col_R, 'reflected')
    pause(2);
end
    
    