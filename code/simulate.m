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
RAPlExpected = zeros([1 nIter]);
deltaRAPlExp = 2*pi*deltaT / (P*365);
RAPl = zeros([1 nIter]);

angMom = 2 * pi * a * b / P;

% Simulate for the planet wrt the sun, because that's how the
% parameters are defined

% We start at perihelion
trueAnomaly = 0;
RAPl(1) = omega + atan2(cot(trueAnomaly+per), cos(i));

for i=2:nIter
    
    dist = a*(1-eps^2)/(1+eps*cos(trueAnomaly));
    angSpeed = angMom / dist^2;
    
    trueAnomaly = trueAnomaly + angSpeed*deltaT;
    
    RAPl(i) = omega + atan2(cot(trueAnomaly+per), cos(i));
 
    RAPlExpected(i) = RAPlExpected(i-1) + deltaRAPlExp;
                                
end

EOT = RAPl - RAPlExpected;