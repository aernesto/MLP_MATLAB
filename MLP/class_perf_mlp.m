function [conf_mat,perf]=class_perf_mlp(OUT,OUT_target)
% receives output from batch_mlp.m
% returns confusion matrix and total performance score in percentage of
% wrong classifications
[n3,total_samples]=size(OUT);

% true classes totals
tot_class=sum(OUT_target,2);

% reading output classification by taking the maximum
[~,decision]=max(OUT);
[~,truth]=max(OUT_target);

conf_mat=zeros(n3);
for sample=1:total_samples
    ct=truth(sample);       % class true
    cd=decision(sample);    % class decided
    conf_mat(ct,cd)=conf_mat(ct,cd)+1;
end

% normalize to get percentages for each pair (ct,cd), rows sum to 100
conf_mat=100*conf_mat./repmat(tot_class,1,n3);

% compute overall performance
assert=decision.*truth; %a column contains a 1 only if the MLP asserted
perf=sum(sum(assert))/total_samples;
end