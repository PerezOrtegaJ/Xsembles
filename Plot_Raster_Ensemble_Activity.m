function Plot_Raster_Ensemble_Activity(analysis)
% Plot raster and ensemble activity
%
%       Plot_Raster_Ensemble_Activity(analysis)
%
% By Jesus Perez-Ortega, Aug 2022

%% Read variables from "analysis" input

% Read raster and raster filtered
raster = analysis.Raster;
raster_filtered = analysis.Filter.RasterFiltered;
raster_ensemble = analysis.Ensembles.ActivityBinary;

% Compute similarity of raster filtered
sim_filtered = 1-squareform(pdist(double(raster_filtered)','jaccard'));

% Get sortind ids from neurons and vectors
neuron_id = analysis.Ensembles.NeuronID;
vector_id = analysis.Ensembles.VectorID;

% Get number of ensembles and nonensembles (non significant cluster of vectors)
n_ensembles = analysis.Ensembles.Count;
n_nonensembles = analysis.NonEnsembles.Count;

% Get number of vectors for each cluster
n_vectors = zeros(1,n_ensembles+n_nonensembles);
for i = 1:analysis.Ensembles.Count
    n_vectors(i) = length(analysis.Ensembles.Indices{i});
end
for j = 1:analysis.NonEnsembles.Count
    n_vectors(i+j) = length(analysis.NonEnsembles.Indices{j});
end

% Get values to draw the limits of each cluster
limits = cumsum(n_vectors);
limits = [1 limits];

% Get probability of significant similarity of cluster of vectors (ensemble)
p = [analysis.Ensembles.Probability analysis.NonEnsembles.Probability];

%% Create the figure
Set_Figure('Ensemble activity',[0 0 1000 400])

% Plot raster
h1 = subplot(2,10,1:8);
Plot_Raster(raster(neuron_id,:),'Raster')
xlabel('');xticks([])
ylabel('neurons sorted by ensemble')

% Plot raster vectors sorted by similarity
h2 = subplot(2,10,9:10);
Plot_Raster(raster_filtered(neuron_id,vector_id),'Vectors sorted by ensemble')
xlabel('');xticks([])
ylabel('');yticks([])
xlim([0 analysis.Frames])
% Plot ensemble activity
h3 = subplot(2,10,11:18);
Plot_Raster(raster_ensemble,'Ensemble activity')
raster_colors = [1 1 1; 0.5 0.5 0.5];
colormap(h3,raster_colors)
xlabel('vector #')
ylabel('ensemble #')
xlim([0 analysis.Frames])

% Plot similarity matrix
h4 = subplot(2,10,19:20);
imagesc(sim_filtered(vector_id,vector_id));hold on
colormap(flipud(colormap('bone')))
for i = 1:length(n_vectors)
    if p(i)<0.05
        color = [0 0 0];
    else
        color = [0.5 0.5 0.5];
    end

    plot([limits(i) limits(i)],[limits(i) limits(i+1)],'color',color,'linewidth',2)
    plot([limits(i) limits(i+1)],[limits(i) limits(i)],'color',color,'linewidth',2)
    plot([limits(i) limits(i+1)],[limits(i+1) limits(i+1)],'color',color,'linewidth',2)
    plot([limits(i+1) limits(i+1)],[limits(i) limits(i+1)],'color',color,'linewidth',2)

    text(limits(i+1),mean(limits(i:i+1)),P_To_Text(p(i)),'Color',[0 0 0])
end
pbaspect([1 1 1])
title('Similarity')
xlabel('vectors sorted')
set(gca,'YDir','normal')

xticks([]);yticks([])
pbaspect([1 1 1])
set(gca,'YDir','normal')

% Link axes
linkaxes([h1 h3],'x')
linkaxes([h2 h4],'x')
linkaxes([h1 h2],'y')