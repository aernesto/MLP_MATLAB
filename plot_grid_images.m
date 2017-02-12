
load('test_labels.mat')
load('train_labels.mat')

% the following is to just illustrate what raw data looks like
%figure(1)
% for sss=1:9
%     subplot(3,3,sss)
%     load(['train_mat_files/train-images-idx3_',num2str(10+sss),'.mat']);
%     plot_image(vector)
%     view(90,90)
%     title(num2str(trainLabels(10+sss)))
% end
% figure(2)
% for sss=1:9
%     subplot(3,3,sss)
%     load(['test_mat_files/test-images-idx3_',num2str(10+sss),'.mat']);
%     plot_image(vector)
%     view(90,90)
%     title(num2str(testLabels(10+sss)))
% end


%the following is to compare images with 2 different types of reducing
ll=3;
train_fig=figure;


    ax=subplot(ll,2,1);
    load(['train_mat_files/train-images-idx3_',num2str(1),'.mat']);
    plot_image(vector)
    ylabel(num2str(trainLabels(1)))
    title('original')
    ax.FontSize=20;
    
    ax=subplot(ll,2,2);
    load(['train_mat_files/train_',num2str(1),'.mat'])
    plot_image(rmax_train_vector)
    title('max-reduced')
     ax.FontSize=20;

         ax=subplot(ll,2,3);
    load(['train_mat_files/train-images-idx3_',num2str(2),'.mat']);
    plot_image(vector)
    ylabel(num2str(trainLabels(2)))
    ax.FontSize=20;
    
    ax=subplot(ll,2,4);
    load(['train_mat_files/train_',num2str(2),'.mat'])
    plot_image(rmax_train_vector)
     ax.FontSize=20;
     
            ax=subplot(ll,2,5);
    load(['train_mat_files/train-images-idx3_',num2str(3),'.mat']);
    plot_image(vector)
    ylabel(num2str(trainLabels(3)))
    ax.FontSize=20;
    
    ax=subplot(ll,2,6);
    load(['train_mat_files/train_',num2str(3),'.mat'])
    plot_image(rmax_train_vector)
     ax.FontSize=20;
     