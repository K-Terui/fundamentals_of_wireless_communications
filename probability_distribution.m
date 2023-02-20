clear

%% parameter
x = -5 : 0.001 : 5;
y = 0  : 0.001 : 10;

%% uniform distribution
pd_u1 = makedist('Uniform','lower',-2,'upper',2);
pd_u2 = makedist('Uniform','lower',-1,'upper',4);
pd_u3 = makedist('Uniform','lower',-3 ,'upper',-1);

pdf_u1 = pdf(pd_u1, x);
pdf_u2 = pdf(pd_u2, x);
pdf_u3 = pdf(pd_u3, x);
cdf_u1 = cdf(pd_u1, x);
cdf_u2 = cdf(pd_u2, x);
cdf_u3 = cdf(pd_u3, x);

f = figure;
% f.Position(3:4) = [600 300]; % for draft
f.Position(3:4) = [560 420]; % for slide
% f.Position(3:4) = [600 350]; % for thesis

xlabel("Random Variable" , "Fontsize", 15, "Fontname", "Times New Roman");
ylabel("Probability Density", "Fontsize", 15, "Fontname", "Times New Roman");
hold on
grid on
box on
p3 = plot(x, pdf_u3, "-.", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");
p2 = plot(x, pdf_u1, "-", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");
p1 = plot(x, pdf_u2, "--", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");

p1.Color = genRGBForPlot(2);
p2.Color = genRGBForPlot(1);
p3.Color = genRGBForPlot(3);

% legend settings
legend("a = -3, b = -1", "a = -2, b = 2", "a = -1, b = 4", "Location", "northeast", "Fontsize", 20, "Fontname", "Times New Roman")

f = figure;
% f.Position(3:4) = [600 300]; % for draft
f.Position(3:4) = [560 420]; % for slide
% f.Position(3:4) = [600 350]; % for thesis

xlabel("Random Variable" , "Fontsize", 15, "Fontname", "Times New Roman");
ylabel("Cumulative Probability", "Fontsize", 15, "Fontname", "Times New Roman");
hold on
grid on
box on
p3 = plot(x, cdf_u3, "-.", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");
p2 = plot(x, cdf_u1, "-", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");
p1 = plot(x, cdf_u2, "--", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");

p1.Color = genRGBForPlot(2);
p2.Color = genRGBForPlot(1);
p3.Color = genRGBForPlot(3);

% legend settings
legend("a = -3, b = -1", "a = -2, b = 2", "a = -1, b = 4", "Location", "northwest", "Fontsize", 20, "Fontname", "Times New Roman")


%% normal distribution
pd_n1 = makedist('Normal');
pd_n2 = makedist('Normal', 'mu', -2, 'sigma', 0.5);
pd_n3 = makedist('Normal', 'mu', 1, 'sigma', 2);

pdf_n1 = pdf(pd_n1, x);
pdf_n2 = pdf(pd_n2, x);
pdf_n3 = pdf(pd_n3, x);
cdf_n1 = cdf(pd_n1, x);
cdf_n2 = cdf(pd_n2, x);
cdf_n3 = cdf(pd_n3, x);

f = figure;
% f.Position(3:4) = [600 300]; % for draft
f.Position(3:4) = [560 420]; % for slide
% f.Position(3:4) = [600 350]; % for thesis

xlabel("Random Variable" , "Fontsize", 15, "Fontname", "Times New Roman");
ylabel("Probability Density", "Fontsize", 15, "Fontname", "Times New Roman");
hold on
grid on
box on
p1 = plot(x, pdf_n2, "-.", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");
p2 = plot(x, pdf_n1, "-", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");
p3 = plot(x, pdf_n3, "--", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");

p1.Color = genRGBForPlot(3);
p2.Color = genRGBForPlot(1);
p3.Color = genRGBForPlot(2);

% legend settings
legend("\mu = -2, \sigma^2 = 0.5", "\mu = 0, \sigma^2 = 1.0", "\mu = 1, \sigma^2 = 2.0", "Location", "northeast", "Fontsize", 20, "Fontname", "Times New Roman")

f = figure;
% f.Position(3:4) = [600 300]; % for draft
f.Position(3:4) = [560 420]; % for slide
% f.Position(3:4) = [600 350]; % for thesis

xlabel("Random Variable" , "Fontsize", 15, "Fontname", "Times New Roman");
ylabel("Cumulative Probability", "Fontsize", 15, "Fontname", "Times New Roman");
hold on
grid on
box on
p1 = plot(x, cdf_n2, "-.", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");
p2 = plot(x, cdf_n1, "-", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");
p3 = plot(x, cdf_n3, "--", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");

p1.Color = genRGBForPlot(3);
p2.Color = genRGBForPlot(1);
p3.Color = genRGBForPlot(2);

% legend settings
legend("\mu = -2, \sigma^2 = 0.5", "\mu = 0, \sigma^2 = 1.0", "\mu = 1, \sigma^2 = 2.0", "Location", "northwest", "Fontsize", 20, "Fontname", "Times New Roman")


%% Reyleigh distribution
pd_r1 = makedist('Rayleigh', 'b', 0.5);
pd_r2 = makedist('Rayleigh', 'b', 1.0);
pd_r3 = makedist('Rayleigh', 'b', 2.0);

pdf_r1 = pdf(pd_r1, y);
pdf_r2 = pdf(pd_r2, y);
pdf_r3 = pdf(pd_r3, y);
cdf_r1 = cdf(pd_r1, y);
cdf_r2 = cdf(pd_r2, y);
cdf_r3 = cdf(pd_r3, y);

f = figure;
% f.Position(3:4) = [600 300]; % for draft
f.Position(3:4) = [560 420]; % for slide
% f.Position(3:4) = [600 350]; % for thesis

xlabel("Random Variable" , "Fontsize", 15, "Fontname", "Times New Roman");
ylabel("Probability Density", "Fontsize", 15, "Fontname", "Times New Roman");
hold on
grid on
box on
p2 = plot(y, pdf_r1, "-.", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");
p1 = plot(y, pdf_r2, "-", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");
p3 = plot(y, pdf_r3, "--", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");

p1.Color = genRGBForPlot(1);
p2.Color = genRGBForPlot(3);
p3.Color = genRGBForPlot(2);

% legend settings
legend("\sigma = 0.5", "\sigma = 1.0", "\sigma = 2.0", "Location", "northeast", "Fontsize", 20, "Fontname", "Times New Roman")

f = figure;
% f.Position(3:4) = [600 300]; % for draft
f.Position(3:4) = [560 420]; % for slide
% f.Position(3:4) = [600 350]; % for thesis

xlabel("Random Variable" , "Fontsize", 15, "Fontname", "Times New Roman");
ylabel("Cumulative Probability", "Fontsize", 15, "Fontname", "Times New Roman");
hold on
grid on
box on
p2 = plot(y, cdf_r1, "-.", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");
p1 = plot(y, cdf_r2, "-", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");
p3 = plot(y, cdf_r3, "--", "LineWidth", 2, "MarkerSize", 10, "MarkerFaceColor", "white");


p1.Color = genRGBForPlot(1);
p2.Color = genRGBForPlot(3);
p3.Color = genRGBForPlot(2);

% legend settings
legend("\sigma = 0.5", "\sigma = 1.0", "\sigma = 2.0", "Location", "northeast", "Fontsize", 20, "Fontname", "Times New Roman")
