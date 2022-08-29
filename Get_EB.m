function EB = Get_EB(activity,ensemble_times)
% Compute Ensemble Belonging Index (EB)
%
%       EB = Get_EB(activity,ensemble_times)
%
% By Jesus Perez-Ortega, Jul 2022

% Get number of neurons
n_neurons = size(activity,1);

% Initialize
EB = zeros(1,n_neurons);

% Get EBI for each neuron
for i = 1:n_neurons
    % Get fraction of active frames during
    fraction_ensemble = mean(activity(i,ensemble_times));
    fraction_noensemble = mean(activity(i,~ensemble_times));
    
    % Compute EBI
    EB(i) = (fraction_ensemble-fraction_noensemble)/...
          (fraction_ensemble+fraction_noensemble);
end
