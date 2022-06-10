syms x y z
for caso = 1:2
    if caso == 1
        l1 = 0.4064; l2 = 0.2032; t = 0.003683; % m
        E = 72394951577; G = 2.7579029e+10; % Pa
        q = 137895; % Pa
        nu = E/2/G - 1;
        nu2 = (1-nu^2);
        D = E*t^3/12/nu2;
        A = [E./nu2 nu*E/nu2 0
            nu*E/nu2 E/nu2 0
            0 0 E/2/(1+nu)]; % Matriz de propriedades da placa
        save("properties1.mat")
    elseif caso == 2
        l1 = 0.32; l2 = 0.34; t = 2.3e-3; % m
        E = 7.37e10; G = 2.76e10; % Pa
        fy = (dirac(y-0.128)+dirac(y-0.212));
        fx = (dirac(x-0.0925)+dirac(x-0.2275));
        q = 9*9.81/4*fx*fy; % Pa
        nu = E/2/G - 1; nu2 = (1-nu^2);
        D = E*t^3/12/nu2;
        A = [E./nu2 nu*E/nu2 0
            nu*E/nu2 E/nu2 0
            0 0 E/2/(1+nu)]; % Matriz de propriedades da placa
        save("properties2.mat")
    end
end

clear
