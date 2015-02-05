clear;
P=importdata('matrix.txt');
l1_tmp=drawscatter(P);%compute the degree distribution of the network
l1=(l1_tmp(:,1:35))';
save xianshi.txt l1 -ascii;
Clustering_Coefficient(P1);
Aver_Path_Length(P1);
hold on;
P=ba_net();
l2_tmp=drawscatter(P);
l2=(l2_tmp(:,1:35))';
save moni.txt l2 -ascii;
[R,P]=corrcoef(l1,l2)%compute the correlation coefficient of the two degree distribution
Clustering_Coefficient(P);
Aver_Path_Length(P);