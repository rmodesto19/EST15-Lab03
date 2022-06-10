load('extract.mat')
for caso = 1:2
    if caso == 1
        load('properties1.mat')
        [~,idx] = min(abs(expA.Pressure-137895));
        exp = expA(idx,:);
        exp.defx_A = exp.defA2;
        exp.defy_A = exp.defA1 + exp.defA3 - exp.defA2;
        exp.defxy_A = exp.defA1 - exp.defA3;
        
        exp.defx_B = exp.defB5;
        exp.defy_B = exp.defB4 + exp.defB6 - exp.defB5;
        exp.defxy_B = exp.defB4 - exp.defB6;
    
        disp("Experimento 1")
        desloc = table2array(exp(1,3)); % mm
        def_A = table2array(exp(1,10:12))' % um/m
        def_B = table2array(exp(1,13:15))' % um/m
        tens_A = A*def_A./1e6 %; Pa
        tens_B = A*def_B./1e6; % Pa
        
        exp_result = array2table([tens_A tens_B], ...
            "VariableNames",["Tensão A" "Tensão B"],"RowNames", ...
            ["X" "Y" "XY"]);
        save('exp_result1.mat','exp_result',"desloc")
    elseif caso == 2
        load('properties2.mat')
        exp = expB(end,:);
        exp.defx_A = exp.defA2;
        exp.defy_A = exp.defA1 + exp.defA3 - exp.defA2;
        exp.defxy_A = exp.defA1 - exp.defA3;
    
        exp.defx_B = exp.defB5;
        exp.defy_B = exp.defB4 + exp.defB6 - exp.defB5;
        exp.defxy_B = exp.defB4 - exp.defB6;
    
        disp("Experimento 2")
        def_A = table2array(exp(1,8:10))'; % um/m
        def_B = table2array(exp(1,11:13))'; % um/m
        tens_A = A*def_A./1e6; % Pa
        tens_B = A*def_B./1e6;% Pa
        mmt_A = (t^2/6).*tens_A; % N.m
        mmt_B = (t^2/6).*tens_B; % N.m
        
        exp_result = array2table([tens_A tens_B mmt_A mmt_B], ...
            "VariableNames",["Tensão A" "Tensão B" ...
            "Momento A" "Momento B"],"RowNames", ...
            ["X" "Y" "XY"]);
        save('exp_result2.mat','exp_result')
    end
end

clear
