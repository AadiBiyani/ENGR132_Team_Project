function [response_left, response_right] = M2_sub5_boundary_014_18_wu2425(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This is a helper function to calculate the boundary vectors for plotting
%
% Function Call
% [response_left, response_right] = M2_sub5_boundary_014_18_wu2425(x)
%
% Input Arguments
% x: the time vector
%
% Output Arguments
% response_left: vector of speed for left boundary
% response_right: vector of speed for right boundary
%
% Assignment Information
%   Assignment:     M02, Problem #1
%   Team member:    Roderick, wu2425@purdue.edu
%                   Aadi, biyania@purdue.edu
%                   Makayla, mzeeb@purdue.edu
%                   Maeve, fagan13@purdue.edu
%                
%   Team ID:        014-18
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: Roderick, wu2425@purdue.edu
%                   Aadi, biyania@purdue.edu
%                   Makayla, mzeeb@purdue.edu
%                   Maeve, fagan13@purdue.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %% ____________________
    %% INITIALIZATION
    % Time when ACC starts acceleration [s]
    ts_left = 4.5;
    ts_right = 6;
    
    % Time constant [s]
    tc_left = 1.26;
    tc_right = 3.89;
    
    % Initial speed [m/s]
    yL_left = 1.1;
    yL_right = -0.9;
    
    % Final speed [m/s]
    yh_left = 25.82;
    yh_right = 23.36;

    %% ____________________
    %% CALCULATIONS

    % calculate response of left bound
    response_left = [];
    for count = 1:length(x)
        t = x(count);
        if 0 <= t && t < ts_left
            response_left(count) = yL_left;
        elseif  ts_left <= t
            response_left(count) = yL_left + (1 - exp(-(t-ts_left) / tc_left)) *...
            (yh_left - yL_left);
        end
    end
    
    % calculate response of right bound
    response_right = [];
    for count = 1:length(x)
        t = x(count);
        if 0 <= t && t < ts_right
            response_right(count) = yL_right;
        elseif  ts_right <= t
            response_right(count) = yL_right + (1 - exp(-(t-ts_right) / tc_right)) *...
            (yh_right - yL_right);
        end
    end

    %% ____________________
%% FORMATTED TEXT & FIGURE DISPLAYS

