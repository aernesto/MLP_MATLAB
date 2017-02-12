function varargout=train_mlp(train_param,mode)
%folder arguments should end with '/'
%batch_name is a string of the form 'batch_200_40_1-915_'
%mlp_name is a string of the form 'mlp'
%batch_range is 1x2
%mode is one of the two: 'detail', 'quick'

batch_folder=train_param.batch_folder;
batch_name=train_param.batch_name;
batch_range=train_param.batch_range;
mlp_folder=train_param.mlp_folder;
mlp_name=train_param.mlp_name;


if strcmp(mode,'detail')
    nBatches=batch_range(2)-batch_range(1)+1;
    Delta_W_norms=zeros(1,nBatches);
    RMSE_all=zeros(1,nBatches);
    for batch_number=batch_range(1):batch_range(2)
        % load batch and mlp strctures
        load_batch=[batch_folder,batch_name,num2str(batch_number),'.mat'];
        b=load(load_batch);
        if batch_number==1
        load_mlp=[mlp_folder,mlp_name,'.mat'];
        else
        load_mlp=[mlp_folder,mlp_name,'_',num2str(batch_number-1),'.mat'];    
        end
        mlp=load(load_mlp);
        
        % pass one batch
        [OUT,OUT_target,Delta_W]=batch_mlp(b,mlp,'grad',batch_number);
        
        % store
        tmp_norm=sum(sum(Delta_W{1}.^2))+sum(sum(Delta_W{2}.^2));
        Delta_W_norms(batch_number)=sqrt(tmp_norm);
        RMSE_all(batch_number)=mse_mlp(OUT,OUT_target,'RMSE');
        
        % update weights
        W=cell(1,2);
        W{1}=mlp.W{1}+Delta_W{1};
        W{2}=mlp.W{2}+Delta_W{2};
        
        % save intermediate mlp for next call of batch_mlp
        n1=mlp.n1;
        n2=mlp.n2;
        n3=mlp.n3;
        gain=mlp.gain;
        totParam=n2*(n1+1)+(n2+1)*n3; %total number of parameters
        save_path=[mlp_folder,mlp_name,'_',num2str(batch_number),'.mat'];
        save(save_path,'n1','n2','n3','gain','W','totParam','-v7.3')
    end
    varargout{1}=RMSE_all;
    varargout{2}=Delta_W_norms;
end

end