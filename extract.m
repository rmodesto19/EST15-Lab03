data
prop
load('data.mat')
expA = array2table(data_exp_A,"VariableNames",["Time"...
    "Pressure" "LVDT" "defA1" "defA2" "defA3"...
    "defB4" "defB5" "defB6"]);

expA.Pressure = 6894.76*expA.Pressure;

expB = array2table(data_exp_B,"VariableNames",["Time"...
    "defA1" "defA2" "defA3"...
    "defB4" "defB5" "defB6"]);
save('extract.mat','expA','expB')

clear