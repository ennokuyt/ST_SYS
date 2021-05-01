% Physical robot init
clear;
Max_Verstappen = legoev3('usb');
Col_L = colorSensor(Max_Verstappen,1);
Col_R = colorSensor(Max_Verstappen,3);
Mot_L = motor(Max_Verstappen, 'A');
Mot_R = motor(Max_Verstappen, 'C');
Vision = sonicSensor(Max_Verstappen);

% % Beginning colors init
% global white_left
% global black_left
% global purple_left
% global grey_left
% global red_left
% 
% global white_right
% global black_right
% global purple_right
% global grey_right
% global red_right
% 
% white_left = 90;
% black_left = 10;
% purple_left = 42;
% grey_left = 32;
% red_left = 75;
% 
% white_right = 74;
% black_right = 8;
% purple_right = 33;
% grey_right = 25;
% red_right = 60;


% 
% % Mot_L.Speed = 21;
% % Mot_R.Speed = 21;
% % start(Mot_L);
% % start(Mot_R);
% while true
%     leftLightSensor = readColorRGB(Col_L)
%     rightLightSensor = readColorRGB(Col_R)
%     pause(0.5);
% end


    
    