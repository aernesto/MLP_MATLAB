function lsa=load_csv(n,type)
%type is either 'test' or 'train'
%function must be launched from matlab folder
if strcmp(type,'test')
path_to_file=['../project1/database/csv_data/test/',type,'-images-idx3_',...
    num2str(n),'.csv'];
else
    path_to_file=['../project1/database/csv_data/training/1/',type,'-images-idx3_',...
    num2str(n),'.csv'];
end
lsa=csvread(path_to_file);
end