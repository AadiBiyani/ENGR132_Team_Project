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

% Read raw data from csv file
raw_data = readmatrix("Sp25_cruiseAuto_experimental_data.csv");

% Assign Variables
data_set = raw_data(:,2:end);
time = raw_data(:,1);

%% ____________________
%% CALCULATIONS

out1 = M1B_sub2_014_18_biyania(data_set); % call subfunction 1
 
out2 = M1B_sub3_014_18_mzeeb(data_set); % call subfunction 2

out3 = M1B_sub4_014_18_fagan13(data_set); % call subfunction 3


%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

figure(1)

% subplot1:
subplot(3,3,1)
hold on
for a = 1:(1+4)
    plot(time, data_set(:, a), 'b-');
end
xlabel("Time[s]");
ylabel("Speed[m/s]");
title("ACC Performance of compact car with winter tire")
grid on

%subplot2:
subplot(3,3,2)
hold on
for a = 6:(6+4)
    plot(time, data_set(:, a), 'b-');
end
xlabel("Time[s]");
ylabel("Speed[m/s]");
title("ACC Performance of compact car with allseason tire")
grid on

%subplot3:
subplot(3,3,3)
hold on
for a = 11:(11+4)
    plot(time, data_set(:, a), 'b-');
end
xlabel("Time[s]");
ylabel("Speed[m/s]");
title("ACC Performance of compact car with summer tire")
grid on

% subplot4:
subplot(3,3,4)
hold on
for a = 16:(16+4)
    plot(time, data_set(:, a), 'b-');
end
xlabel("Time[s]");
ylabel("Speed[m/s]");
title("ACC Performance of sedan car with winter tire")
grid on

%subplot5:
subplot(3,3,5)
hold on
for a = 21:(21+4)
    plot(time, data_set(:, a), 'b-');
end
xlabel("Time[s]");
ylabel("Speed[m/s]");
title("ACC Performance of sedan car with allseason tire")
grid on

%subplot6:
subplot(3,3,6)
hold on
for a = 26:(26+4)
    plot(time, data_set(:, a), 'b-');
end
xlabel("Time[s]");
ylabel("Speed[m/s]");
title("ACC Performance of sedan car with summer tire")
grid on

% subplot7:
subplot(3,3,7)
hold on
for a = 31:(31+4)
    plot(time, data_set(:, a), 'b-');
end
xlabel("Time[s]");
ylabel("Speed[m/s]");
title("ACC Performance of SUV car with winter tire")
grid on

%subplot8:
subplot(3,3,8)
hold on
for a = 36:(36+4)
    plot(time, data_set(:, a), 'b-');
end
xlabel("Time[s]");
ylabel("Speed[m/s]");
title("ACC Performance of SUV car with allseason tire")
grid on

%subplot9:
subplot(3,3,9)
hold on
for a = 41:(41+4)
    plot(time, data_set(:, a), 'b-');
end
xlabel("Time[s]");
ylabel("Speed[m/s]");
title("ACC Performance of SUV car with summer tire")
grid on

sgtitle("ACC Performance of All Types of Cars and Tires")

%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



