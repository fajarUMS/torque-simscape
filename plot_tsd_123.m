% plot_tsd_123.m
%
% Code to plot graphs when motors are driving against torque.
%
% Starting from 0, only one motor. Then,
% Starting from 0, two motors. Then,
% Starting form 0, three motors.

clear; 

load("TSD_satu_motor.mat")
load("TSD_dua_motor.mat")
load("TSD_tiga_motor.mat")

%% Satu motor
%
%%% Motor pertama
% %% kalau mengambil dari Simscape components:
% i_m1 = TSD_satu_motor.simlog.M1.DC_Motor_1.i.series.values;
%
% %% kalau mengambil dari Simulink, after filter:
time_single = TSD_satu_motor.tout;
% Power, current, v motor.
pElec_single_m1 = TSD_satu_motor.M1_Elec.Data(:,1) ;
i_single_m1     = TSD_satu_motor.M1_Elec.Data(:,2) ;
v_single_m1     = TSD_satu_motor.M1_Elec.Data(:,3) ;
%
% power, torque, speed.
pMech_single_m1 = TSD_satu_motor.M1_Mech.Data(:,1);
torq_single_m1  = TSD_satu_motor.M1_Mech.Data(:,2);
w_single_m1     = TSD_satu_motor.M1_Mech.Data(:,3);
%
eff_single = pMech_single_m1 ./ pElec_single_m1;

%% Dua motor
%
time_double = TSD_dua_motor.tout;
%%% Motor pertama dari dua
% Mengambil dari Simulink, after filter:
% Power, current, v motor.
pElec_double_m1 = TSD_dua_motor.M1_Elec.Data(:,1) ;
i_double_m1     = TSD_dua_motor.M1_Elec.Data(:,2) ;
v_double_m1     = TSD_dua_motor.M1_Elec.Data(:,3) ;
%
% power, torque, speed.
pMech_double_m1 = TSD_dua_motor.M1_Mech.Data(:,1);
torq_double_m1  = TSD_dua_motor.M1_Mech.Data(:,2);
w_double_m1     = TSD_dua_motor.M1_Mech.Data(:,3);
%
%%% Motor kedua dari dua
% Power, current, v motor.
pElec_double_m2 = TSD_dua_motor.M2_Elec.Data(:,1) ;
i_double_m2     = TSD_dua_motor.M2_Elec.Data(:,2) ;
v_double_m2     = TSD_dua_motor.M2_Elec.Data(:,3) ;
%
% power, torque, speed.
pMech_double_m2 = TSD_dua_motor.M2_Mech.Data(:,1);
torq_double_m2  = TSD_dua_motor.M2_Mech.Data(:,2);
w_double_m2     = TSD_dua_motor.M2_Mech.Data(:,3);
%
pElec_double_semua = pElec_double_m1 + pElec_double_m2;
pMech_double_semua = pMech_double_m1 + pMech_double_m2;
eff_double = pMech_double_semua ./ pElec_double_semua; 

