clear
small=load('mlp_small_results_1.mat');
big=load('mlp_big_results_1.mat');

ax1=subplot(2,2,1);
plot(1:24,small.RMSE,'-o','LineWidth',3)
ylabel('RMSEn')
title('small MLP, $n_2=50$','Interpreter','latex')
ax1.FontSize=20;
xlim([.8,24.2])

ax3=subplot(2,2,3);
plot(1:24,small.Delta_W_norms,'-o','LineWidth',3)
ylabel('$||\Delta W_n||$','Interpreter','latex')
xlabel('step')
ax3.FontSize=20;
xlim([.8,24.2])

ax2=subplot(2,2,2);
plot(1:24,big.RMSE,'-o','LineWidth',3)
title('big MLP, $n_2=500$','Interpreter','latex')
ax2.FontSize=20;
xlim([.8,24.2])
ax4=subplot(2,2,4);
plot(1:24,big.Delta_W_norms,'-o','LineWidth',3)
xlabel('step')
ax4.FontSize=20;
xlim([.8,24.2])