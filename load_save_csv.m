function load_save_csv(range,type)
% loads and save csv files as .mat files

% type is either 'test' or 'train'
% range is a 1x2 vector containing starting and ending number of image
for image_number=range(1):range(2)
    folder_str=['./',type,'_mat_files/'];
    savefile=[folder_str,type,'-images-idx3_',num2str(image_number),'.mat'];
    vector=load_csv(image_number,type);
    save(savefile,'vector');
end
end