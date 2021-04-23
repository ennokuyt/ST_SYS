clear;
myrobot = legoev3('usb');
myColourSensor1 = colorSensor(myrobot,1);
myColourSensor2 = colorSensor(myrobot,3);
mA = motor(myrobot, 'A');
mC = motor(myrobot, 'C');
color1 = readColor(myColourSensor1);
color2 = readColor(myColourSensor2);

% Put robot on white white
if color1 == "white" && color2 == "white"
    mA.Speed = 20;
    mC.Speed = 20;
end

color1 == "white" && color2 == "white" && mA.Speed == 20 && mC.Speed == 20