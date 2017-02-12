%nSample=10000;
nSample=1000; %for test set
n1=196;
batch=zeros(n1,nSample);
for example=1:nSample
    %file_name=['../train_mat_files/train_',...
     %   num2str(example),'.mat'];
    file_name=['../test_mat_files/test_',...
        num2str(example),'.mat'];%for test set
    load(file_name)
    batch(:,example)=rmax_test_vector;%rmax_train_vector %for training set
    save('batches/test_set_1000.mat',...%'batches/training_set_10000.mat',...% %for training set
        'batch',...
        'nSample',...
        '-v7.3')
end