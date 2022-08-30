# Xsembles
**Xsembles** is a tool for identifying neuronal ensembles and their associated offsembles from a recording of population neuronal activity. The MATLAB function to use it is `Get_Xsembles.m`.

## Demo to run Xsembles
You will need a `raster` variable representing the population neuronal activity, which should be a binary matrix (0 = inactivity; 1 = activity) where each column represents a time point and each row represents the activity of a neuron. As an example, you can load our `raster` obtained from experimental data from the file `raster_example.mat` into the MATLAB worskpace:
```matlab
load raster_example.mat
```

Next, run the function `Get_Xsembles(raster)` and get a structure variable `analysis` as an output:
```matlab
analysis = Get_Xsembles(raster);
```

Then, you can plot the results of the neuronal activity found:
```matlab
Plot_Raster_Ensemble_Activity(analysis)
```

The `Demo_Xsembles.m` file includes the demo code to test this method.

## How to get ensemble and offsemble neurons
Having the structure variable `analysis`, you can get the ensemble neurons from `analysis.Ensembles.EnsembleNeurons` and the offsemble neurons from `analysis.Ensembles.OffsembleNeurons`. For example, if you want to get the neurons of the ensemble 1 and their associated neurons of the offsemble 1 you can run the following code:

```matlab
% Get neurons from ensemble 1
ensemble_neurons = analysis.Ensembles.EnsembleNeurons{1};

% Get neurons from offsemble 1 (associated with ensemble 1)
offsemble_neurons = analysis.Ensembles.OffsembleNeurons{1};
```
