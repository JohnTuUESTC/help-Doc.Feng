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
for i=1:M+1;    %����ͼ�нڵ�Ķ������ΪM,��Ҫͬʱ���ǵ���Ϊ0�Ľڵ�Ĵ�����
    N_DeD(i)=length(find(DeD==i-1));
end
for i=1:M+1
    x(i)=i-1;
end
P_DeD=zeros(1,M+1);
P_DeD(:)=N_DeD(:)./sum(N_DeD);
disp(length(P_DeD));
scatter(x,P_DeD,'r');%��
xlabel('�ڵ�Ķ� K');
ylabel('�ڵ��ΪK�ĸ��� P(K)');
title('����ͼ�нڵ�ȵĸ���ɢ�зֲ�ͼ');
end

