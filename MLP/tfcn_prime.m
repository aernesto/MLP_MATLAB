function s=tfcn_prime(v)
% derivative of transfer function
% v may be a vector of real numbers
s=exp(-v)./((1+exp(-v)).^2);
end