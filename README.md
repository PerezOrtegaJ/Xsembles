# Xsembles
**Xsembles** is a tool for identifying neuronal ensembles and their associated offsembles from a recording of population neuronal activity. The MATLAB function to use it is `Get_Xsembles.m`.

## Demo to run Xsembles method
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

## All variables inside the structure variable `analysis`

- analysis.Options
  - analysis.Options.Network
    - analysis.Options.Network.Bin
    - analysis.Options.Network.Iterations
    - analysis.Options.Network.Alpha
    - analysis.Options.Network.NetworkMethod
    - analysis.Options.Network.ShuffleMethod
    - analysis.Options.Network.SingleThreshold
  - analysis.Options.Vectors
    - analysis.Options.Vectors.Method
    - analysis.Options.Vectors.CoactivityThreshold
  - analysis.Options.Clustering
    - analysis.Options.Clustering.SimilarityMeasure
    - analysis.Options.Clustering.LinkageMethod
    - analysis.Options.Clustering.EvaluationIndex
    - analysis.Options.Clustering.EvaluationClustering
    - analysis.Options.Clustering.Range
  - analysis.Options.Ensemble
    - analysis.Options.Ensemble.Iterations
    - analysis.Options.Ensemble.Alpha
- analysis.Raster
- analysis.Neurons
- analysis.Frames
- analysis.Network
- analysis.Filter
  - analysis.Filter.RasterFiltered
  - analysis.Filter.SpikesFractionRemoved
  - analysis.Filter.RasterVectors
  - analysis.Filter.VectorID
- analysis.Clustering
  - analysis.Clustering.Similarity
  - analysis.Clustering.Tree
  - analysis.Clustering.RecommendedClusters
  - analysis.Clustering.ClusteringIndex
  - analysis.Clustering.EvaluationClustering
  - analysis.Clustering.ClusteringRange
  - analysis.Clustering.ClusteringIndices
  - analysis.Clustering.TreeID
- analysis.Ensembles
  - analysis.Ensembles.Count
  - analysis.Ensembles.ActivationSequence
  - analysis.Ensembles.Activity
  - analysis.Ensembles.ActivityBinary
  - analysis.Ensembles.Networks
  - analysis.Ensembles.OffsembleNetworks
  - analysis.Ensembles.AllEnsembleNetwork
  - analysis.Ensembles.AllOffsembleNetwork
  - analysis.Ensembles.Vectors
  - analysis.Ensembles.Indices
  - analysis.Ensembles.Similarity
  - analysis.Ensembles.VectorCount
  - analysis.Ensembles.Structure
  - analysis.Ensembles.StructureSilenced
  - analysis.Ensembles.StructureBelongingness
  - analysis.Ensembles.EB
  - analysis.Ensembles.StructureP
  - analysis.Ensembles.StructureWeights
  - analysis.Ensembles.StructureWeightsSignificant
  - analysis.Ensembles.StructureSorted
  - analysis.Ensembles.Weights
  - analysis.Ensembles.EnsembleNeurons
  - analysis.Ensembles.OffsembleNeurons
  - analysis.Ensembles.NeuronID
  - analysis.Ensembles.VectorID
  - analysis.Ensembles.Durations
  - analysis.Ensembles.PeaksCount
  - analysis.Ensembles.Probability
  - analysis.Ensembles.Iterations
  - analysis.Ensembles.AlphaEnsemble
- analysis.NonEnsembles
  - analysis.NonEnsembles.Count
  - analysis.NonEnsembles.Activity
  - analysis.NonEnsembles.ActivityBinary
  - analysis.NonEnsembles.Networks
  - analysis.NonEnsembles.OffsembleNetworks
  - analysis.NonEnsembles.Vectors
  - analysis.NonEnsembles.Indices
  - analysis.NonEnsembles.Similarity
  - analysis.NonEnsembles.VectorCount
  - analysis.NonEnsembles.Structure
  - analysis.NonEnsembles.StructureSilenced
  - analysis.NonEnsembles.StructureBelongingness
  - analysis.NonEnsembles.EB
  - analysis.NonEnsembles.StructureP
  - analysis.NonEnsembles.StructureWeights
  - analysis.NonEnsembles.StructureWeightsSignificant
  - analysis.NonEnsembles.EnsembleNeurons
  - analysis.NonEnsembles.OffsembleNeurons
  - analysis.NonEnsembles.Durations
  - analysis.NonEnsembles.PeaksCount
  - analysis.NonEnsembles.Probability
- analysis.Log
