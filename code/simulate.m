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

% Calculate some stuff

b = a * sqrt(1-eps^2);      % Semi-minor axis, in au
P = sqrt(a^3);              % Period in (earth) days


%**************************************************************************

% Do the thing

nIter = ceil(P*365/deltaT);
RASunExpected = linspace(1, 2*pi, nIter);
RASun = zeros([1 nIter]);

% Simulate for the planet wrt the sun first, because that's how the
% parameters are defined

for i=2:nIter % We start when RA(planet) = 0
    
    
    
end

EOT = RAPl - RAPlExpected;