tp=load('train_param_big_1.mat');
[RMSE,Delta_W_norms]=train_mlp(tp,'detail');
save('mlp_big_results_1.mat','RMSE','Delta_W_norms')