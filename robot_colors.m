clear;
myrobot = legoev3('usb');
myColourSensor1 = colorSensor(myrobot,1);
myColourSensor2 = colorSensor(myrobot,3);
mA = motor(myrobot, 'A');
mC = motor(myrobot, 'C');
mA.Speed = 20;
mC.Speed = 20;
myUltrasonicSensor = sonicSensor(myrobot);
purple = 0;

while 1

  color1 = readColor(myColourSensor1);
  color2 = readColor(myColourSensor2);
  
  val = readDistance(myUltrasonicSensor);
  if val < 0.1
      stop(mA);
      stop(mC);
      break
  end
      
  if color1 == "red" && color2 == "red"
      if purple == 1
          val = readDistance(myUltrasonicSensor);
          stop(mA);
          stop(mC);
      end
      mA.Speed = 30;
      mC.Speed = 30;
      start(mA);
      start(mC);
      
  elseif color1 == "white" && color2 == "white"
    mA.Speed = 20;
    mC.Speed = 20;
    start(mA);
    start(mC);
    
  elseif color1 == "black" && color2 == "black"
    if mA.Speed < 0
        mA.Speed = -20;
    else
        mC.Speed = -20;
    end
    start(mA);
    start(mC);
    pause(0.5);
      
  elseif color2 == "black"
    mA.Speed = 30;
    mC.Speed = -30;
    start(mA);
    start(mC);
      
  elseif color1 == "black"
    mA.Speed = -30;
    mC.Speed = 30;
    start(mA);
    start(mC);
    
  elseif color1 == "blue" || color2 == "blue"
      mA.Speed = 10;
      mC.Speed = 10;
      start(mA);
      start(mC);
      purple = 1;
  end
  
  pause(0.03);
end
