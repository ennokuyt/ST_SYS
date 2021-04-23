clear;
% Beginning colors
white = 100;
black = 15;
purple = 54;
grey = 40;
red = 92;

myrobot = legoev3('usb');
myColourSensor1 = colorSensor(myrobot,1);
myColourSensor2 = colorSensor(myrobot,3);
mA = motor(myrobot, 'A');
mC = motor(myrobot, 'C');
mA.Speed = 15;
mC.Speed = 15;
myUltrasonicSensor = sonicSensor(myrobot);

while 1
  color1 = readLightIntensity(myColourSensor1, 'reflected');
  color2 = readLightIntensity(myColourSensor2, 'reflected');
  
  val = readDistance(myUltrasonicSensor);
  if val < 0.10
      stop(mA);
      stop(mC);
      break
  end
      
  if (color1 > red-5 && color1 < red+5) && (color2 > red-5 && color2 < red+5)
      mA.Speed = 30;
      mC.Speed = 30;
      start(mA);
      start(mC);
      
  elseif (color1 > purple-5 && color1 < purple+5) && (color2 > purple-5 && color2 < purple+5)
      val = readDistance(myUltrasonicSensor);
      stop(mA);
      stop(mC);


  elseif (color1 > white-5 && color1 < white+5) && (color2 > white-5 && color2 < white+5)
      mA.Speed = 20;
      mC.Speed = 20;
      start(mA);
      start(mC);
    
  elseif (color1 > black-5 && color1 < black+5) && (color2 > black-5 && color2 < black+5)
    if mA.Speed < 0
        mA.Speed = -20;
    else
        mC.Speed = -20;
    end
    start(mA);
    start(mC);
    pause(0.5);
      
  elseif (color1 < black-5 || color1 > black+5) && (color2 > black-5 && color2 < black+5)
    mA.Speed = 20;
    mC.Speed = -20;
    start(mA);
    start(mC);
    pause(0.2);
      
  elseif (color1 > black-5 && color1 < black+5) && (color2 < black-5 || color2 > black+5)
    mA.Speed = -20;
    mC.Speed = 20;
    start(mA);
    start(mC);
    pause(0.2);
    
  elseif (color1 > grey-5 && color1 < grey+5) && (color2 > grey-5 && color2 < grey+5)
      mA.Speed = 10;
      mC.Speed = 10;
      start(mA);
      start(mC);
      
  else
      mA.Speed = 15;
      mC.Speed = 15;
      start(mA);
      start(mC);
  end
  
  pause(0.03);
end
