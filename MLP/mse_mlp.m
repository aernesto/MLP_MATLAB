function MSE=mse_mlp(OUT,OUT_target,option)
% OUT is the output of batch_mlp.m
% OUT_target is the other output from batch_mlp.m
% option is one of the four: 'MSE','RMSE','norm_MSE','norm_RMSE'
batch_size=size(OUT,2);
tmp=(OUT-OUT_target).^2; %intermediary step
MSE=sum(sum(tmp))/batch_size;
if strcmp(option,'RMSE')
    MSE=sqrt(MSE);
elseif strcmp(option,'norm_MSE')
    norm_out=sum(sum(OUT_target.^2))/batch_size; % average norm of the true output
    MSE=MSE/norm_out;
elseif strcmp(option,'norm_RMSE')
    norm_out=sqrt(sum(sum(OUT_target.^2))/batch_size);
    MSE=sqrt(MSE)/norm_out;
end
end