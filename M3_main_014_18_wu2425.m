function M3_main_014_18_wu2425()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This program reads data from a CSV file and calls subfunctions to  
% clean the data and calculate the required coefficients. It then plots  
% a couple of figures to show the results of ACC performance on different  
% types of cars and tires. 
%
% Function Call
% M3_main_014_18_wu2425()
%
% Input Arguments
% The main function has no inputs
%
% Output Arguments
% The main function has no outputs
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

% Read raw data from csv file
raw_data = readmatrix("Sp25_cruiseAuto_M3benchmark_data.csv");

% Assign Variables
data_set = raw_data(:,2:end);
time = raw_data(:,1);

[response_left, response_right] = M3_sub5_boundary_014_18_wu2425(time);

%% ____________________
%% CALCULATIONS

data_set = M3_sub2_014_18_biyania(data_set); % call subfunction 1

for a = 1:size(data_set, 2)
    % call subfunction 3
    [initialSpeed(a), finalSpeed(a)] = M3_sub4_014_18_fagan13(data_set(:,a), time);
    % call subfunction 2
    [Acc_Start_Time(a), Time_Constant(a)] = M3_sub3_014_18_mzeeb(data_set(:,a), time, initialSpeed(a), finalSpeed(a));
end

for a = 1:size(data_set, 2)

    start_time = Acc_Start_Time(a);
    time_const = Time_Constant(a);
    initial_speed = initialSpeed(a);
    final_speed = finalSpeed(a);

    for count = 1:length(time)
        t = time(count);
        if 0 <= t && t < start_time
            data_set(count,a) = initial_speed;
        elseif  start_time <= t
            data_set(count,a) = initial_speed + (1 - exp(-(t-start_time) / time_const)) *...
            (final_speed - initial_speed);
        end
    end
end


%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

%% FORMATTED TEXT/FIGURE DISPLAYS
figure(1)

% subplot1:
subplot(3,1,1)
hold on
h1 = plot(time,data_set(:,1),'b-');

plot(time,response_left,'r-');
h2 = plot(time,response_right,'r-');
legend([h1 h2], {'dataset', 'boundary'}, 'Location', 'best')

xlabel("Time[s]");
ylabel("Speed[m/s]");
title("ACC Performance of compact car")
grid on

%subplot2:
subplot(3,1,2)
hold on
h1 = plot(time,data_set(:,2),'b-');

plot(time,response_left,'r-');
h2 = plot(time,response_right,'r-');
legend([h1 h2], {'dataset', 'boundary'}, 'Location', 'best')

xlabel("Time[s]");
ylabel("Speed[m/s]");
title("ACC Performance of sedan car")
grid on

%subplot3:
subplot(3,1,3)
hold on
h1 = plot(time,data_set(:,3),'b-');

plot(time,response_left,'r-');
h2 = plot(time,response_right,'r-');
legend([h1 h2], {'dataset', 'boundary'}, 'Location', 'best')

xlabel("Time[s]");
ylabel("Speed[m/s]");
title("ACC Performance of SUV car")
grid on

sgtitle("ACC Performance of All Types of Cars")

%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



