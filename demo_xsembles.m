% Simple demo to use Ensemblex method

% Load a raster example from experimental data
load raster_example.mat

% Get ensembles from raster
analysis = Get_Xsembles(raster);

% Plot raster with ensembles identified
Plot_Ensemble_Raster(analysis)