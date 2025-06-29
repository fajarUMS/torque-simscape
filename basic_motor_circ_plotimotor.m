% Code to plot simulation results from basic_motor_circ

% Only prints one set of data.
% Instead, use basic_current_limit.m
%   which plots both unlimited and limited current setups.

% Reuse figure if it exists, else create new figure
try
    figure(h1_basic_motor_circ)
catch
    h1_basic_motor_circ=figure('Name', 'basic_motor_circ');
end

% Generate simulation results if they don't exist
if(~exist('simlog_basic_motor_circ','var'))
    sim('basic_motor_circ')
end

% Get simulation results
temp_moti = simlog_basic_motor_circ.DC_Motor.i.series;
temp_inertw = simlog_basic_motor_circ.Inertia.w.series ;
temp_inertt = simlog_basic_motor_circ.Inertia.t.series ;


% Plot results
%
ah(1) = subplot(3,1,1);
plot(temp_inertw.time,temp_inertw.values*9.5493,'LineWidth',1);
grid on
title('Speed after gear');
set(gca,'xticklabel',{[]});
ylabel('Speed (rpm)');
%
ah(2) = subplot(3,1,2);
plot(temp_inertt.time,temp_inertt.values,'LineWidth',1);
%set(gca,'YLim',[0 2.5]);
grid on
title('Torque after gear');
set(gca,'xticklabel',{[]});
ylabel('Torque (N*m)');
%
ah(3) = subplot(3,1,3);
plot(temp_moti.time,temp_moti.values,'LineWidth',1);
%set(gca,'YLim',[0 2.5]);
grid on
title('Motor current');
ylabel('Current (A)');
%
xlabel('Time in seconds');
linkaxes(ah,'x');

% Remove temporary variables
clear temp_moti temp_inertw temp_inertt ah 
