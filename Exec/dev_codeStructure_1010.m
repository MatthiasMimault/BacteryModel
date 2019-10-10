%% Executable script for Bacteria Movement model
% V3.0 - New structure
close all
clear

%% 0. Settings
% Names
caseName = 'DEV-BdyFlow';
caseType = 'A';
caseDate = '1010';
runnb = '1';
suffix = 'SimpleAdvection';

% Physical parameters
% T is time in s, A is bacteria average velocity, C is diffusion coeff.
% R is /// mm, epsilon is interaction strength
T = 200; A = 0.03; C = 0; 
R = 2; epsilon = 0.5;

% Run parameters
debug = 'true';
Nfiles = 10; 

% Numerical parameters
nx = 400;
CFL = 0.9;
ny = nx;

% Dimensions
Domain = [-25, 25, -25, 25];
Space = [-20, 20, -20, 20];
Attractant = [-20 20 20 25];
InitBact = [-19.25, 19.25, -19.25, -5.25]; 
Source = [-20 20 -25 -20]; 

% Folders
addpath('..\Data')
addpath('..\Include')
addpath('..\Figures')
addpath('..\Source')
if strcmp(debug, 'true') 
    addpath('..\Debug')
end

if strcmp(debug, 'true') 
    dataFolder = ['..\Debug\' caseDate '-' caseType runnb '-' num2str(nx)];
else
    dataFolder = ['..\Data\' caseDate '-' caseType runnb '-' num2str(nx)];
end
figureFolder = ['..\Figures\F' caseDate '-' caseType runnb '-' num2str(nx)];
pngFolder =    ['..\Figures\P' caseDate '-' caseType runnb '-' num2str(nx)];

mkdir(dataFolder)
mkdir(figureFolder)
mkdir(pngFolder)

%% 1. Initialisation
[X,Y,Dx,Dy] = fGridGeneration(nx,ny,Domain);
[domAt, domBd, domDef, domSrc] ...
    = fRegionGeneration(X, Domain, Space, Attractant, Source);
