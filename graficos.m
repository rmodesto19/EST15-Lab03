load('extract.mat')
plot(expA.Pressure,expA.LVDT)
title("LVDT: Deslocamento v. Pressão")
xlim([0,max(expA.Pressure)])
ylim([0,max(expA.LVDT)])
xlabel("Pressão (Pa)")
ylabel("Deslocamento (mm)")
figure
plot(expA.Pressure,[expA.defA1,expA.defA2,expA.defA3])
xlim([0,max(expA.Pressure)])
ylim([0,max(expA.defA3)])
xlabel("Pressão (Pa)")
ylabel("Deformação (\mum/m)")
legend(["eps_1" "eps_2" "eps_3"],"Location","best",'FontSize',12)
title("Roseta A: Pressão v. Deformação")
figure
plot(expA.Pressure,[expA.defB4,expA.defB5,expA.defB6])
xlim([0,max(expA.Pressure)])
ylim([0,max(expA.defB6)])
xlabel("Pressão (Pa)")
ylabel("Deformação (\mum/m)")
legend(["eps_4" "eps_5" "eps_6"],"Location","best",'FontSize',12)
title("Roseta B: Pressão v. Deformação")
