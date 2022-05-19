% Placa simplesmente apoiada nos vértices

% Características da placa
a = 1.0; % m
b = 1.0; % m
t = 1e-2; % m
pos = [0 0; 0 b; a b; a 0];
E = 1e1; % Pa
nu = 0.3;
nu2 = (1-nu^2);
A = [E./nu2 nu*E/nu2 0
    nu*E/nu2 E/nu2 0
    0 0 E/2/(1+nu)]; % Matriz de propriedades da placa

mode = 1; % Escolha do modo do script (por enquanto só temos 1)

if mode == 1
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
    
    tabela = table(N_final,M_final)
elseif mode == 2
    % TODO: encontrar deslocamentos a partir da tensão e momento
end