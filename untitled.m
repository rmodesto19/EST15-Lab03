% Características da placa
l1 = 16; % in
l2 = 8; % in
t = 0.145; % in
pos = [0 0; 0 l2; l1 l2; l1 0];
E = 1.05e7; % psi
G = 4e6; % psi
nu = E/2/G - 1; 
nu2 = (1-nu^2);
A = [E./nu2 nu*E/nu2 0
    nu*E/nu2 E/nu2 0
    0 0 E/2/(1+nu)]; % Matriz de propriedades da placa

D = E*t^3/12/nu2;

% Definição das deformações
syms x y z
u_0 = x^2 + y^2;
v_0 = x*y + 3*y^2;
w_0 = 4*x^3 - 2*x*y^4;

eps_0 = [diff(u_0,x)
         diff(v_0,y)
         diff(u_0,y)+diff(v_0,x)]; % Vetor de deformações

kappa = [-diff(w_0,x,x)
         -diff(w_0,y,y)
         -2*diff(w_0,x,y)]; % Vetor de curvaturas do plano médio

% Matrizes de tensão e momento
N = t.*A*eps_0;
M = t^3/12.*A*kappa;

% Resultado desejado
N_final = double(subs(N,{x,y,z},{1,0,0}));
M_final = double(subs(M,{x,y,z},{1,0,0}));

tabela = table(N_final,M_final);
disp(tabela)