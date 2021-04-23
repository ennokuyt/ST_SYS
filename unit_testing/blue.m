clear;
myrobot = legoev3('usb');
myColourSensor1 = colorSensor(myrobot,1);
myColourSensor2 = colorSensor(myrobot,3);
mA = motor(myrobot, 'A');
mC = motor(myrobot, 'C');
color1 = readColor(myColourSensor1);
color2 = readColor(myColourSensor2);

% Put robot on grey
if color1 == "blue" || color2 == "blue"
    mA.Speed = 10;
    mC.Speed = 10;
    purple = 1;
end

color1 == "blue" || color2 == "blue" && mA.Speed == 10 && mC.Speed == 10 &&  purple == 1