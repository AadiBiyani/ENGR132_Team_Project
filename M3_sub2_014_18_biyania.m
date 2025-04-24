function [output] = M3_sub2_014_18_biyania(input)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This program takes a dataset, replaces NaNs using interpolation,
% and applies a moving average filter to reduce noise in the data,
% accounting for a time shift where time starts at 5.
%
% Function Call
% [output] = M3_sub2_014_18_biyania(input)
%
% Input Arguments
% input - vector or matrix of numerical data (may include NaNs)
%
% Output Arguments
% output - smoothed data after applying the moving average
%
% Assignment Information
%   Assignment:     M03, Problem #2
%   Team member:    Aadi Biyani, biyania@purdue.edu 
%   Team ID:        014-18
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% INITIALIZATION
windowSize = 11;  
[numRows, numCols] = size(input);
output = zeros(numRows, numCols); 
halfWin = floor(windowSize / 2);
timeVec = (0:numRows - 1)';

interpInput = input;

%% DATA PROCESSING
% Interpolate to handle NaNs
for col = 1:numCols
    y = input(:, col);
    validIdx = ~isnan(y);
    
    if sum(validIdx) >= 2
        interpInput(:, col) = interp1(timeVec(validIdx), y(validIdx), timeVec, 'pchip', 'extrap');
    elseif sum(validIdx) > 0
        interpInput(:, col) = y(validIdx(1));
    else
        interpInput(:, col) = mean(input(~isnan(input)), 'all');
    end
end

% Moving average filter
for col = 1:numCols
    for i = 1:numRows
        startIdx = max(1, i - halfWin);
        endIdx = min(numRows, i + halfWin);
        output(i, col) = mean(interpInput(startIdx:endIdx, col));
    end
end

% Return the full smoothed dataset - filtering will be done in main file

%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.

end
