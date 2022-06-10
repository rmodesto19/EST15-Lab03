varnames = ["n, m" "Deslocamento (mm)" "$\epsilon_x$" "$\epsilon_y$" ...
    "$\gamma_{xy}$" "Tensão 1" "Tensão 2" "Tensão 3" "Momento 1" "Momento 2" "Momento 3"];

% Outputs
if caso == 1
    load('vec1.mat')
    LVDT = array2table(1000.*double(subs(v(:,1:2),[x,y,z],[0.1778,0.0762,t/2])),"VariableNames",varnames(1:2));
    rosetaAdef = array2table(double(subs(v(:,[1 3:5]),[x,y,z],[0.2032,0.1016,t/2])),"VariableNames",varnames([1 3:5]));
    rosetaAten = array2table(double(subs(v(:,[1 6:8]),[x,y,z],[0.2032,0.1016,t/2])),"VariableNames",varnames([1 6:8]));
    rosetaBdef = array2table(double(subs(v(:,[1 3:5]),[x,y,z],[0.3048,0.1016,t/2])),"VariableNames",varnames([1 3:5]));
    rosetaBten = array2table(double(subs(v(:,[1 6:8]),[x,y,z],[0.3048,0.1016,t/2])),"VariableNames",varnames([1 6:8]));
elseif caso == 2
    load('vec2.mat')
    rosetaAdef = array2table(double(subs(v(:,[1 3:5]),[x,y,z],[0.16,0.17,t/2])),"VariableNames",varnames([1 3:5]));
    rosetaAten = array2table(double(subs(v(:,[1 6:8]),[x,y,z],[0.16,0.17,t/2])),"VariableNames",varnames([1 6:8]));
    rosetaAmmt = array2table(double(subs(v(:,[1 9:11]),[x,y,z],[0.16,0.17,t/2])),"VariableNames",varnames([1 9:11]));
    rosetaBdef = array2table(double(subs(v(:,[1 3:5]),[x,y,z],[0.16,0.17,-t/2])),"VariableNames",varnames([1 3:5]));
    rosetaBten = array2table(double(subs(v(:,[1 6:8]),[x,y,z],[0.16,0.17,-t/2])),"VariableNames",varnames([1 6:8]));
    rosetaBmmt = array2table(double(subs(v(:,[1 9:11]),[x,y,z],[0.16,0.17,-t/2])),"VariableNames",varnames([1 9:11]));
end
