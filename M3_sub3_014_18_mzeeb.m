function [Acc_Start_Time, Time_Constant] = M3_sub3_014_18_mzeeb (speedVec, timeVec, initialSpeed, finalSpeed)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This Matlab Function will calculate acceleration start time and the time
% constant given smoothed data from programmer two and intial/final speeds.
%
% Function Call
% M3_sub3_014_18_mzeeb (speedVec, timeVec, initialSpeed, finalSpeed)
%
% Input Arguments
% speedVec = Speed Vector (m/s)
% timeVec = Time Vector (seconds)
% initialSpeed - initial speed (m/s) from subfunction three
% finalSpeed - fianl speed (m/s) from subfunction three
%
% Output Arguments
% Time_Constant - system time constant (seconds)
% Acc_Start_Time = Acceleration Start Time (m/s^2)
%
% Assignment Information
%   Assignment:     M01, Problem 1
%   Team member:    Makayla Zeeb, mzeeb@purdue.edu [repeat for each person]
%   Team ID:        014-18
%   Academic Integrity:
%     [x] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with (team members):
%                           Maeve Fagan -  fagan13
%                           Rodrick Wu  -  wu2425
%                           Aadi Biyani -  biyania            
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
[rows,cols] = size(speedVec);
halfWindow = 5;

%% ____________________
%% CALCULATIONS
%% Time Constant Calculation
%Calculate target speed
speed_Tc = initialSpeed + 0.632*(finalSpeed-initialSpeed);

%Locare the index close to the target speed
[~, lin_timeConst] = min(abs(speedVec - speed_Tc)); 
Time_Constant = timeVec(lin_timeConst);

%Extract data containing the time constant
Time_Constant = timeVec (lin_timeConst);

%%Acceleration Start Time Calculations
stopvalue = 0; 
Acc_Start_Time = timeVec(1);       %Initialize first time point
for row = 1:rows
    %Define Boundries
    startInx = max(1, row - halfWindow);
    endIndx = min(rows, row + halfWindow);
    
    %Calculate linear fit slope 
    lin_data = polyfit(timeVec(startInx:endIndx), speedVec(startInx:endIndx), 1);
    slope = lin_data(1);
    
    % Detect significant initial acceleration
    if slope > 0.5 && stopvalue == 0
        Acc_Start_Time = timeVec(row);
        stopvalue = 1;
    end
end


%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
% No text display needed

%% ____________________
%% RESULTS



%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



