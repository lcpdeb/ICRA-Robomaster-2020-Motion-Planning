function Initialize()
global accuracy;
% input
global xmax;
global ymax;
global U; % open list
global k_m;
global g;
global c;
global rhs;
global neighbour;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% INITIALIZATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xmax=81*10/accuracy+1;%�����ͼ��С-��
ymax=51*10/accuracy+1;%�����ͼ��С-��
%%
U=[];%���ȼ��б����ڴ洢����չ�ķ�һ�½ڵ�(g(s)!=rhs(s))
k_m=0;%��¼�����㵽��ǰ��ʼ��Ĵ���ֵ
g=[];%g��rhs��ʾ�ڵ�s��Ŀ������С���۵Ĺ���ֵ
rhs=[];%rhs������ǰ��ڵ㣨��ʼ�㵽��ǰ�㣩��gֵ����õ�
neighbour=[-1,0; % 8 direction
           -1,1;
           0,1;
           1,1;
           1,0;
           1,-1;
           0,-1;
           -1,-1]; 
g(1:xmax,1:ymax)=Inf;%������ͼ�ڵ㼯S����ʼ��,����ע�����ж�Ӧ���������෴��
rhs(1:xmax,1:ymax)=Inf;
c(1:xmax,1:ymax)=0;
end