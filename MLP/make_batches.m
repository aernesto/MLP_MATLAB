function make_batches(batchsize,range,overlap)
%returns a 196 x batchsize matrix
%range is a 1x2 vector containing the min and max number for filenames
%overlap is a number of files representing overlap between 2 consec batches
    %overlap must be < batchsize
load('../train_labels.mat')
%variables to save
batch_size=batchsize;
sample_range=range;
batch_overlap=overlap;
    
nSample=range(2)-range(1)+1;
nBatches=floor((nSample-overlap)/(batchsize-overlap));
shuf_indices=range(1)-1+randperm(nSample);

for batch_number=1:nBatches
    start_index=(batch_number-1)*(batchsize-overlap)+1;
    
    batch=zeros(196,batchsize);
    batch_refs=zeros(batchsize,2);%for each case, the label and case number is stored
    for input=1:batchsize
        file_number=shuf_indices(start_index+input-1);
        label=trainLabels(file_number);
        batch_refs(input,:)=[label,file_number]; % store label and case number
        file_name=['../train_mat_files/train_',...
            num2str(file_number),'.mat'];
        load(file_name)
        batch(:,input)=rmax_train_vector;
    end
    save_file=['batches/batch_',...
            num2str(batchsize),'_',...
            num2str(overlap),'_',...
            num2str(range(1)),'-',...
            num2str(range(2)),'_',...
            num2str(batch_number),'.mat'];
    save(save_file,'batch','batch_size','sample_range','batch_overlap',...
        'batch_refs','-v7.3')
end
end
