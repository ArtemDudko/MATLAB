%% Extract data from a sequence of NetCDF files and average onto similar grids

%% Grids and depth info

addpath('real/output')      %%%%%%Change path to directory where netcdf files are located. Do full path if it is not nested in directory where this code is stored

% Number of his files being processed (i.e., this is referencing every file
% between midfield_his_0059.nc to midfield_his_0060.nc).
files = 59:1:60;
num_files = length(files);

% Grid (pull from any file, they are the same)
x_rho = ncread('midfield_his_0030.nc','x_rho');
y_rho = ncread('midfield_his_0030.nc','y_rho');

% Average grid to interpolate salinity and/or velocity data on to
xxx_rho = (x_rho(2:end,2:end)+x_rho(1:end-1,1:end-1))./2;
yyy_rho = (y_rho(2:end,2:end)+y_rho(1:end-1,1:end-1))./2;

% Clear data as you see fit to free up space and improve run time
% clear x_rho y_rho

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

%% This bit of code loops through all the files in the range specified above and makes one big time vector by pulling times from each file

% Start time vector (first file), file index vector, time step counter
timee(1,:) = ncread(['midfield_his_00' num2str(files(1)) '.nc'],'ocean_time');
timei(1,:) = files(1).*ones(1,length(timee));

% Loop through the rest of files and keep adding on to time vector
for n = 2:num_files
    fn = files(n);
    if fn < 10 
    time(1,:) = ncread(['midfield_his_000' num2str(fn) '.nc'],'ocean_time');
    elseif fn > 9 && fn < 100
    time(1,:) = ncread(['midfield_his_00' num2str(fn) '.nc'],'ocean_time'); 
    else
    time(1,:) = ncread(['midfield_his_0' num2str(fn) '.nc'],'ocean_time');
    end
    ti = fn.*ones(1,length(time));

    timee = horzcat(timee,time);        % This is the actual time vector
    timei = horzcat(timei,ti);          % This is an index which identifies which file to used based on time
end

%% This section loops through the time vector, identifies which file to open based on time, and pulls whatever data you want out

count = 1;
for n = 2:length(timee)

    if timei(n) > timei(n-1)
        count = 1;
    end

    fn = timei(n);
    if timei(n) < 10
        % I would suggest reading up on the "ncread" function online. What
        % I am doing here is pulling all data in x,y,and z directions for each time
        % step.

        % Salinity
    sal(:,:,:) = ncread(['midfield_his_000' num2str(fn) '.nc'],'salt',[1 1 1 count],[Inf Inf Inf 1]);
        % u component to velocity
    u(:,:,:) = ncread(['midfield_his_000' num2str(fn) '.nc'],'u',[1 1 1 count],[Inf Inf Inf 1]);
        % v component
    v(:,:,:) = ncread(['midfield_his_000' num2str(fn) '.nc'],'v',[1 1 1 count],[Inf Inf Inf 1]);
        % Tidal elevation
    zeta(:,:) = ncread(['midfield_his_000' num2str(fn) '.nc'],'zeta',[1 1 count],[Inf Inf 1]);
    elseif timei(n) > 9 && timei(n) < 100
    sal(:,:,:) = ncread(['midfield_his_00' num2str(fn) '.nc'],'salt',[1 1 1 count],[Inf Inf Inf 1]);
    u(:,:,:) = ncread(['midfield_his_00' num2str(fn) '.nc'],'u',[1 1 1 count],[Inf Inf Inf 1]);
    v(:,:,:) = ncread(['midfield_his_00' num2str(fn) '.nc'],'v',[1 1 1 count],[Inf Inf Inf 1]);
    zeta(:,:) = ncread(['midfield_his_00' num2str(fn) '.nc'],'zeta',[1 1 count],[Inf Inf 1]);
    else
    sal(:,:,:) = ncread(['midfield_his_0' num2str(fn) '.nc'],'salt',[1 1 1 count],[Inf Inf Inf 1]);
    u(:,:,:) = ncread(['midfield_his_0' num2str(fn) '.nc'],'u',[1 1 1 count],[Inf Inf Inf 1]);
    v(:,:,:) = ncread(['midfield_his_0' num2str(fn) '.nc'],'v',[1 1 1 count],[Inf Inf Inf 1]);
    zeta(:,:) = ncread(['midfield_his_0' num2str(fn) '.nc'],'zeta',[1 1 count],[Inf Inf 1]);
    end
  
    count = count + 1;

    % u is averaged on 2nd dim only to match modified x,y grid made above
    uuu(:,:,:,n) = (u(:,2:end,:)+u(:,1:end-1,:))./2;
    clear u
    
    % v is averaged on 1st dim only
    vvv(:,:,:,n) = (v(2:end,:,:)+v(1:end-1,:,:))./2;
    clear v

    % Salinity along 1st and 2nd dims
    sss(:,:,:,n) = (sal(2:end,2:end,:)+sal(1:end-1,1:end-1,:))./2;
    clear sal
    
    % Calculate depth coordinates (this can be thought of as z). It changes
    % at each time step because the tidal elevation is changing as well as
    % sigma coordinates
    depthw = set_depth(Vtransform,Vstretching,theta_s,theta_b,hc,N,igrid_w,h,zeta);    
    clear zeta
    
    % Depth is averaged along 1st and 2nd to match grid
    ddd(:,:,:,n) = (depthw(2:end,2:end,:)+depthw(1:end-1,1:end-1,:))./2;
        
end

%% Save 3D data, depth coordinates, time, and grids you want to .mat file

% save('data.mat','ddd','xxx_rho','yyy_rho','uuu','vvv','sss','timee')

%%%% You may then choose to pull data from specific x,y,z,time coordinates
%%%% at this point. If you are running multiple files, the uuu, vvv, etc.
%%%% files will probably get very large and slower to run. It may become
%%%% easier to modify the above code to not pull all 3D data but instead
%%%% specific locations to improve performance. 