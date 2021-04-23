clear;
myrobot = legoev3('usb');
myColourSensor1 = colorSensor(myrobot,1);
myColourSensor2 = colorSensor(myrobot,3);
mA = motor(myrobot, 'A');
mC = motor(myrobot, 'C');
color1 = readColor(myColourSensor1);
color2 = readColor(myColourSensor2);

% Put robot on right sensor black, other sensor not black
if color1 ~= "black" && color2 == "black"
    mA.Speed = 30;
    mC.Speed = -30;
end

color1 ~= "black" && color2 == "black" && mA.Speed == 30 && mC.Speed == -30