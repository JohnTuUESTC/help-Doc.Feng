function P=ba_net()
disp('BA�ޱ������ģ��');
m0=input('�����������ʼ�ڵ���');

%m=input('����һ���½ڵ�����ӵ�m���Դ��ڽڵ�(m<=m0)��������m��ֵ');%????
N=input('�������������սڵ���');
disp('�������ʼ����״��  1 ������  2  ��ȫͼ  3  ����ӱ�ͼ');
pp=input('������ 1��2��3');

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
    %fprintf('�ۼƸ���%8.5f\n',C);
    count=0;%��¼�ӱߵĴ���
    m=0;%�ӱ߷�����̬�ֲ������
    while m<1 
        M=normrnd(2,1);
        m=round(M);
    end
    node_id=zeros(1,m);%��¼�Ѿ������ӵĽ�㣬�����ظ�����
    while count<m             %���ö��ַ������еĽڵ������ѡ��m���ڵ����¼���Ľڵ�����
        random_data=rand(1,1);
        aa=find(C>=random_data);
        if size(aa,2)>0 %ȷ����һ�������Ľ�����
            jj=aa(1);
            if size(find(node_id==jj),2)==0 %�����ظ�����
                %fprintf('aa%8.5f\n',jj);             % �ڵ�jj��Ϊ�ö��ַ�ѡ��Ľڵ�
                node_id(1,count+1)=jj;%��¼�Ѿ������ӵĽ��
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
%%  �ۼ�����
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