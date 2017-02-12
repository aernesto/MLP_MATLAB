function s=tfcn(v)
%transfer function
%v can be a vector of a real numbers
s=1./(1+exp(-v));
end