function [P_DeD]=drawscatter(A)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
N=size(A,2);
DeD=zeros(1,N);
for i=1:N
    % DeD(i)=length(find((A(i,:)==1)));
    DeD(i)=sum(A(i,:));
end
M=max(DeD);
for i=1:M+1;    %网络图中节点的度数最大为M,但要同时考虑到度为0的节点的存在性
    N_DeD(i)=length(find(DeD==i-1));
end
for i=1:M+1
    x(i)=i-1;
end
P_DeD=zeros(1,M+1);
P_DeD(:)=N_DeD(:)./sum(N_DeD);
disp(length(P_DeD));
scatter(x,P_DeD,'r');%红
xlabel('节点的度 K');
ylabel('节点度为K的概率 P(K)');
title('网络图中节点度的概率散列分布图');
end

