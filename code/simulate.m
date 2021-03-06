%**************************************************************************
% A numerical calculation of the Equation of Time
% Simulation file
%
% Author: Alankar Kotwal <alankarkotwal13@gmail.com>
%
% Make sure you run this file from the eot-simulation directory
%**************************************************************************

% Make sure you're in the eot-simulation directory

path = pwd;
[~, folder, ~] = fileparts(path);

if(~strcmp('eot-simulation', folder))
    error('Run the script in the eot-simulation directory.');
end

%**************************************************************************

% Source config file

config;

%**************************************************************************

% Calculate some stuff

b = a * sqrt(1-eps^2);      % Semi-minor axis, in au
P = sqrt(a^3);              % Period in (earth) days


%**************************************************************************

% Do the thing

nIter = ceil(P*365/deltaT);
trueAnomalyArr = zeros([1 nIter]);
trueAnomalyExp = zeros([1 nIter]);
RAPlExpected = zeros([1 nIter]);
deltaRAPlExp = 2*pi*deltaT / (P*365);
RAPl = zeros([1 nIter]);

angMom = 2 * pi * a * b / P;

% Simulate for the planet wrt the sun, because that's how the
% parameters are defined

% We start at perihelion
trueAnomalyArr(1) = 0;
trueAnomalyExp(1) = 0;
deltaTrueAnomaly = 2*pi*deltaT / (P*365);
RAPl(1) = omega + atan(cot(trueAnomalyArr(1)+per)/cos(inc));
RAPlExpected(1) = RAPl(1); % Start the mean sun off from here

for i=2:nIter
    
    dist = a*(1-eps^2)/(1+eps*cos(trueAnomalyArr(i-1)));
    angSpeed = angMom / dist^2;
    
    trueAnomalyArr(i) = trueAnomalyArr(i-1) + angSpeed*deltaT/365;
    trueAnomalyExp(i) = trueAnomalyExp(i-1) + deltaTrueAnomaly;
    
    RAPl(i) = omega + atan2(cot(trueAnomalyArr(i)+per), cos(inc));
    disp(atan2(cot(trueAnomalyArr(i)+per), cos(inc)));
    
    RAPlExpected(i) = RAPlExpected(i-1) + deltaRAPlExp;
                                
end

EOT = RAPl - RAPlExpected;

%**************************************************************************

% Save results and plots
csvwrite('results/results.csv', [transpose(EOT) ...
         transpose(RAPlExpected) transpose(RAPl)]);

EOTFig = figure;
plot(EOT);
ylabel('Equation of Time');
xlabel('Iteration number');
saveas(EOTFig, 'plots/EOT.png');


RAPlFig = figure;
plot(RAPl);
ylabel('RA of Planet');
xlabel('Iteration number');
saveas(RAPlFig, 'plots/RAPl.png');


ExpRAPlFig = figure;
plot(RAPlExpected);
ylabel('Expected Planet RA');
xlabel('Iteration number');
saveas(ExpRAPlFig, 'plots/ExpRAPl.png');