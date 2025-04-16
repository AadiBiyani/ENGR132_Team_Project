function [initialSpeed, finalSpeed] = M2_sub4_014_18_fagan13(speedVec, timeVec)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This MATLAB program is a subfunction that will output the initial and final 
% speeds of the vehicle based on the first 10 seconds before accleration and 
% the final 5 seconds after acceleration  
%
% Function Call
% [initialSpeed, finalSpeed] = M2_sub4_014_18_fagan13(speedVec, timeVec)
%
% Input Arguments
% speedVec: A vector of speed data (m/s)
% timeVec: A vector of corresponding time data (s)
%
% Output Arguments
% initialSpeed: Average speed before acceleration starts (m/s)
% finalSpeed: Average speed after acceleration ends (m/s)
%
% Assignment Information
%   Assignment:     M2, Problem 1
%   Team member:    Maeve Fagan, fagan13@purdue.edu [repeat for each person]
%   Team ID:        014-18
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: Name, login@purdue [repeat for each]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
initialInter = 10; %Interval before acceleration
finalInter = 5;    %Interval after acceleration

%% ____________________
%% CALCULATIONS
% Estimates the initial speed using the average of the time before acceleration 
initialIndices = timeVec <= initialInter;
initialSpeed = mean(speedVec(initialIndices));

% Estimates the final speed using the average of the time after acceleration 
finalIndices = timeVec >= max(timeVec) - finalInter;
finalSpeed = mean(speedVec(finalIndices));


%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS


%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



