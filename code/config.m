%**************************************************************************
% A numerical calculation of the Equation of Time
% Config file
%
% Author: Alankar Kotwal <alankarkotwal13@gmail.com>
%
% Make sure you run this file from the eot-simulation directory
%**************************************************************************

% Parameters

a = 1;              % Semimajor axis in au
eps = 0.5;          % Orbital eccentricity
inc = 30;           % Inclination, in degrees
omega = 170;        % Longitude of ascending node, in degrees
per = 230;          % Argument of perihelion, in degrees

%**************************************************************************

% Resolution options

deltaT = 0.25;      % Time resolution in (earth) days