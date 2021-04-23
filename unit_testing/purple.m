clear;
myrobot = legoev3('usb');
myColourSensor1 = colorSensor(myrobot,1);
myColourSensor2 = colorSensor(myrobot,3);
mA = motor(myrobot, 'A');
mC = motor(myrobot, 'C');
color1 = readColor(myColourSensor1);
color2 = readColor(myColourSensor2);
purple1 = 1;

% Put robot on purple
if color1 == "red" && color2 == "red"
    if purple1 == 1
        stop(mA);
        stop(mC);
    end
end


color1 == "red" && color2 == "red" && purple1 == 1