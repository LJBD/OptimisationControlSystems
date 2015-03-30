T = [0 0.1 1 4 5 7 9 10];
x0 = [1.8; 0; 2.4];
Umin = 1.32;
Umax = 12.12;
[t_out, x_out] = solverChanged(@magLevChanged, T, Umax, 1000, x0);