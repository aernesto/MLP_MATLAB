function plot_image(vector)
%vector is a 784 x 1 or 196 x 1 column vector representing an image from
%the data set
colormap(gray)
L=sqrt(length(vector));
%pcolor(reshape(vector,L,L)')
pcolor(reshape(vector,L,L))
cmap=colormap;
LL=size(cmap,1);
map=cmap(LL:-1:1,:);
colormap(map)
view(90,90)
end