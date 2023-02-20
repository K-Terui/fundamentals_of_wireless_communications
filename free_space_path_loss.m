clear

fc = [0.3, 3, 30, 300] .* 1e9;
lambda = physconst('LightSpeed') ./ fc;
% R = [1, 2, 5, 10, 20, 50, 100, 200, 500, 1000];
R = 1:10000;
R_length = length(R);
fc_length = length(fc);
PL = zeros(R_length,fc_length);
for freq = 1 : fc_length
    for r = 1 : R_length
        PL(r, freq) = -1 * fspl(R(r), lambda(freq));
    end
end
%% plot semi logscale
% plot
f = figure;
% f.Position(3:4) = [600 300]; % for draft
f.Position(3:4) = [560 420]; % for slide
% f.Position(3:4) = [600 350]; % for thesis

p1 = semilogx(R, PL(:,4), "-", "LineWidth", 3, "MarkerSize", 10, "MarkerFaceColor", "white");
xlabel("Distance [m]" , "Fontsize", 15, "Fontname", "Times New Roman");
ylabel("Attenuation [dB]", "Fontsize", 15, "Fontname", "Times New Roman");
hold on
grid on
box on
p2 = semilogx(R, PL(:,3), "--", "LineWidth", 3, "MarkerSize", 10, "MarkerFaceColor", "white");
p3 = semilogx(R, PL(:,2), "-." , "LineWidth", 3, "MarkerSize", 10, "MarkerFaceColor", "white");
p4 = semilogx(R, PL(:,1), ":" , "LineWidth", 3, "MarkerSize", 10, "MarkerFaceColor", "white");


p1.Color = genRGBForPlot(1);
p2.Color = genRGBForPlot(2);
p3.Color = genRGBForPlot(3);
p4.Color = genRGBForPlot(10);

% legend setting
legend([p4, p3, p2, p1], "300 [MHz]","3 [GHz]","30 [GHz]","300 [GHz]", "Location", "northeast", "Fontsize", 20, "Fontname", "Times New Roman")

%% plot
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
p1 = plot(R, PL(:,4), "-", "LineWidth", 3, "MarkerSize", 10, "MarkerFaceColor", "white");
p2 = plot(R, PL(:,3), "--", "LineWidth", 3, "MarkerSize", 10, "MarkerFaceColor", "white");
p3 = plot(R, PL(:,2), "-." , "LineWidth", 3, "MarkerSize", 10, "MarkerFaceColor", "white");
p4 = plot(R, PL(:,1), ":" , "LineWidth", 3, "MarkerSize", 10, "MarkerFaceColor", "white");


p1.Color = genRGBForPlot(1);
p2.Color = genRGBForPlot(2);
p3.Color = genRGBForPlot(3);
p4.Color = genRGBForPlot(10);

% legend setting
legend([p4, p3, p2, p1],"300 [MHz]","3 [GHz]","30 [GHz]","300 [GHz]", "Location", "northeast", "Fontsize", 20, "Fontname", "Times New Roman")
