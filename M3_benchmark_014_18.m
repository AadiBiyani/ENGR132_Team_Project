function [SSEcompact, SSEsedan, SSEsuv]=M3_benchmark_014_18( )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This MATLAB program imports the data from CruiseAuto's benchmark data for
% the three different vehicle types, calculates the piecewise function for
% each dataset, and calculates the sum of squared errors for each. It plots
% the data vs model for each car.
%
% Function Call:
% [SSEcompact, SSEsedan, SSEsuv]=M3_benchmark_014_18( )
%
% Input Arguments
%
% Output Arguments
% SSEcompact = the SSE for the compact vehicle
% SSEsedan = the SSE for the sedan vehicle
% SSEsuv = the SSE for the suv vehicle
%
% Assignment Information
%   Assignment:     M3, Problem 4a
%   Team member:    Maeve Fagan, fagan13@purdue.edu [repeat for each person]
%   Team ID:        014-18
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: Name, login@purdue [repeat for each]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
benchmarkData= readmatrix("Sp25_cruiseAuto_M3benchmark_data.csv"); %Imports the data
%Initalizes the data for each car and time
time= benchmarkData(:,1);
compact=benchmarkData(:,2);
sedan=benchmarkData(:,3);
suv= benchmarkData(:,4);

%The compact vehicles benchmark values
compactTS=6.21;
compactT=1.51;
compactYL=-0.09;
compactYH=25.08;

%The sedan vehicles benchmark values
sedanTS=9.39;
sedanT=1.96;
sedanYL=-0.22;
sedanYH=24.72;

%The SUV vehicles benchmark values
suvTS=6.85;
suvT=2.80;
suvYL=0.19;
suvYH=24.18;

%Determines data length for model
n=numel(time);
modelCompact=zeros(n,1);
modelSedan=zeros(n,1);
modelSuv=zeros(n,1);
%% ____________________
%% CALCULATIONS
%Calculates the piecewise for the compact car
for i=1:n
    timeCompact=time(i);
    if timeCompact < compactTS
        modelCompact(i)=compactYL;
    else
        modelCompact(i)= compactYL +(compactYH-compactYL)*(1-exp(-(timeCompact-compactTS)/compactT));
    end
end

%Calculates the piecewise for the sedan car
for i=1:n
    timeSedan=time(i);
    if timeSedan < sedanTS
        modelSedan(i)=sedanYL;
    else
        modelSedan(i)= sedanYL +(sedanYH-sedanYL)*(1-exp(-(timeSedan-sedanTS)/sedanT));
    end
end

%Calculates the piecewise for the SUV car
for i=1:n
    timeSuv=time(i);
    if timeSuv < suvTS
        modelSuv(i)=suvYL;
    else
        modelSuv(i)= suvYL +(suvYH-suvYL)*(1-exp(-(timeSuv-suvTS)/suvT));
    end
end

%Calculates each vehicles average sqaured error
SSEcompact= sum((compact-modelCompact).^2)/numel(compact);
SSEsedan=sum((sedan-modelSedan).^2)/numel(sedan);
SSEsuv=sum((suv-modelSuv).^2)/numel(suv);

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
%Plot of the compact vehicle
subplot(2, 2, 1)
plot(time, compact, '-r')
hold on
plot(time, modelCompact, '-b', 'LineWidth',2)
xlabel('Time (seconds)')
ylabel('Speed m/s')
title('Speed of the Compact Car Over Time.')
grid on
legend('Benchmark data', 'Model data', 'Location', 'Best')
hold off

%Plot of the sedan vehicle
subplot(2, 2, 2)
plot(time, sedan, '-r')
hold on
plot(time, modelSedan, '-b','LineWidth',2)
xlabel('Time (seconds)')
ylabel('Speed m/s')
title('Speed of the Sedan Car Over Time.')
grid on
legend('Benchmark data', 'Model data', 'Location', 'Best')
hold off

%Plot of the SUV vehicle
subplot(2, 2, 3)
plot(time, suv, '-r')
hold on
plot(time, modelSuv, '-b','LineWidth',2)
xlabel('Time (seconds)')
ylabel('Speed m/s')
title('Speed of the SUV Car Over Time.')
grid on
legend('Benchmark data', 'Model data', 'Location', 'Best')
hold off

sgtitle('Benchmark Speed of The Three Types of Cars Over Time')



%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



