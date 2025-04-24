function M3_performance_014_18()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This program generates three figures displaying each vehicle’s benchmark 
% data and models and the performance boundaries to visualize how the 
% data and models fit within the boundaries.
%
% Function Call
% M3_performance_014_18()
%
% Input Arguments
% The main function has no inputs
%
% Output Arguments
% The main function has no outputs
%
% Assignment Information
% Assignment Information
%   Assignment:     M03
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

% Compact Model
model_compact = [];
ts = 5;
tc = 1.51;
yL = -0.09;
yH = 25.08;
for count = 1:length(time)
    t = time(count);
    if 0 <= t && t < ts
        model_compact(count) = yL;
    elseif  ts <= t
        model_compact(count) = yL + (1 - exp(-(t-ts) / tc)) *...
        (yH - yL);
    end
end

% Sedan Model
model_sedan = [];
ts = 5;
tc = 1.96;
yL = -0.22;
yH = 24.72;
for count = 1:length(time)
    t = time(count);
    if 0 <= t && t < ts
        model_sedan(count) = yL;
    elseif  ts <= t
        model_sedan(count) = yL + (1 - exp(-(t-ts) / tc)) *...
        (yH - yL);
    end
end

% Sedan Model
model_SUV = [];
ts = 5;
tc = 2.80;
yL = 0.19;
yH = 24.18;
for count = 1:length(time)
    t = time(count);
    if 0 <= t && t < ts
        model_SUV(count) = yL;
    elseif  ts <= t
        model_SUV(count) = yL + (1 - exp(-(t-ts) / tc)) *...
        (yH - yL);
    end
end


%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
figure(1)

% subplot1:
subplot(3,1,1)
hold on
h1 = plot(time,data_set(:,1),'b-');
h3 = plot(time, model_compact,'g-')

plot(time,response_left,'r-');
h2 = plot(time,response_right,'r-');
legend([h1 h2 h3], {'dataset', 'boundary', 'model'}, 'Location', 'best')

xlabel("Time[s]");
ylabel("Speed[m/s]");
title("ACC Performance of compact car")
grid on

%subplot2:
subplot(3,1,2)
hold on
h1 = plot(time,data_set(:,2),'b-');
h3 = plot(time, model_sedan,'g-')

plot(time,response_left,'r-');
h2 = plot(time,response_right,'r-');
legend([h1 h2 h3], {'dataset', 'boundary', 'model'}, 'Location', 'best')

xlabel("Time[s]");
ylabel("Speed[m/s]");
title("ACC Performance of sedan car")
grid on

%subplot3:
subplot(3,1,3)
hold on
h1 = plot(time,data_set(:,3),'b-');
h3 = plot(time, model_SUV,'g-')

plot(time,response_left,'r-');
h2 = plot(time,response_right,'r-');
legend([h1 h2 h3], {'dataset', 'boundary', 'model'}, 'Location', 'best')

xlabel("Time[s]");
ylabel("Speed[m/s]");
title("ACC Performance of SUV car")
grid on

sgtitle("ACC Performance of All Types of Cars")
