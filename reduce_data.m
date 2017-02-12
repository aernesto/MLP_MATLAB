function reduced_data=reduce_data(data,LENGTH,type)
%data is a 784 x 1 row vector
%LENGTH is the length of returned column vector
%type='mean': averages to nearest neighbors
%type='max': maxes out

load resize.mat %loaded vector is coord 784 x 1
indices=1:length(coord);
reduced_data=zeros(LENGTH,1);
for iii=1:LENGTH
    idx=indices(coord==iii);
    if strcmp(type,'mean')
        reduced_data(iii)=mean(data(idx));
    elseif strcmp(type,'max')
        reduced_data(iii)=max(data(idx));
    end
end
end