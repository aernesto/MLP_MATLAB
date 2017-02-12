function init_mlp(path,mlp_name,range)
% path is a path (ending with '/') to the mlp whose weights we want to initialize
% mlp_name is the name without the _non-init.mat extension
% range is a 2x1 vector containing the interval in which all the randomly
% initialized weights will lie
rng('shuffle')

load_file=[path,mlp_name,'_non-init.mat'];
save_file=[path,mlp_name,'.mat'];
load(load_file)
W{1}=(range(2)-range(1))*rand(size(W{1}))+range(1);
W{2}=(range(2)-range(1))*rand(size(W{2}))+range(1);
save(save_file,'n1','n2','n3','gain','W','totParam','-v7.3')
end