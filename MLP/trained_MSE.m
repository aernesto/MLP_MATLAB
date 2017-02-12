mlp_small=load('mlps_1/mlp_small_24.mat');
mlp_big=load('mlps_1/mlp_big_24.mat');
b_train=load('batches/training_set_10000.mat');%problem with struct fields fixed manually
b_test=load('batches/test_set_1000.mat');

[OUT_small_train,OUT_tsmall_train]=batch_mlp(b_train,mlp_small,'quick',1);
[OUT_small_test,OUT_tsmall_test]=batch_mlp(b_test,mlp_small,'quick',1);
[OUT_big_train,OUT_tbig_train]=batch_mlp(b_train,mlp_big,'quick',1);
[OUT_big_test,OUT_tbig_test]=batch_mlp(b_test,mlp_big,'quick',1);

MSE_small_train=mse_mlp(OUT_small_train,OUT_tsmall_train,'MSE');
MSE_small_test=mse_mlp(OUT_small_test,OUT_tsmall_test,'MSE');
MSE_big_train=mse_mlp(OUT_big_train,OUT_tbig_train,'MSE');
MSE_big_test=mse_mlp(OUT_big_test,OUT_tbig_test,'MSE');
save('MSE_full_results.mat',...
    'MSE_small_train',...
    'MSE_small_test',...
    'MSE_big_train',...
    'MSE_big_test')