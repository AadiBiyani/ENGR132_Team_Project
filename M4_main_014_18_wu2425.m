%function M4_main_014_18_wu2425()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This program reads data from a CSV file and calls subfunctions to  
% clean the data and calculate the required coefficients. It then plots  
% a couple of figures to show the results of ACC performance on different  
% types of cars and tires. 
%
% Function Call
% M4 _main_014_18_wu2425()
%
% Input Arguments
% The main function has no inputs
%
% Output Arguments
% The main function has no outputs
%
% Assignment Information
%   Assignment:     M4, Problem 4
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

[response_left, response_right] = M4_sub5_boundary_014_18_wu2425(time);

%% ____________________
%% CALCULATIONS

data_set = M4_sub2_014_18_biyania(data_set); % call subfunction 1

for a = 1:size(data_set, 2)
    % call subfunction 3
    [initialSpeed(a), finalSpeed(a)] = M3_sub4_014_18_fagan13(time, data_set(:,a));
    % call subfunction 2
    [Acc_Start_Time(a), Time_Constant(a)] = M3_sub3_014_18_mzeeb(time, data_set(:,a), initialSpeed(a), finalSpeed(a));
end

for a = 1:size(data_set, 2)

    %start_time = Acc_Start_Time(a);
    start_time = 5;
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

figure(1)

% subplot1:
subplot(3,3,1)
hold on
for a = 1:(1+4)
    h1 = plot(time, data_set(:, a), 'b-');
end

plot(time,response_left,'r-');
h2 = plot(time,response_right,'r-');
legend([h1 h2], {'dataset', 'boundary'}, 'Location', 'best')

xlabel("Time[s]");
ylabel("Speed[m/s]");
title("ACC Performance of compact car with winter tire")
grid on

%subplot2:
subplot(3,3,2)
hold on
for a = 6:(6+4)
    h1 = plot(time, data_set(:, a), 'b-');
end

plot(time,response_left,'r-');
h2 = plot(time,response_right,'r-');
legend([h1 h2], {'dataset', 'boundary'}, 'Location', 'best')

xlabel("Time[s]");
ylabel("Speed[m/s]");
title("ACC Performance of compact car with allseason tire")
grid on

%subplot3:
subplot(3,3,3)
hold on
for a = 11:(11+4)
    h1 = plot(time, data_set(:, a), 'b-');
end

plot(time,response_left,'r-');
h2 = plot(time,response_right,'r-');
legend([h1 h2], {'dataset', 'boundary'}, 'Location', 'best')

xlabel("Time[s]");
ylabel("Speed[m/s]");
title("ACC Performance of compact car with summer tire")
grid on

% subplot4:
subplot(3,3,4)
hold on
for a = 16:(16+4)
    h1 = plot(time, data_set(:, a), 'b-');
end

plot(time,response_left,'r-');
h2 = plot(time,response_right,'r-');
legend([h1 h2], {'dataset', 'boundary'}, 'Location', 'best')

xlabel("Time[s]");
ylabel("Speed[m/s]");
title("ACC Performance of sedan car with winter tire")
grid on

%subplot5:
subplot(3,3,5)
hold on
for a = 21:(21+4)
    h1 = plot(time, data_set(:, a), 'b-');
end

plot(time,response_left,'r-');
h2 = plot(time,response_right,'r-');
legend([h1 h2], {'dataset', 'boundary'}, 'Location', 'best')

xlabel("Time[s]");
ylabel("Speed[m/s]");
title("ACC Performance of sedan car with allseason tire")
grid on

%subplot6:
subplot(3,3,6)
hold on
for a = 26:(26+4)
    h1 = plot(time, data_set(:, a), 'b-');
end

plot(time,response_left,'r-');
h2 = plot(time,response_right,'r-');
legend([h1 h2], {'dataset', 'boundary'}, 'Location', 'best')

xlabel("Time[s]");
ylabel("Speed[m/s]");
title("ACC Performance of sedan car with summer tire")
grid on

% subplot7:
subplot(3,3,7)
hold on
for a = 31:(31+4)
    h1 = plot(time, data_set(:, a), 'b-');
end

plot(time,response_left,'r-');
h2 = plot(time,response_right,'r-');
legend([h1 h2], {'dataset', 'boundary'}, 'Location', 'best')

xlabel("Time[s]");
ylabel("Speed[m/s]");
title("ACC Performance of SUV car with winter tire")
grid on

%subplot8:
subplot(3,3,8)
hold on
for a = 36:(36+4)
        h1 = plot(time, data_set(:, a), 'b-');
end

plot(time,response_left,'r-');
h2 = plot(time,response_right,'r-');
legend([h1 h2], {'dataset', 'boundary'}, 'Location', 'best')

xlabel("Time[s]");
ylabel("Speed[m/s]");
title("ACC Performance of SUV car with allseason tire")
grid on

%subplot9:
subplot(3,3,9)
hold on
for a = 41:(41+4)
    h1 = plot(time, data_set(:, a), 'b-');
end

plot(time,response_left,'r-');
h2 = plot(time,response_right,'r-');
legend([h1 h2], {'dataset', 'boundary'}, 'Location', 'best')

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


