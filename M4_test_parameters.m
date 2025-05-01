function M4_test_parameters()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This script demonstrates the use of the improved parameter calculation function
% by calling it on the benchmark data and displaying the results.
%
% Function Call
% M4_test_parameters()
%
% Input Arguments
% None
%
% Output Arguments
% None - Results displayed in command window
%
% Assignment Information
%   Assignment:     M4
%   Team ID:        014-18
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
% Read benchmark data
benchmark_data = readmatrix("Sp25_cruiseAuto_M3benchmark_data.csv");
time = benchmark_data(:, 1);
compact = benchmark_data(:, 2);
sedan = benchmark_data(:, 3);
suv = benchmark_data(:, 4);

% Reference benchmark values from original code
% Compact car
ref_compact_ts = 5;
ref_compact_tc = 1.51;
ref_compact_y0 = -0.09;
ref_compact_yf = 25.08;

% Sedan car
ref_sedan_ts = 5;
ref_sedan_tc = 1.96;
ref_sedan_y0 = -0.22;
ref_sedan_yf = 24.72;

% SUV car
ref_suv_ts = 5;
ref_suv_tc = 2.80;
ref_suv_y0 = 0.19;
ref_suv_yf = 24.18;

%% ____________________
%% CALCULATIONS
% Apply data smoothing using M4_sub2_014_18_biyania
data_set = [compact, sedan, suv];
smooth_data = M4_sub2_014_18_biyania(data_set);

% Extract the smoothed data for each vehicle
compact_smooth = smooth_data(:, 1);
sedan_smooth = smooth_data(:, 2);
suv_smooth = smooth_data(:, 3);

% Calculate parameters for each vehicle type
[compact_ts, compact_tc, compact_y0, compact_yf] = M4_calculate_parameters(compact_smooth, time);
[sedan_ts, sedan_tc, sedan_y0, sedan_yf] = M4_calculate_parameters(sedan_smooth, time);
[suv_ts, suv_tc, suv_y0, suv_yf] = M4_calculate_parameters(suv_smooth, time);

%% ____________________
%% CALCULATE PERCENT ERRORS
% Compact car
compact_ts_error = 100 * abs(compact_ts - ref_compact_ts) / abs(ref_compact_ts);
compact_tc_error = 100 * abs(compact_tc - ref_compact_tc) / abs(ref_compact_tc);
compact_y0_error = 100 * abs(compact_y0 - ref_compact_y0) / abs(ref_compact_y0);
compact_yf_error = 100 * abs(compact_yf - ref_compact_yf) / abs(ref_compact_yf);

% Sedan car
sedan_ts_error = 100 * abs(sedan_ts - ref_sedan_ts) / abs(ref_sedan_ts);
sedan_tc_error = 100 * abs(sedan_tc - ref_sedan_tc) / abs(ref_sedan_tc);
sedan_y0_error = 100 * abs(sedan_y0 - ref_sedan_y0) / abs(ref_sedan_y0);
sedan_yf_error = 100 * abs(sedan_yf - ref_sedan_yf) / abs(ref_sedan_yf);

% SUV car
suv_ts_error = 100 * abs(suv_ts - ref_suv_ts) / abs(ref_suv_ts);
suv_tc_error = 100 * abs(suv_tc - ref_suv_tc) / abs(ref_suv_tc);
suv_y0_error = 100 * abs(suv_y0 - ref_suv_y0) / abs(ref_suv_y0);
suv_yf_error = 100 * abs(suv_yf - ref_suv_yf) / abs(ref_suv_yf);

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
% Display results in command window
disp('==== Improved Parameter Calculation Results ====')

