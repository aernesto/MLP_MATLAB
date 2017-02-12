function create_mlp(n,gain,save_folder,name)
% n is a row vector containing the number of units in each layer, one entry
% per layer
% gain is the gamma term in the gain factor gamma/nBatch, where nBatch is the batch number 
% save_folder is a path ending in '/' for saving the mat file
% name is a string for the name of the mlp
n1=n(1);
n2=n(2);
n3=n(3);
totParam=n2*(n1+1)+(n2+1)*n3; %total number of parameters

% initialize all weights to 0
W=cell(1,2);
W{1}=zeros(n2,n1+1);%w(i,j) is connection from j (layer1) to i (layer2)
W{2}=zeros(n3,n2+1);%w(i,j) is connection from j (layer2) to i (layer3)

save_path=[save_folder,name,'_non-init.mat'];
save(save_path,'n1','n2','n3','gain','W','totParam','-v7.3')
end