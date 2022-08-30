% Simple demo to use Xsembles method

% Load a raster example from experimental data
load raster_example.mat

% Search for ensembles and offsembles from the raster
analysis = Get_Xsembles(raster);

% Plot raster with the ensemble activity identified
Plot_Raster_Ensemble_Activity(analysis)