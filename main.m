% Rodar os scripts
Placa_Apoiada

% Outputs
caso = 1;
disp('-- Experimento 1 --')
load('exp_result1.mat')
%graficos
LVDT
desloc
rosetaAten
rosetaBten
exp_result

caso = 2;
disp('-- Experimento 2 --')
load('exp_result2.mat')
rosetaAten
rosetaBten
rosetaAmmt
rosetaBmmt
exp_result

diary on
