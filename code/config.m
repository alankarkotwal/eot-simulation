%**************************************************************************
% A numerical calculation of the Equation of Time
% Config file
%
% Author: Alankar Kotwal <alankarkotwal13@gmail.com>
%
% Make sure you run this file from the eot-simulation directory
%**************************************************************************

% Parameters

% Semimajor axis in au
a = 1;

% Orbital eccentricity
%eps = 0.01671123;
eps = 0.95;

% Inclination, in degrees
inc = deg2rad(23+26/60+21.4119/3600);

% Longitude of ascending node, in degrees
omega = deg2rad(348.73936);

% Argument of perihelion, in degrees
per = deg2rad(114.20783);

%**************************************************************************

% Resolution options

% Time resolution in (earth) days
deltaT = 10;