%% Tiga motor
%
time_triple = TSD_tiga_motor.tout;
%%% Motor pertama dari tiga
% Mengambil dari Simulink, after filter:
% Power, current, v motor.
pElec_triple_m1 = TSD_tiga_motor.M1_Elec.Data(:,1) ;
i_triple_m1     = TSD_tiga_motor.M1_Elec.Data(:,2) ;
v_triple_m1     = TSD_tiga_motor.M1_Elec.Data(:,3) ;
%
% power, torque, speed.
pMech_triple_m1 = TSD_tiga_motor.M1_Mech.Data(:,1);
torq_triple_m1  = TSD_tiga_motor.M1_Mech.Data(:,2);
w_triple_m1     = TSD_tiga_motor.M1_Mech.Data(:,3);
%
%%% Motor kedua dari tiga
% Power, current, v motor.
pElec_triple_m2 = TSD_tiga_motor.M2_Elec.Data(:,1) ;
i_triple_m2     = TSD_tiga_motor.M2_Elec.Data(:,2) ;
v_triple_m2     = TSD_tiga_motor.M2_Elec.Data(:,3) ;
% power, torque, speed.
pMech_triple_m2 = TSD_tiga_motor.M2_Mech.Data(:,1);
torq_triple_m2  = TSD_tiga_motor.M2_Mech.Data(:,2);
w_triple_m2     = TSD_tiga_motor.M2_Mech.Data(:,3);
%
%%% Motor ketiga dari tiga
% Power, current, v motor.
pElec_triple_m3 = TSD_tiga_motor.M3_Elec.Data(:,1) ;
i_triple_m3     = TSD_tiga_motor.M3_Elec.Data(:,2) ;
v_triple_m3     = TSD_tiga_motor.M3_Elec.Data(:,3) ;
% power, torque, speed.
pMech_triple_m3 = TSD_tiga_motor.M3_Mech.Data(:,1);
torq_triple_m3  = TSD_tiga_motor.M3_Mech.Data(:,2);
w_triple_m3     = TSD_tiga_motor.M3_Mech.Data(:,3);
%
%
pElec_triple_semua = pElec_triple_m1 + pElec_triple_m2 + pElec_triple_m3;
pMech_triple_semua = pMech_triple_m1 + pMech_triple_m2 + pMech_triple_m3;
eff_triple = pMech_triple_semua ./ pElec_triple_semua;

%%%%%%
% The above is saved as: data_to_plot_tsd_123_ver_1.mat
% The big .mat's is still there.
%%%%%%

%% Plotting

close all;


%
% ah means axis handle :-).
%
figure('Name', 'Motor 1 from TSD, single motor');
aha(1) = subplot(4,1,1);
plot(time_single, v_single_m1, 'LineWidth',1)
grid on
title('Motor voltage');
set(gca,'xticklabel',{[]});
v = axis; axis([v(1) v(2) v(3) 50])
ylabel('Voltage (V)');
%
aha(2) = subplot(412);
plot(time_single, i_single_m1, 'LineWidth',1)
grid on
title('Motor current');
set(gca,'xticklabel',{[]});
v = axis; axis([v(1) v(2) v(3) 14])
ylabel('Current (A)');
%
aha(3) = subplot(413);
plot(time_single, torq_single_m1, LineWidth=1);
grid on
title('Torque after gear');
set(gca,'xticklabel',{[]});
v = axis; axis([v(1) v(2) v(3) 70])
ylabel('Torque (Nm)');
%
aha(4) = subplot(414);
plot(time_single, w_single_m1, LineWidth=1);
grid on
title('Motor speed');
%set(gca,'xticklabel',{[]});
v = axis; axis([v(1) v(2) v(3) 84])
ylabel('Speed (rpm)');
%
xlabel('Time in seconds');
linkaxes(aha,'x');

% ==============================================

figure('Name', 'Motor 1 from TSD, double motor');
ahb(1) = subplot(4,1,1);
plot(time_double, v_double_m1, 'LineWidth',1)
grid on
title('Motor voltage');
set(gca,'xticklabel',{[]});
ylabel('Voltage (V)');
%
ahb(2) = subplot(412);
plot(time_double, i_double_m1, 'LineWidth',1)
grid on
title('Motor current');
set(gca,'xticklabel',{[]});
ylabel('Current (A)');
%
ahb(3) = subplot(413);
plot(time_double, torq_double_m1, LineWidth=1);
grid on
title('Torque after gear');
set(gca,'xticklabel',{[]});
v = axis; axis([v(1) v(2) v(3) 70])
ylabel('Torque (Nm)');
%
ahb(4) = subplot(414);
plot(time_double, w_double_m1, LineWidth=1);
grid on
title('Motor speed');
v = axis; axis([v(1) v(2) v(3) 84])
%set(gca,'xticklabel',{[]});
ylabel('Speed (rpm)');
%
xlabel('Time in seconds');
linkaxes(ahb,'x');

close % ========================

% ================================

