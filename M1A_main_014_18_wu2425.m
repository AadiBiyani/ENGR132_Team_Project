function M1A_main_014_18_wu2425()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This program reads data from a CSV file and calls subfunctions to  
% clean the data and calculate the required coefficients. It then plots  
% a couple of figures to show the results of ACC performance on different  
% types of cars and tires. 
%
% Function Call
% M1A_main_014_18_wu2425()
%
% Input Arguments
% The main function has no inputs
%
% Output Arguments
% The main function has no outputs
%
% Assignment Information
%   Assignment:     M1A, Problem 4
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

data_set = readmatrix("Sp25_cruiseAuto_experimental_data.csv");

%% ____________________
%% CALCULATIONS

out1 = M1A_sub1_014_18_biyania(data_set); % call subfunction 1

out2 = M1A_sub2_014_18_mzeeb(data_set); % call subfunction 2

out3 = M1A_sub3_014_18_fagan13(data_set); % call subfunction 3


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



