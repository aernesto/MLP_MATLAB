function loop_reduce(type,range)
% type is either 'train' or  'test'
% range is a 1x2 vector of number range
if strcmp(type,'test')
    test_base='test_mat_files/test-images-idx3_';
    test_new='test_mat_files/test_';
    %rmax_test_vector=zeros(196,1); No need to preallocate
    %rmean_test_vector=zeros(196,1);
elseif strcmp(type,'train')
    train_base='train_mat_files/train-images-idx3_';
    train_new='train_mat_files/train_';
    %rmax_train_vector=zeros(196,1);
    %rmean_train_vector=zeros(196,1);
end
str_end='.mat';

for nnn=range(1):range(2)
    if strcmp(type,'test')
        load_testfile=[test_base,num2str(nnn),str_end];
        load(load_testfile)
        rmax_test_vector=reduce_data(vector,196,'max')/255;
        % rmean_test_vector=reduce_data(vector,196,'mean')/255;
        save_testfile=[test_new,num2str(nnn),str_end];
        save(save_testfile,'rmax_test_vector')
    elseif strcmp(type,'train')
        load_trainfile=[train_base,num2str(nnn),str_end];
        load(load_trainfile)
        rmax_train_vector=reduce_data(vector,196,'max')/255;
        % rmean_train_vector=reduce_data(vector,196,'mean')/255;
        save_trainfile=[train_new,num2str(nnn),str_end];
        save(save_trainfile,'rmax_train_vector')
    end
end
end