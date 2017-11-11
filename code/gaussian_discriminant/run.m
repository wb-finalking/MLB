% mu: 2x1 matrix
% Sigma: 2x2 matrix
% phi: a number

mu0 = [0;0];
Sigma0 = eye(2);
mu1 = [1;1];
Sigma1 = eye(2);
phi = 0.5;
plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'Line', 1);

mu0 = [0;0];
Sigma0 = [1,0;0,1];
mu1 = [1;0];
Sigma1 = [1,0;0,1];
phi = 0.1;
plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'Line (one side)', 2);

mu0 = [0;0];
Sigma0 = [1,0;0,0.5];
mu1 = [0.2;0.2];
Sigma1 = [1,0;0,1];
phi = 0.5;
plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'Parabalic', 3);

mu0 = [0;0];
Sigma0 = [1,0;0,1];
mu1 = [5;1];
Sigma1 = [10,0;0,0.1];
phi = 0.5;
plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'Hyperbola', 4);

mu0 = [0;0];
Sigma0 = [1,0;0,1];
mu1 = [1;1];
Sigma1 = [10,0;0,1];
phi = 0.5;
plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'Two parallel lines.', 5);

mu0 = [0;0];
Sigma0 = eye(2);
mu1 = [0;0];
Sigma1 = 0.5*eye(2);
phi = 0.5;
plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'Circle', 6);

mu0 = [0;0];
Sigma0 = eye(2);
mu1 = [0;0];
Sigma1 = [0.5,0;0,0.8];
phi = 0.5;
plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'Ellipsoid', 7);

mu0 = [0;0];
Sigma0 = eye(2);
mu1 = [0;0];
Sigma1 = eye(2);
phi = 0.5;
plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'No boundary', 8);