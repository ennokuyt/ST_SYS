clear;
myrobot = legoev3('usb');
myColourSensor1 = colorSensor(myrobot,1);
myColourSensor2 = colorSensor(myrobot,3);
mA = motor(myrobot, 'A');
mC = motor(myrobot, 'C');
mA.Speed = 20;
mC.Speed = 20;
myUltrasonicSensor = sonicSensor(myrobot);

while 1

  light1 = readLightIntensity(myColourSensor1, 'reflected');
  light2 = readLightIntensity(myColourSensor2, 'reflected');
  
  val = readDistance(myUltrasonicSensor);
  if val < 0.1
      stop(mA);
      stop(mC);
      break
  end
  
  if light1 > 32 && light2 > 32 && light1 < 40 && light2 < 40
      purple();
      
  elseif light1 > 27 && light2 > 27 && light1 < 32 && light2 < 32
      grey();
      
  elseif light1 > 60 && light2 > 60 && light1 < 70 && light2 < 70 
      red();
      
  elseif light1 > 70 && light2 > 70
      white();
      
  elseif light1 < 20 && light2 < 20
      black_black();
      
  elseif light1 > 20
      black_white();
      
  elseif light2 > 20
      white_black();
  end
  
  pause(0.1);  % wait for 0.1s
end

function purple
    pause(1);
end

function grey
    mA.Speed = 10;
    mC.Speed = 10;
    start(mA);
    start(mC);
end

function red
    mA.Speed = 40;
    mC.Speed = 40;
    start(mA);
    start(mC);
end

function white_black
    mA.Speed = -30;
    mC.Speed = 30;
    start(mA);
    start(mC);
end

function black_white
    mA.Speed = 30;
    mC.Speed = -30;
    start(mA);
    start(mC);
end

function white
    mA.Speed = 20;
    mC.Speed = 20;
    start(mA);
    start(mC);
end

function black_black
    if mA.Speed < 0
      mA.Speed = mA.Speed - 10;
    else
      mC.Speed = mC.Speed - 10;
    end
    start(mA);
    start(mC);
    pause(0.5);
end
