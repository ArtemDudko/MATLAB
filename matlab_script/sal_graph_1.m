
addpath('data') 


files = 30:1:30;
num_files = length(files);

% Grid (pull from any file, they are the same)
x_rho = ncread('midfield_his_0030.nc','x_rho');
y_rho = ncread('midfield_his_0030.nc','y_rho');



% Average grid to interpolate salinity and/or velocity data on to
%xxx_rho = (x_rho(2:end,2:end)+x_rho(1:end-1,1:end-1))./2;
%yyy_rho = (y_rho(2:end,2:end)+y_rho(1:end-1,1:end-1))./2;

N = 30;                 %number of vertical depth layers

% Depth parameters used to calculate z from sigma layer coordinates
hc = ncread('midfield_his_0030.nc','hc');
theta_s = ncread('midfield_his_0030.nc','theta_s');
theta_b = ncread('midfield_his_0030.nc','theta_b');
Vtransform = ncread('midfield_his_0030.nc','Vtransform');
Vstretching = ncread('midfield_his_0030.nc','Vstretching');
igrid_rho = 1;
igrid_w = 5;

% Water depth (not including tidal variation)
h = ncread('midfield_his_0030.nc','h');



% Salinity
sal(:,:,:) = ncread(['midfield_his_0030.nc'],'salt',[1 1 1 1],[Inf Inf Inf 1]);
%[salX,salY,salVal] = sal(1:1:514,1:1:514,1:1:30);
sal1 = sal(1:514,1:514,1);
sal2 = rot90(sal1);

h = heatmap(sal2,'GridVisible','off');
h.Title = 'Salinity';





    