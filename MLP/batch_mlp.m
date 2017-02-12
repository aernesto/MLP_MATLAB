function [OUT,OUT_target,varargout]=batch_mlp(b,mlp,type,step)
%b is a batch sctructure
%mlp is an mlp structure
%type is one of the three 'quick','hood','grad'
%step is a positive integer
%nout = max(nargout,2) - 1;%number of extra arguments requested, on top of out and out_target

OUT_target=zeros(mlp.n3,b.batch_size);
for example=1:b.batch_size
    OUT_target(b.batch_refs(example,1)+1,example)=1;
end

A=cell(1,2);    %to store linear outputs

% linear output of hidden layer
A{1}=mlp.W{1}*[b.batch;ones(1,b.batch_size)];

%%%%%%%%%%%%%%%%%%%%%%%%for debug
%size(A{1})
%%%%%%%%%%%%%%%%%%%%%%%%

% rectified output of hidden layer
h=[tfcn(A{1});ones(1,b.batch_size)];
%%%%%%%%%%%%%%%%%%%%%%%for debug
%size(h)
%%%%%%%%%%%%%%%%%%%%%%%%

%linear output of output layer
A{2}=mlp.W{2}*h;

%%%%%%%%%%%%%%%%%%%%%%%for debug
%size(A{2})
%%%%%%%%%%%%%%%%%%%%%%%%

% rectified output of output layer
OUT=tfcn(A{2});

if strcmp(type,'hood')
    varargout{1}=h; %return output of hidden layer
elseif strcmp(type,'grad')
    % compute Delta_W
    gain_factor=mlp.gain/step;
    
    Delta_W=cell(1,2);
    Delta_W{1}=zeros(mlp.n2,mlp.n1+1);
    Delta_W{2}=zeros(mlp.n3,mlp.n2+1);
    % compute gradient terms of outermost weights (hidden -> output)
    % loop over batch cases and compute running average
    for example=1:b.batch_size
        K_2=zeros(mlp.n3,mlp.n2+1);
        for j=1:mlp.n2+1
            for i=1:mlp.n3
                c_fac=2*...
                    tfcn_prime(A{2}(i,example))*...
                    h(j,example);
                K_2(i,j)=c_fac*OUT(i,example);
                if OUT_target(i,example)
                    K_2(i,j)=K_2(i,j)-c_fac;
                end
            end
        end
        Delta_W{2}=Delta_W{2}+K_2;
        
   % compute gradient terms of innermost weights (input -> hidden)
        K_1=zeros(mlp.n2,mlp.n1+1);
        for j=1:mlp.n1+1
            for i=1:mlp.n2
                c_fac=tfcn_prime(A{2}(:,example)).*mlp.W{2}(:,i);
                if j <= mlp.n1
                    c_fac=2*tfcn_prime(A{1}(i,example))*...
                    b.batch(j,example)*c_fac;
                else %accounts for fictious input set to 1 for thresholds
                    c_fac=2*tfcn_prime(A{1}(i,example))*c_fac;
                end
                K_1(i,j)=sum(c_fac.*(OUT(:,example)-OUT_target(:,example)));
            end
        end
        Delta_W{1}=Delta_W{1}+K_1;
    end
    % scale appropriately for gradient descent
    Delta_W{1}=-Delta_W{1}*gain_factor/b.batch_size;
    Delta_W{2}=-Delta_W{2}*gain_factor/b.batch_size;
    varargout{1}=Delta_W;
end
end


%

