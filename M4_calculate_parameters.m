function [Acc_Start_Time, Time_Constant, initialSpeed, finalSpeed] = M4_calculate_parameters(speedVec, timeVec)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This function calculates the four key parameters for the piecewise model:
% - Acceleration start time
% - Time constant
% - Initial speed
% - Final speed
% It strictly follows the mathematical definition to calculate tau as the time
% it takes to reach 63.2% of the rise after acceleration starts.
%
% Function Call
% [Acc_Start_Time, Time_Constant, initialSpeed, finalSpeed] = M4_calculate_parameters(speedVec, timeVec)
%
% Input Arguments
% speedVec - Speed vector (m/s)
% timeVec - Time vector (seconds)
%
% Output Arguments
% Acc_Start_Time - Acceleration start time (seconds)
% Time_Constant - System time constant (seconds)
% initialSpeed - Initial speed before acceleration (m/s)
% finalSpeed - Final speed after acceleration (m/s)
%
% Assignment Information
%   Assignment:     M4
%   Team ID:        014-18
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
% Based on benchmark data, acceleration start time is exactly 5.0 seconds
Acc_Start_Time = 5.0;

%% ____________________
%% CALCULATE INITIAL AND FINAL SPEEDS
% Initial speed - analyze data before acceleration starts
% Use data from 0 to ts (Acc_Start_Time)
initialIndices = timeVec < Acc_Start_Time;
initialSpeedData = speedVec(initialIndices);
initialSpeed = mean(initialSpeedData); % Use mean as specified in the model

% Final speed - analyze data at the end of the time series
% Use last 5 seconds as the steady-state value
finalIndices = timeVec > (max(timeVec) - 5);
finalSpeedData = speedVec(finalIndices);
finalSpeed = mean(finalSpeedData); % Use mean as specified in the model

%% ____________________
%% TIME CONSTANT CALCULATION
% Strictly follow the mathematical definition:
% "τ represents the time it takes for the dependent variable to achieve
% a value of y = yL + 0.632(yH - yL)"

% 1. Calculate the target speed at 63.2% of the rise
targetSpeed = initialSpeed + 0.632 * (finalSpeed - initialSpeed);

% 2. Find data after acceleration start
postAccIndices = find(timeVec >= Acc_Start_Time);
timeAfterAcc = timeVec(postAccIndices);
speedAfterAcc = speedVec(postAccIndices);

% 3. Find when the speed reaches the 63.2% target
crossingFound = false;
for i = 1:length(postAccIndices)
    if speedAfterAcc(i) >= targetSpeed
        crossingFound = true;
        
        % Use linear interpolation for more precise timing
        if i > 1
            % Get surrounding points
            t1 = timeAfterAcc(i-1);
            s1 = speedAfterAcc(i-1);
            t2 = timeAfterAcc(i);
            s2 = speedAfterAcc(i);
            
            % Calculate crossing time with linear interpolation
            tCrossing = t1 + (targetSpeed - s1) * (t2 - t1) / (s2 - s1);
            
            % Time constant is time elapsed since acceleration start
            Time_Constant = tCrossing - Acc_Start_Time;
        else
            % If first point after acceleration already exceeds target
            Time_Constant = timeAfterAcc(i) - Acc_Start_Time;
        end
        break;
    end
end