figure('Name', 'Motor 2 from TSD, double motor');
ahc(1) = subplot(4,1,1);
plot(time_double, v_double_m2, 'LineWidth',1)
grid on
title('Motor voltage');
set(gca,'xticklabel',{[]});
ylabel('Voltage (V)');
%
ahc(2) = subplot(412);
plot(time_double, i_double_m2, 'LineWidth',1)
grid on
title('Motor current');
set(gca,'xticklabel',{[]});
ylabel('Current (A)');
%
ahc(3) = subplot(413);
plot(time_double, torq_double_m2, LineWidth=1);
grid on
title('Torque after gear');
set(gca,'xticklabel',{[]});
v = axis; axis([v(1) v(2) v(3) 70])
ylabel('Torque (Nm)');
%
ahc(4) = subplot(414);
plot(time_double, w_double_m2, LineWidth=1);
grid on
title('Motor speed');
v = axis; axis([v(1) v(2) v(3) 84])
%set(gca,'xticklabel',{[]});
ylabel('Speed (rpm)');
%
xlabel('Time in seconds');
linkaxes(ahc,'x');

close % ========================

% ==================================

figure('Name', 'Motor 1 and 2 from TSD, double motor');
bhc(1) = subplot(4,1,1);
plot(time_double, v_double_m1, 'LineWidth',1); hold on;
plot(time_double, v_double_m2, 'LineWidth',1, Color='red', LineStyle='--'); 
grid on
title('Motor voltage');
set(gca,'xticklabel',{[]});
ylabel('Voltage (V)');
%
bhc(2) = subplot(412);
plot(time_double, i_double_m1, 'LineWidth',1); hold on;
plot(time_double, i_double_m2, 'LineWidth',1,Color='red', LineStyle='--');
grid on
title('Motor current');
set(gca,'xticklabel',{[]});
ylabel('Current (A)');
%
bhc(3) = subplot(413);
plot(time_double, torq_double_m1, LineWidth=1);hold on;
plot(time_double, torq_double_m2, LineWidth=1,Color='red', LineStyle='--');
grid on
title('Torque after gear');
set(gca,'xticklabel',{[]});
v = axis; axis([v(1) v(2) v(3) 70])
ylabel('Torque (Nm)');
%
bhc(4) = subplot(414);
plot(time_double, w_double_m1, LineWidth=1);hold on;
plot(time_double, w_double_m2, LineWidth=1, LineWidth=1,Color='red', LineStyle='--');
grid on
title('Motor speed');
v = axis; axis([v(1) v(2) v(3) 84])
%set(gca,'xticklabel',{[]});
ylabel('Speed (rpm)');
%
xlabel('Time in seconds');
linkaxes(bhc,'x');

close % ========================

% ==================================

figure('Name', 'Motor 1 from TSD, triple motor');
ahd(1) = subplot(4,1,1);
plot(time_triple, v_triple_m1, 'LineWidth',1)
grid on
title('Motor voltage');
set(gca,'xticklabel',{[]});
ylabel('Voltage (V)');
%
ahd(2) = subplot(412);
plot(time_triple, i_triple_m1, 'LineWidth',1)
grid on
title('Motor current');
set(gca,'xticklabel',{[]});
ylabel('Current (A)');
%
ahd(3) = subplot(413);
plot(time_triple, torq_triple_m1, LineWidth=1);
grid on
title('Torque after gear');
set(gca,'xticklabel',{[]});
v = axis; axis([v(1) v(2) v(3) 70])
ylabel('Torque (Nm)');
%
ahd(4) = subplot(414);
plot(time_triple, w_triple_m1, LineWidth=1);
grid on
title('Motor speed');
v = axis; axis([v(1) v(2) v(3) 84])
%set(gca,'xticklabel',{[]});
ylabel('Speed (rpm)');
%
xlabel('Time in seconds');
linkaxes(ahd,'x');

close % ========================

% ==================================

