% Rayleigh fading simulation
clear 

%% parameters setting
freq     = 3e9; % frequency [Hz]
velocity = 0.5; % velocity of Rx [m/s]
num_path = 100; % number of arrival waves
phai_i   = rand(1,num_path)*2*pi; % arrival angle [rad]
zeta_i   = rand(1,num_path)*2*pi; % initial phase [rad]
lambda   = physconst('LightSpeed') / freq; % wavelength [m]
count    = 1;

%% calculate the amplitude
for t=0:0.001:1
    R(count,1)=t;
    R(count,2)=1/sqrt(num_path)*sum(exp(1i*(2*pi*velocity*t*cos(phai_i)/lambda+zeta_i))); % amplitude
    R(count,3)=20*log10(abs(R(count,2))); % amplitude in dB
    count=count+1;
end

%% plot pathloss with shadowing
% plot
f = figure;
% f.Position(3:4) = [600 300]; % for draft
f.Position(3:4) = [560 420]; % for slide
% f.Position(3:4) = [600 350]; % for thesis

xlabel("Times [sec]" , "Fontsize", 15, "Fontname", "Times New Roman");
ylabel("Amplitude [dB]", "Fontsize", 15, "Fontname", "Times New Roman");
hold on
grid on
box on
p1 = plot(R(:,1), R(:,3), "-", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");

p1.Color = genRGBForPlot(1);

% legend settings
legend("Rayleigh Fading", "Location", "northeast", "Fontsize", 20, "Fontname", "Times New Roman")
