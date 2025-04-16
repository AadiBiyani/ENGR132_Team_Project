function [output] = M2_sub2_014_18_biyania(input)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This program takes a dataset and applies a moving average filter 
% to reduce noise in the data
%
% Function Call
% [output] = M2_sub2_014_18_biyania(input)
%
% Input Arguments
% input vector of numerical data
%
% Output Arguments
% output - smoothed data after applying the moving average
%
% Assignment Information
%   Assignment:     M02, Problem #2
%   Team member:    Aadi Biyani, biyania@purdue.edu 
%   Team ID:        014-18
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% initialize the window size and the number of rows and columns in the data
% Create output variable filled with 0s so we can fill it with the result
%% INITIALIZATION
windowSize = 11;  % Changeable parameter
[numRows, numCols] = size(input);
output = zeros(numRows, numCols); 

%% ____________________
%% CALCULATIONS
halfWin = floor(windowSize / 2);

for col = 1:numCols
    for i = 1:numRows
        startIdx = max(1, i - halfWin);
        endIdx = min(numRows, i + halfWin);
        output(i, col) = mean(input(startIdx:endIdx, col));
    end
end


%% Not needed
%% FORMATTED TEXT/FIGURE DISPLAYS

%% No display needed
%% RESULTS
% Output is already computed and returned

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.

end
