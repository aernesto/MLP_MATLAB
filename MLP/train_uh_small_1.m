tp=load('train_param_small_1.mat');
[RMSE,Delta_W_norms]=train_mlp(tp,'detail');
save('mlp_small_results_1.mat','RMSE','Delta_W_norms')