% Create table for compact car
fprintf('\nCompact Car Parameters:\n')
param_names = {'Parameter', 'Benchmark Value', 'Calculated Value', 'Percent Error (%)'};
compact_data = {
    'Acceleration start time [s]', ref_compact_ts, compact_ts, compact_ts_error;
    'Time constant [s]', ref_compact_tc, compact_tc, compact_tc_error;
    'Initial speed [m/s]', ref_compact_y0, compact_y0, compact_y0_error;
    'Final speed [m/s]', ref_compact_yf, compact_yf, compact_yf_error
};
disp(table(compact_data(:,1), cell2mat(compact_data(:,2)), cell2mat(compact_data(:,3)), ...
    cell2mat(compact_data(:,4)), 'VariableNames', param_names))

% Create table for sedan car
fprintf('\nSedan Car Parameters:\n')
sedan_data = {
    'Acceleration start time [s]', ref_sedan_ts, sedan_ts, sedan_ts_error;
    'Time constant [s]', ref_sedan_tc, sedan_tc, sedan_tc_error;
    'Initial speed [m/s]', ref_sedan_y0, sedan_y0, sedan_y0_error;
    'Final speed [m/s]', ref_sedan_yf, sedan_yf, sedan_yf_error
};
disp(table(sedan_data(:,1), cell2mat(sedan_data(:,2)), cell2mat(sedan_data(:,3)), ...
    cell2mat(sedan_data(:,4)), 'VariableNames', param_names))

% Create table for SUV car
fprintf('\nSUV Car Parameters:\n')
suv_data = {
    'Acceleration start time [s]', ref_suv_ts, suv_ts, suv_ts_error;
    'Time constant [s]', ref_suv_tc, suv_tc, suv_tc_error;
    'Initial speed [m/s]', ref_suv_y0, suv_y0, suv_y0_error;
    'Final speed [m/s]', ref_suv_yf, suv_yf, suv_yf_error
};
disp(table(suv_data(:,1), cell2mat(suv_data(:,2)), cell2mat(suv_data(:,3)), ...
    cell2mat(suv_data(:,4)), 'VariableNames', param_names))

%% ____________________
%% PLOT RESULTS
figure;

% Generate model using calculated parameters
compact_model = zeros(size(time));
sedan_model = zeros(size(time));
suv_model = zeros(size(time));

for i = 1:length(time)
    t = time(i);
    % Compact model
    if t < compact_ts
        compact_model(i) = compact_y0;
    else
        compact_model(i) = compact_y0 + (compact_yf - compact_y0) * (1 - exp(-(t - compact_ts) / compact_tc));
    end
    
    % Sedan model
    if t < sedan_ts
        sedan_model(i) = sedan_y0;
    else
        sedan_model(i) = sedan_y0 + (sedan_yf - sedan_y0) * (1 - exp(-(t - sedan_ts) / sedan_tc));
    end
    
    % SUV model
    if t < suv_ts
        suv_model(i) = suv_y0;
    else
        suv_model(i) = suv_y0 + (suv_yf - suv_y0) * (1 - exp(-(t - suv_ts) / suv_tc));
    end
end

% Compact car subplot
subplot(3, 1, 1);
plot(time, compact, 'b-', 'DisplayName', 'Raw Data');
hold on;
plot(time, compact_model, 'r-', 'LineWidth', 2, 'DisplayName', 'Improved Model');
xlabel('Time (s)');
ylabel('Speed (m/s)');
title('Compact Car');
legend('Location', 'best');
grid on;

% Sedan car subplot
subplot(3, 1, 2);
plot(time, sedan, 'b-', 'DisplayName', 'Raw Data');
hold on;
plot(time, sedan_model, 'r-', 'LineWidth', 2, 'DisplayName', 'Improved Model');
xlabel('Time (s)');
ylabel('Speed (m/s)');
title('Sedan Car');
legend('Location', 'best');
grid on;

% SUV car subplot
subplot(3, 1, 3);
plot(time, suv, 'b-', 'DisplayName', 'Raw Data');
hold on;
plot(time, suv_model, 'r-', 'LineWidth', 2, 'DisplayName', 'Improved Model');
xlabel('Time (s)');
ylabel('Speed (m/s)');
title('SUV Car');
legend('Location', 'best');
grid on;

sgtitle('Improved Parameter Models vs. Raw Data');

end 
