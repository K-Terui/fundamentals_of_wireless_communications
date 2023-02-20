% QPSK Simulation
clear

Nsym = 6;           % Filter span in symbol durations
beta = 0.5;         % Roll-off factor
sampsPerSym = 8;    % Upsampling factor

rctFilt = comm.RaisedCosineTransmitFilter(...
  'Shape','Normal', ...
  'RolloffFactor',beta, ...
  'FilterSpanInSymbols',Nsym, ...
  'OutputSamplesPerSymbol',sampsPerSym)

% % Visualize the impulse response
% fvtool(rctFilt,'Analysis','impulse')
% 
% % Normalize to obtain maximum filter tap value of 1
% b = coeffs(rctFilt);
% rctFilt.Gain = 1/max(b.Numerator);
% 
% % Visualize the impulse response
% fvtool(rctFilt,'Analysis','impulse')


% Parameters
DataL = 20;             % Data length in symbols
R = 1000;               % Data rate
Fs = R * sampsPerSym;   % Sampling frequency
snr = 33;               % SNR [dB], transmit power is normalized

% Create a local random stream to be used by random number generators for
% repeatability
hStr = RandStream('mt19937ar','Seed',0);

% Generate random data
x = 2*randi(hStr,[0 1],DataL,1)-1;
% Time vector sampled at symbol rate in milliseconds
tx = 1000 * (0: DataL - 1) / R;

% Filter
y = rctFilt([x; zeros(Nsym/2,1)]);

% Filter group delay, since raised cosine filter is linear phase and
% symmetric.
fltDelay = Nsym / (2*R);
% Correct for propagation delay by removing filter transients
y = y(fltDelay*Fs+1:end);
time = 1000 * (0: DataL*sampsPerSym - 1) / Fs;

time = time ./ max(time);

% add awgn
deta_length = length(y);
y_awgn = db2pow(30 - snr) * randn(deta_length, 1) + y;
awgn = y_awgn - y;

%% plot w/o awgn
% plot
f = figure;
% f.Position(3:4) = [600 300]; % for draft
f.Position(3:4) = [560 420]; % for slide
% f.Position(3:4) = [600 350]; % for thesis

xlabel("Normalized times [sec]" , "Fontsize", 15, "Fontname", "Times New Roman");
ylabel("Amplitude ", "Fontsize", 15, "Fontname", "Times New Roman");
hold on
grid on
box on

p1 = plot(time, y, "-", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");

p1.Color = genRGBForPlot(1);

% legend settings
legend("w/o AWGN", "Location", "northeast", "Fontsize", 20, "Fontname", "Times New Roman")

%% plot w/ awgn
% plot
f = figure;
% f.Position(3:4) = [600 300]; % for draft
f.Position(3:4) = [560 420]; % for slide
% f.Position(3:4) = [600 350]; % for thesis

xlabel("Normalized times [sec]" , "Fontsize", 15, "Fontname", "Times New Roman");
ylabel("Amplitude ", "Fontsize", 15, "Fontname", "Times New Roman");
hold on
grid on
box on
p2 = plot(time, y_awgn, "-", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");

p2.Color = genRGBForPlot(3);

% legend settings
legend("w/ AWGN", "Location", "northeast", "Fontsize", 20, "Fontname", "Times New Roman")

%% plot w/o awgn w/ awgn
% plot
f = figure;
% f.Position(3:4) = [600 300]; % for draft
f.Position(3:4) = [560 420]; % for slide
% f.Position(3:4) = [600 350]; % for thesis

xlabel("Normalized times [sec]" , "Fontsize", 15, "Fontname", "Times New Roman");
ylabel("Amplitude ", "Fontsize", 15, "Fontname", "Times New Roman");
hold on
grid on
box on
p2 = plot(time, y_awgn, "-", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");
p1 = plot(time, y, "-", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");

p1.Color = genRGBForPlot(1);
p2.Color = genRGBForPlot(3);

% legend settings
legend("w/o AWGN", "w/ AWGN", "Location", "northeast", "Fontsize", 20, "Fontname", "Times New Roman")

%% plot awgn
% plot
f = figure;
% f.Position(3:4) = [600 300]; % for draft
f.Position(3:4) = [560 420]; % for slide
% f.Position(3:4) = [600 350]; % for thesis

xlabel("Normalized times [sec]" , "Fontsize", 15, "Fontname", "Times New Roman");
ylabel("Amplitude ", "Fontsize", 15, "Fontname", "Times New Roman");
hold on
grid on
box on
p3 = plot(time, awgn, "-", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");

p3.Color = genRGBForPlot(2);

% legend settings
legend("AWGN", "Location", "northeast", "Fontsize", 20, "Fontname", "Times New Roman")
