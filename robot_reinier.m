% Setup variables
STEP_TIME = 0.2

% Initialize states
speed_left = 0
speed_right = 0
parking = false
parked = false

% Initialize physical object

% while not parking

    % Get info from lightsensors and distance
    leftLightSensor = ...

    % Parse lightsensor info to 'our' light values we use in software (e.g. 100 -> 'red')
    left_light = parse_color(leftLightSensor)
    right_light = parse_color(rightLightSensor)

    % One step function to get new motor values, updating states
    speed_left, speed_right, parking = step_drive(left_light, right_light, dist, speed_left, speed_right)

    % Update motors and start them

    % pause for STEP_TIME -> can play with this for speed vs accuracy?

% while not parked
    % Parking has separate state control, since it has to keep track how long it looks left and right and such
    % Not sure exactly which state control is needed to allow making such a step_park function below
    % ...
    speed_left, speed_right, parked = step_park(left_light, right_light, dist, speed_left, speed_right)

%% Start of step_drive block (should be in different file when coded)

% if dist small, stop always to prevent major failure
    % Set motors to idle
    % if we want to stop execution, we can make the global parked variable true and parking as well, but kind of a hack
    % return 0, 0, false

% if left_light == 'W' && right_light == 'W'
    speed_left = 15
    speed_right = 15
    % print 'State WW, Action (15, 15)' so we understand what it is doing when failing
    return speed_left, speed_right, false
% elseif left_light == 'B' && right_light == 'W'
    speed_left = -10
    speed_right = 10
    return speed_left, speed_right, false
% ...
% elseif left_light == 'P' && right_light == 'P'
    % print 'State PP, Action start parking'
    return 0, 0, true
% else
    % print 'Undefined state, move forward slowly'
    return 5, 5, false

%% Start of step_park block
% Parking states:
% 0: We still see purple and continue as normal
% 1: We do not see purple anymore, initialize vector of looking x times d timesteps to both sides to see distance
% Turn to the left xd seconds, measure distance
% Keep turning right for d seconds filling up the distance vector
% Once done, decide if either side can be considered empty,
% 2: With decided left/right, start actual parking

%% Unit tests example: We ONLY need to unit test our step_drive and step_park functions
% In normal operations, ww, always set speed to 15 (?)
% speed_left, speed_right, parking = step_drive('W', 'W', 0.5, 0, 0)
% assert(speed_left = 15)
% assert(speed_right = 15)
% assert(parking = false)

%% Unit Drive tests
% Test 1 : given ww, assert normal forward speeds
% Test 2 : given wb, assert turn right speeds
% Test 3 : given bw, assert turn left speeds
% Test 4 : given gg, assert slow speeds
% Test 5 : given rr, assert high speeds
% Test 6 : given pp, assert stop and parking is true

% Test 7 : given some unexpected values, assert low speed continuation
% Test 8 : given a close distance, assert stop

% TODO: decide if we have to test combinations like bg, rb or even what we should never see rg

%% Unit Park tests

% TODO

%% Integration tests

% TODO