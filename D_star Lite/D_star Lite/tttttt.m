function tttttt()

accuracy=10;
xmax=81*10/accuracy+1;%定义地图大小-行
ymax=51*10/accuracy+1;%定义地图大小-列
neighbour=[-1,0; % 8 direction
           -1,1;
           0,1;
           1,1;
           1,0;
           1,-1;
           0,-1;
           -1,-1]; 
g(1:xmax,1:ymax)=99999;%遍历地图节点集S并初始化,这里注意行列对应的坐标是相反的
rhs(1:xmax,1:ymax)=99999;
c(1:xmax,1:ymax)=0;
end