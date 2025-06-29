% This is to drive the simulink basic_motor_circ.slx twice with
% different settings and then plot their results in a single plot.

close all;
clear;
clc;

% Reuse figure if it exists, else create new figure
try
    figure(h1_basic_motor_circ)
catch
    h1_basic_motor_circ=figure('Name', 'basic_motor_circ');
end

shaft_coupling_inertia = 1e-5 ; % kg*m^2 

%% The unlimited current
% Let
i_limit = 1000; %#ok<NASGU> % A  %#ok<NASGU> 
% then simulate
sim('basic_motor_circ');
SV_no_limit = simlog_basic_motor_circ;
% now, extract the variables:
speed_no_i_limit = SV_no_limit.Inertia.w.series.values;
speed_no_i_limit_time = SV_no_limit.Inertia.w.series.time;
%
torque_no_limit = -SV_no_limit.Gear_Box.t_out.series.values;
torque_no_i_limit_time = SV_no_limit.Gear_Box.t_out.series.time;
%
i_no_limit = SV_no_limit.DC_Motor.i.series.values;
i_no_i_limit_time = SV_no_limit.DC_Motor.i.series.time;


%% The limited current

% Let
i_limit = 12.5;  
% then simulate
sim('basic_motor_circ');
SV_limit = simlog_basic_motor_circ;
% now, extract the variables:
speed_i_limit = SV_limit.Inertia.w.series.values;
speed_i_limit_time = SV_limit.Inertia.w.series.time;
%
torque_i_limit = -SV_limit.Gear_Box.t_out.series.values;
torque_i_limit_time = SV_limit.Gear_Box.t_out.series.time;
%
i_limit_values = SV_limit.DC_Motor.i.series.values;
i_limit_values_time = SV_limit.DC_Motor.i.series.time;


%% Plot the results
%
ah(1) = subplot(3,1,1);
plot(speed_no_i_limit_time,speed_no_i_limit*9.5493,'LineWidth',0.9);
hold on;
plot(speed_i_limit_time,speed_i_limit*9.5493,'LineWidth',1);
hold off;
grid on;
title('Speed after gear');
set(gca,'xticklabel',{[]});
ylabel('Speed (rpm)');
%
ah(2) = subplot(3,1,2);
plot(torque_no_i_limit_time, torque_no_limit, 'LineWidth',0.9);
hold on;
plot(torque_i_limit_time, torque_i_limit, 'LineWidth', 1);
hold off;
grid on;
set(gca,'YLim',[0 0.025]);
legend('with unlimited current','with limited current');
title('Torque after gear');

set(gca,'xticklabel',{[]});
ylabel('Torque (N*m)');
%
ah(3) = subplot(3,1,3);
plot(i_no_i_limit_time, i_no_limit, 'LineWidth',0.9);
hold on;
plot(i_limit_values_time, i_limit_values, 'LineWidth',1);
hold off;
grid on;
set(gca,'YLim',[0 110]);
title('Motor current');
ylabel('Current (A)');
%
xlabel('Time in seconds');
linkaxes(ah,'x');

%%  Remove temporary variables
clear SV_limit SV_no_limit;

clear speed_no_i_limit_time speed_no_i_limit;
clear speed_i_limit_time speed_i_limit;

clear i_no_i_limit_time i_no_limit;
clear i_limit_values_time i_limit_values;

clear torque_no_i_limit_time torque_no_limit ;
clear torque_i_limit_time torque_i_limit ;

clear ah;

