function tttttt()

accuracy=10;
xmax=81*10/accuracy+1;%�����ͼ��С-��
ymax=51*10/accuracy+1;%�����ͼ��С-��
neighbour=[-1,0; % 8 direction
           -1,1;
           0,1;
           1,1;
           1,0;
           1,-1;
           0,-1;
           -1,-1]; 
g(1:xmax,1:ymax)=99999;%������ͼ�ڵ㼯S����ʼ��,����ע�����ж�Ӧ���������෴��
rhs(1:xmax,1:ymax)=99999;
c(1:xmax,1:ymax)=0;
end