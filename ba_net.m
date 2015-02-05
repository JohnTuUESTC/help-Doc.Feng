function P=ba_net()
disp('BA无标度网络模型');
m0=input('请输入网络初始节点数');

%m=input('引入一个新节点后，连接到m个以存在节点(m<=m0)，请输入m的值');%????
N=input('请输入网络最终节点数');
disp('请输入初始网络状况  1 孤立点  2  完全图  3  随机加边图');
pp=input('请输入 1，2或3');

% randnumber=rand(2,N)*1000;
% x=randnumber(1,:);
% y=randnumber(2,:);
% plot(x,y,'r.','Markersize',18);
% hold on;

switch  pp
    case 1
          A=zeros(N);
    case 2
        A=zeros(N);
        for i=1:m0
            for j=i+1:m0
                A(i,j)=1;
                A(j,i)=1;
            end
        end
    case 3
        A=zeros(N);
        p0=0.5;
        for i=1:m0
            for j=i+1:m0
                p1=unifrnd(0,1);
                if  p1<=p0
                A(i,j)=1;
                A(j,i)=1;
                end
            end
        end
end
number=m0;
for i=m0+1:N  
    B=leiji_shuzu(A,number);
    C=zeros(1,number);
    for PP=2:number+1
        C(1,PP-1)=B(1,PP)/B(1,number+1);
    end
    %fprintf('累计概率%8.5f\n',C);
    count=0;%记录加边的次数
    m=0;%加边符合正态分布的情况
    while m<1 
        M=normrnd(2,1);
        m=round(M);
    end
    node_id=zeros(1,m);%记录已经被连接的结点，避免重复连接
    while count<m             %利用赌轮法从已有的节点中随机选择m个节点与新加入的节点相连
        random_data=rand(1,1);
        aa=find(C>=random_data);
        if size(aa,2)>0 %确保有一个这样的结点存在
            jj=aa(1);
            if size(find(node_id==jj),2)==0 %避免重复连接
                %fprintf('aa%8.5f\n',jj);             % 节点jj即为用赌轮法选择的节点
                node_id(1,count+1)=jj;%记录已经被连接的结点
                A(i,jj)=1;
                A(jj,i)=1;
                count=count+1;
            end
        end
    end
    number=number+1;
end 
       
% for i=1:N
%     for j=1:N
%         if A(i,j)==1
%             plot([x(i),x(j)],[y(i),y(j)],'linewidth',1);
%             hold on;
%         end
%     end
% end

P=A;
% hold off
% degree_distribution(A);
% aver_path=aver_pathlength(A);
% disp(aver_path);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  累计数组
function B=leiji_shuzu(A,N)
B=zeros(1,N+1);
k=0;
for i=1:N
    for j=1:N
        if A(i,j)==1;
            k=k+1;
        end
    end
    B(1,i+1)=k+B(1,i);
    k=0;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%