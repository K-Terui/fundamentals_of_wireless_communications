clear

p_tx = 30;  % normalized mean received power [dB]
p_devi = 8;   % standard deviation of received power [dB]
e = exp(1);   % Euler's number
d_0 = 1;     % reference distance (micro cell model) [m]
n   = 2;      % pathloss exponent for free space [dB]]
fc = 3 * 1e9; % carrier frequency
sigma = 6; % shadowing variance

lambda = physconst('LightSpeed') ./ fc;

R = 0 :3: 500;
R_length = length(R);
power = zeros(R_length, 1);
PL = zeros(R_length, 1);

for r = 1 : R_length
   power(r) = p_tx - (fspl(d_0, lambda) + 10 * n * log(r/d_0)) + sigma * randn(1);
   PL(r)    = p_tx - (fspl(d_0, lambda) + 10 * n * log(r/d_0));
end

normalized_gain = power - PL;

%% plot pathloss with shadowing
% plot
f = figure;
% f.Position(3:4) = [600 300]; % for draft
f.Position(3:4) = [560 420]; % for slide
% f.Position(3:4) = [600 350]; % for thesis

xlabel("Distance [m]" , "Fontsize", 15, "Fontname", "Times New Roman");
ylabel("Attenuation [dB]", "Fontsize", 15, "Fontname", "Times New Roman");
hold on
grid on
box on
p1 = plot(R, power, "-", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");
p2 = plot(R, PL   , "-", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");

p1.Color = genRGBForPlot(1);
p2.Color = genRGBForPlot(3);

% legend settings
legend("Log normal shadowing", "Friis free space propagation model", "Location", "northeast", "Fontsize", 20, "Fontname", "Times New Roman")

%% plot normalized channel gain
% plot
f = figure;
% f.Position(3:4) = [600 300]; % for draft
% f.Position(3:4) = [560 420]; % for slide
f.Position(3:4) = [600 350]; % for thesis

xlabel("Distance [m]" , "Fontsize", 15, "Fontname", "Times New Roman");
ylabel("Normalied Channel Gain [dB]", "Fontsize", 15, "Fontname", "Times New Roman");
hold on
grid on
box on
p1 = plot(R, normalized_gain, "-", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");
p1.Color = genRGBForPlot(1);

% legend settings
legend("Log normal shadowing", "Location", "northeast", "Fontsize", 20, "Fontname", "Times New Roman")