figure('Name', 'Motor 2 from TSD, triple motor');
ahe(1) = subplot(4,1,1);
plot(time_triple, v_triple_m2, 'LineWidth',1)
grid on
title('Motor voltage');
set(gca,'xticklabel',{[]});
ylabel('Voltage (V)');
%
ahe(2) = subplot(412);
plot(time_triple, i_triple_m2, 'LineWidth',1)
grid on
title('Motor current');
set(gca,'xticklabel',{[]});
ylabel('Current (A)');
%
ahe(3) = subplot(413);
plot(time_triple, torq_triple_m2, LineWidth=1);
grid on
title('Torque after gear');
set(gca,'xticklabel',{[]});
v = axis; axis([v(1) v(2) v(3) 70])
ylabel('Torque (Nm)');
%
ahe(4) = subplot(414);
plot(time_triple, w_triple_m2, LineWidth=1);
grid on
title('Motor speed');
v = axis; axis([v(1) v(2) v(3) 84])
%set(gca,'xticklabel',{[]});
ylabel('Speed (rpm)');
%
xlabel('Time in seconds');
linkaxes(ahe,'x');

close % ========================

% ==================================

figure('Name', 'Motor 3 from TSD, triple motor');
ahf(1) = subplot(4,1,1);
plot(time_triple, v_triple_m3, 'LineWidth',1)
grid on
title('Motor voltage');
set(gca,'xticklabel',{[]});
ylabel('Voltage (V)');
%
ahf(2) = subplot(412);
plot(time_triple, i_triple_m3, 'LineWidth',1)
grid on
title('Motor current');
set(gca,'xticklabel',{[]});
ylabel('Current (A)');
%
ahf(3) = subplot(413);
plot(time_triple, torq_triple_m3, LineWidth=1);
grid on
title('Torque after gear');
set(gca,'xticklabel',{[]});
v = axis; axis([v(1) v(2) v(3) 70])
ylabel('Torque (Nm)');
%
ahf(4) = subplot(414);
plot(time_triple, w_triple_m3, LineWidth=1);
grid on
title('Motor speed');
v = axis; axis([v(1) v(2) v(3) 84])
%set(gca,'xticklabel',{[]});
ylabel('Speed (rpm)');
%
xlabel('Time in seconds');
linkaxes(ahf,'x');

close % ========================

% ==================================


figure('Name', 'Motor 1, 2, and 3 from TSD, triple motor');
bhf(1) = subplot(4,1,1);



plot(time_triple, v_triple_m1, 'LineWidth',1); hold on;
plot(time_triple, v_triple_m2, 'LineWidth',1); hold on;
plot(time_triple, v_triple_m3, 'LineWidth',1);
grid on
title('Motor voltage');
set(gca,'xticklabel',{[]});
ylabel('Voltage (V)');
%
bhf(2) = subplot(412);
plot(time_triple, i_triple_m1, 'LineWidth',1); hold on;
plot(time_triple, i_triple_m2, 'LineWidth',1); hold on;
plot(time_triple, i_triple_m3, 'LineWidth',1);
grid on
title('Motor current');
set(gca,'xticklabel',{[]});
ylabel('Current (A)');
v = axis; axis([v(1) v(2) v(3) 14])
%
bhf(3) = subplot(413);
plot(time_triple, torq_triple_m1, LineWidth=1); hold on;
plot(time_triple, torq_triple_m2, LineWidth=1); hold on;
plot(time_triple, torq_triple_m3, LineWidth=1);
grid on
title('Torque after gear');
set(gca,'xticklabel',{[]});
v = axis; axis([v(1) v(2) v(3) 70])
ylabel('Torque (Nm)');
%
bhf(4) = subplot(414);
plot(time_triple, w_triple_m1, LineWidth=1); hold on;
plot(time_triple, w_triple_m2, LineWidth=1); hold on;
plot(time_triple, w_triple_m3, LineWidth=1);
grid on
title('Motor speed');
v = axis; axis([v(1) v(2) v(3) 84])
%set(gca,'xticklabel',{[]});
legend('Motor 1', 'Motor 2', 'Motor 3');
ylabel('Speed (rpm)');
%
xlabel('Time in seconds');
linkaxes(bhf,'x');


