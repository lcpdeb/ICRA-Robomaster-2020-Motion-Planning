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
xmax=81*10/accuracy+1;%定义地图大小-行
ymax=51*10/accuracy+1;%定义地图大小-列
%%
U=[];%优先级列表，用于存储待扩展的非一致节点(g(s)!=rhs(s))
k_m=0;%记录最初起点到当前起始点的代价值
g=[];%g和rhs表示节点s到目标点的最小代价的估计值
rhs=[];%rhs是由其前向节点（起始点到当前点）的g值计算得到
neighbour=[-1,0; % 8 direction
           -1,1;
           0,1;
           1,1;
           1,0;
           1,-1;
           0,-1;
           -1,-1]; 
g(1:xmax,1:ymax)=Inf;%遍历地图节点集S并初始化,这里注意行列对应的坐标是相反的
rhs(1:xmax,1:ymax)=Inf;
c(1:xmax,1:ymax)=0;
end