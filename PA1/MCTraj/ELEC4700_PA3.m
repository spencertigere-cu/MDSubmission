%Spencer Tigere 101001717

%Parameters

E_field = 1E5; %Electric E_field (v/m)
Echarge = 1.60217662E-19; %Charge of an elctron (Coloumbs)
Emass = 9.11E-31; %Electron Mass (kg)

t_s = 1E-6; %Time step
t_end = 1E-3; %End time

P_d = 0.05; %Probability of electron deflection
N_e = 100; %setting 100 electrons

E_p = zeros(N_e, 1); %Electron position
E_v = zeros(N_e, 1); %Electron velocity



%Plot
subplot(3,1,1);
title('Electron Position');
ylabel('Displacement (m)');
hold on;
subplot(3,1,2); 
title('Electron Velocity');
ylabel('Velocity (m/s)');
hold on;
subplot(3,1,3); 
title('Drift Velocity');
ylabel('Velocity (m/s)');
xlabel('time (s)');
hold on;
    

%Initializing Simulation
for t=0:t_s:t_end
    
    %Time step Calculation
    E_p = E_p + E_v*t_s;
    E_v = E_v + (Echarge*E_field/Emass)*t_s;
    
    %Scatter Electrons
    E_v(rand(N_e,1) < P_d) = 0;
    
    %Calculation of Drift velocity
    V_p = mean(E_v);
    
    %Below are specified plots as asked for in the PA manual
    %Electron Position
    subplot(3,1,1);
    plot(repmat(t, N_e ,1), E_p, 'rX');
    hold on;
    
    %Electron Velocity
    subplot(3,1,2); 
    plot(repmat(t, N_e ,1), E_v, 'bX');
    hold on;

    
    %Drift Velocity
    subplot(3,1,3); 
    plot(t, V_p,'gX');
    hold on;
    
    pause(0.01);
end