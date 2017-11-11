load('cluster_data', 'X');

% Choose proper parameters
k_in_knn_graph = 15;
threshold = 0.03;

W = knn_graph(X, k_in_knn_graph, threshold);
idx = spectral(W, 2);
cluster_plot(X, idx);

figure;
idx = kmeans(X, 2);
cluster_plot(X, idx);