% ==================================


figure('Name', 'Motor 1 from single, double, and triple scenario.');
bhf(1) = subplot(4,1,1);
plot(time_single, v_single_m1, 'LineWidth',1); hold on;
plot(time_double, v_double_m1, 'LineWidth',1); hold on;
plot(time_triple, v_triple_m1, 'LineWidth',1);
grid on
title('Motor voltage');
set(gca,'xticklabel',{[]});
ylabel('Voltage (V)');
%
bhf(2) = subplot(412);
plot(time_single, i_single_m1, 'LineWidth',1); hold on;
plot(time_double, i_double_m1, 'LineWidth',1); hold on;
plot(time_triple, i_triple_m1, 'LineWidth',1);
grid on
title('Motor current');
set(gca,'xticklabel',{[]});
ylabel('Current (A)');
v = axis; axis([v(1) v(2) v(3) 14])
%
bhf(3) = subplot(413);
plot(time_single, torq_single_m1, LineWidth=1); hold on;
plot(time_double, torq_double_m1, LineWidth=1); hold on;
plot(time_triple, torq_triple_m1, LineWidth=1);
grid on
title('Torque after gear');
set(gca,'xticklabel',{[]});
v = axis; axis([v(1) v(2) v(3) 70])
ylabel('Torque (Nm)');
%
bhf(4) = subplot(414);
plot(time_single, w_single_m1, LineWidth=1); hold on;
plot(time_double, w_double_m1, LineWidth=1); hold on;
plot(time_triple, w_triple_m1, LineWidth=1);
grid on
title('Motor speed');
v = axis; axis([v(1) v(2) v(3) 84])
%set(gca,'xticklabel',{[]});
ylabel('Speed (rpm)');
%
legend('M1, single motor', 'M1, double motor', 'M1, triple motor');
xlabel('Time in seconds');
linkaxes(bhf,'x');

%========================================
%========================================

figure('Name', 'Single Motor: Power and Efficiency');
chf(1) = subplot(2,1,1);
plot(time_single,pElec_single_m1, LineWidth=1); hold on;
plot(time_single, pMech_single_m1, LineWidth=1);
grid on
title('Power: Electrical and Mechanical');
set(gca,'xticklabel',{[]});
ylabel('Power (Watts)');
%
chf(2) = subplot(2,1,2);
plot(time_single,eff_single*100, LineWidth=1); 
grid on
title('Efficiency');
%set(gca,'xticklabel',{[]});
ylabel('Percent');
xlabel('Time in seconds');
linkaxes(chf,'x');



%===========================================

figure('Name', 'Double Motor: Power and Efficiency');
dhf(1) = subplot(2,1,1);
plot(time_double,pElec_double_semua, LineWidth=1); hold on;
plot(time_double, pMech_double_semua, LineWidth=1);
grid on
title('Power: Electrical and Mechanical');
set(gca,'xticklabel',{[]});
ylabel('Power (Watts)');
%
dhf(2) = subplot(2,1,2);
plot(time_double,eff_double*100, LineWidth=1); 
grid on
title('Efficiency');
%set(gca,'xticklabel',{[]});
ylabel('Percent');
xlabel('Time in seconds');
linkaxes(dhf,'x');

% ===========================================

figure('Name', 'Triple Motor: Power and Efficiency');
ehf(1) = subplot(2,1,1);
plot(time_triple,pElec_triple_semua, LineWidth=1); hold on;
plot(time_triple, pMech_triple_semua, LineWidth=1);
grid on
title('Power: Electrical and Mechanical');
set(gca,'xticklabel',{[]});
ylabel('Power (Watts)');
%
ehf(2) = subplot(2,1,2);
plot(time_triple,eff_triple*100, LineWidth=1); 
grid on
title('Efficiency');
%set(gca,'xticklabel',{[]});
ylabel('Percent');
xlabel('Time in seconds');
linkaxes(ehf,'x');
