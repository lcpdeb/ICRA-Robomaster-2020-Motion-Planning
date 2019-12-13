 
%% D* Lite Path Planning
% Yuan You
% Dec. 1 2019

clc;
clear;
close all
global accuracy;
accuracy=10; % cm
global robot_size;
robot_size=45; % cm
global side;
side='R';
% input
global s_start;
global s_goal;
global xmax;
global ymax;
global U; % open list
global close_list;
global k_m;
global g;
global c;
global rhs;
global key;
global neighbour;
global obstacle;
global cover;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% INITIALIZATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xmax=81*10/accuracy+1;%定义地图大小-行
ymax=51*10/accuracy+1;%定义地图大小-列


%% 生成边界和障碍物
boundary=GetBoundary();
obstacle=GetObstacle();
cover=GetObstacleCover();

% 更新活动区域
RedRegenerate.x=2.3*10/accuracy+1;
RedRegenerate.y=31.2*10/accuracy+1;

ShootFree.x=16.3*10/accuracy+1;
ShootFree.y=16.95*10/accuracy+1;

BlueSupply.x=(81-38.3-5.4)*10/accuracy+1;
BlueSupply.y=(51-2.7-4.8)*10/accuracy+1;

BlueRegenerate.x=(81-2.3-5.4)*10/accuracy+1;
BlueRegenerate.y=(51-31.2-4.8)*10/accuracy+1;

MoveFree.x=(81-16.3-5.4)*10/accuracy+1;
MoveFree.y=(51-16.95-4.8)*10/accuracy+1;

RedSupply.x=38.3*10/accuracy+1;
RedSupply.y=2.7*10/accuracy+1;

UpdateRegion(RedRegenerate, RedSupply, BlueRegenerate, BlueSupply, ShootFree, MoveFree)

%%
U=[];%优先级列表，用于存储待扩展的非一致节点(g(s)!=rhs(s))
close_list=[];
k_m=0;%记录最初起点到当前起始点的代价值
g=[];%g和rhs表示节点s到目标点的最小代价的估计值
rhs=[];%rhs是由其前向节点（起始点到当前点）的g值计算得到
key=[];
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
for i=1:1:size(cover,1)
    c(cover(i,1),cover(i,2))=Inf;
end
%% %%%%%%%%%%%%%%%%%%%%%% SCANNER %%%%%%%%%%%%%%%%%%%%%%%%%
% Half radius of the real SCANNER 
scanner_size=12;
scanner_region=[];
for i=-scanner_size:1:scanner_size
    for k=-scanner_size:1:scanner_size
        scanner_region=[scanner_region
                        i k];
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    PLOTTING    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
hold on
grid on;
axis equal
xticks(0:1:xmax+1)
yticks(0:1:ymax+1)
xlim([-1.0*scanner_size+floor(robot_size/2/accuracy),xmax+1.0*scanner_size-floor(robot_size/2/accuracy)])
ylim([-1.0*scanner_size+floor(robot_size/2/accuracy),ymax+1.0*scanner_size-floor(robot_size/2/accuracy)])
set(gcf, 'position', [0 0 18*(xmax+scanner_size) 18*(ymax+scanner_size)]);

%%
plot(cover(:,1),cover(:,2),'s','MarkerSize',accuracy,'MarkerFaceColor','w','MarkerEdgeColor','k')
%%
plot(obstacle(:,1),obstacle(:,2),'s','MarkerSize',accuracy,'MarkerFaceColor',[0.7,0.7,0.7],'MarkerEdgeColor','k')
plot(boundary(:,1),boundary(:,2),'s','MarkerSize',accuracy','MarkerFaceColor','w','MarkerEdgeColor','k')
PlotRealRange(RedRegenerate, RedSupply, BlueRegenerate, BlueSupply, ShootFree, MoveFree);
%% Choose Start and Goal
% s_start=round([75 50]*10/accuracy);%起始点
s_start=round(ginput(1));
while c(s_start(1),s_start(2))==Inf
    s_start=round(ginput(1));
end
start_saved=s_start;%储存起始点
% s_goal=round([5 5]*10/accuracy);%目标点
s_goal=round(ginput(1));
while c(s_goal(1),s_goal(2))==Inf
    s_goal=round(ginput(1));
end
%%
s_last=s_start;%当前位置点sl(下一时刻的位置点)视为新的起始点反复计算目标点sg与新的起始点间的最短路径
rhs(s_goal(1),s_goal(2))=0;%目标点rhs置0
CalculateKey(s_goal);
U=[s_goal,norm(s_start-s_goal),0];%将目标点及其key值插入到优先列表U中
goal_point=plot(s_goal(1),s_goal(2),'s','MarkerSize',accuracy,'MarkerFaceColor','r','MarkerEdgeColor','k');
start_point=plot(s_start(1),s_start(2),'s','MarkerSize',accuracy,'MarkerFaceColor','b','MarkerEdgeColor','k');
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% COMPUTE FIRST OPTIMAL PATH %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic
ComputeShortestPath();%规划路径
toc
path=GeneratePath();%生成路径
% path=[start_saved
%       path];

% plot path, update in main
try
    path_line=plot(path(:,1),path(:,2),'LineWidth',round(accuracy/2),'Color','r');
catch
    disp('END')
    end_flag=1;
end

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% NEW OBSTACLE/FREE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
new_obstacle=[1 30
              2 30
              3 30
              9 21
              10 20
              11 19
              12 18
              9  20
              10 19
              11 18
              12 17
              10 21
              10 22
              64 41
              64 40
              64 39
              64 38
              64 37
              62 39
              63 39
              65 39
              66 39];
new_cover=[62 39
           63 39
           65 39
           66 39
           3 31
           3 32
           4 31
           4 32
           5 31
           4 30
           5 30
           2 29
           3 29
           4 29
           5 29
           2 28
           3 28
           4 28
           10 23
           10 24
           9 21
           8 21
           13 18
           14 18
           13 17
           14 17
           12 16
           12 15
           11 17
           10 17
           10 18
           9 18
           9 19
           8 19
           8 20
           7 20
           8 21
           9 22
           8 22
           11 22
           12 22
           11 21
           12 21
           11 20
           12 20
           12 19
           13 19
           11 16
           13 16
           9 23
           11 23];

new_free=[4 11
          5 11
          6 11
          7 11
          8 11
          9 11
          10 11
          11 11
          11 10
          11 9
          11 8
          11 7
          11 6
          11 5
          11 4
          58 38
          59 38
          60 38
          61 38
          67 38
          68 38
          58 37
          59 37
          60 37
          61 37
          67 37
          68 37
          58 36
          59 36
          60 36
          61 36
          67 36
          68 36
          58 35
          59 35
          60 35
          61 35
          67 35
          68 35
          58 34
          59 34
          60 34
          61 34
          62 34
          66 34
          67 34
          68 34
          58 33
          59 33
          60 33
          61 33
          62 33
          63 33
          64 33
          65 33
          66 33
          67 33
          68 33
          58 32
          59 32
          60 32
          61 32
          62 32
          63 32
          64 32
          65 32
          66 32
          67 32
          68 32
          58 31
          59 31
          60 31
          61 31
          62 31
          63 31
          64 31
          65 31
          66 31
          67 31
          68 31];


%% Plot Map Updated
try
    % Plot new OBSTACLE
    plot(new_obstacle(:,1),new_obstacle(:,2),'s','MarkerSize',accuracy,'MarkerFaceColor',[1,0.5,0.7],'MarkerEdgeColor','k')
catch
end

try
    % Plot new FREE
    plot(new_free(:,1),new_free(:,2),'s','MarkerSize',accuracy,'MarkerFaceColor','w','MarkerEdgeColor','w')
catch
end
    % Call SCANNER
scanner_inner=rectangle('LineWidth',2,'edgecolor','y','Visible','off');
scanner_outer=rectangle('LineWidth',2,'edgecolor','y','Visible','off'); 
% Plot new cover
plot(new_cover(:,1),new_cover(:,2),'s','MarkerSize',accuracy,'MarkerFaceColor','w','MarkerEdgeColor','k')


% New start
try
    path_index=1;
    s_start=path(path_index,:);
    end_flag=0;
catch
    end_flag=1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    MAIN LOOP    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while~isSamePosition(s_start,s_goal) && ~end_flag%s_start不等于s_goal
    pause(0.1)
    % Update start point marker, scanner
    % Replot start point
    set(start_point,'Visible','off');
    start_point=plot(s_start(1),s_start(2),'s','MarkerSize',accuracy,'MarkerFaceColor','b','MarkerEdgeColor','k');
    goal_point=plot(s_goal(1),s_goal(2),'s','MarkerSize',accuracy,'MarkerFaceColor','r','MarkerEdgeColor','k');
    set(start_point,'xdata',s_start(1),'ydata',s_start(2),'Visible','on')
    set(scanner_inner,'Position',[s_start(1)-1.2*scanner_size, s_start(2)-1.05*scanner_size, 2*1.2*scanner_size, 2*1.2*scanner_size],'Visible','on');
%     set(scanner_outer,'Position',[s_start(1)-2*scanner_size, s_start(2)-2*scanner_size, 4*scanner_size, 4*scanner_size],'Visible','on');
    
    
    Update_Map_Flag=0;%标记周边点状态是否发生变化
    for i=1:size(scanner_region,1)%检测周边点情况
        s_scanned=s_start+scanner_region(i,:);
        %未越界
        if s_scanned(1)<1||s_scanned(1)>xmax||s_scanned(2)<1||s_scanned(2)>ymax
            continue
        end
        
        % Scanning map surround
        % Scan graph fro changed edge cost
        try
            [NewFreeFlag,NewFreeIndex]=isInOpenList(s_scanned,new_free);
        catch
            NewFreeFlag=false;
        end
        try
            [NewObstacleFlag,NewObstacleIndex]=isInCloseList(s_scanned,new_obstacle);
            [NewCoverFlag,NewCoverIndex]=isInCloseList(s_scanned,new_cover);
        catch
            NewObstacleFlag=false;
            NewCoverFlag=false;
        end
        % If any edge costs changed
        % If new free scanned
        if NewFreeFlag
            c(s_scanned(1),s_scanned(2))=norm(s_start-s_scanned);%检测到free，更新c
            k_m=k_m+norm(s_last-s_start);%k_m更新
            s_last=s_start;
            new_free(NewFreeIndex,:)=[];
            Update_Map_Flag=1;%周边点有更新
            % for all directed edges(u,v) with changed edge costs
            for k=1:size(neighbour,1)%更新周边点信息
                %         v        =    u      + neighbour
                s_surround_scanned = s_scanned + neighbour(k,:);
                if s_surround_scanned(1)<1||s_surround_scanned(1)>xmax||s_surround_scanned(2)<1||s_surround_scanned(2)>ymax
                    continue
                end
                %%%%%%%%%%%%%%%%% edge direction from u to v %%%%%%%%%%%%%%%%%
                v=s_surround_scanned;
                u=s_scanned;
                c_old=Inf;% new free 说明以前是 obstacle, c_old一定为Inf
                % Update the edge cost c(u,v)
                if c(v(1),v(2))==Inf % 如果v是obstacle,则c(u,v)为Inf
                    c_uv=Inf;
                else
                    c_uv=norm(u-v);
                end
                if c_old>c_uv
                    if ~isSamePosition(u,s_goal)
                        rhs(u(1),u(2))=min(rhs(u(1),u(2)),c_uv+g(v(1),v(2)));
                    end
%                 elseif rhs(u(1),u(2))==c_old+g(v(1),v(2))
                elseif ~isSamePosition(u,s_goal)
                        % rhs(u)=min s'∈Succ(u) (c(u,s')+g(s'))
                        rhs_cal(u);
                end
                UpdateVertex(u);
                rhs_cal(v);
                UpdateVertex(v);
            end
        elseif NewObstacleFlag||NewCoverFlag
            c(s_scanned(1),s_scanned(2))=Inf;%检测到obstacle，更新c
            k_m=k_m+norm(s_last-s_start);%k_m更新
            s_last=s_start;
            if NewObstacleFlag
                new_obstacle(NewObstacleIndex,:)=[];
            elseif NewCoverFlag
                new_cover(NewCoverIndex,:)=[];
            end
            Update_Map_Flag=1;%周边点有更新
            % for all directed edges(u,v) with changed edge costs
            for k=1:size(neighbour,1)%更新周边点信息
                %         v        =    u      + neighbour
                s_surround_scanned = s_scanned + neighbour(k,:);
                if s_surround_scanned(1)<1||s_surround_scanned(1)>xmax||s_surround_scanned(2)<1||s_surround_scanned(2)>ymax
                    continue
                end
                %%%%%%%%%%%%%%%%% edge direction from u to v %%%%%%%%%%%%%%%%%
                v=s_surround_scanned;
                u=s_scanned;
                % Update from both direction
                % c_old=c(u,v)
                if c(v(1),v(2))==Inf %如果v是obstacle,则c_old是Inf
                    c_old=Inf;
                else
                    c_old=norm(v-u);%新obstacle说明以前是free，算c_old
                end
                % Update the edge cost c(u,v)
                c_uv=Inf;%现在u是obstacle了，所以update c(u,v)=Inf;
                
                if c_old>c_uv
                    if ~isSamePosition(u,s_goal)
                        rhs(u(1),u(2))=min(rhs(u(1),u(2)),c_uv+g(v(1),v(2)));
                    end
%                 elseif rhs(u(1),u(2))==c_old+g(v(1),v(2))
                elseif ~isSamePosition(u,s_goal)
                    % rhs(u)=min s'∈Succ(u) (c(u,s')+g(s'))
                    rhs_cal(u);
                    
                end
                UpdateVertex(u);
                rhs_cal(v);
                UpdateVertex(v);
            end
        end
    end
%     if Update_Map_Flag
       %% replan
%         k_m=k_m+norm(s_last-s_start);%k_m更新
%         s_last=s_start;
        ComputeShortestPath();%重新规划路径
        

        path=GeneratePath();%生成路径

        set(path_line,'Visible','off');
        try
            path_line=plot(path(:,1),path(:,2),'LineWidth',round(accuracy/2),'Color','r');
        catch
            disp('No path found.')
            disp('END')
            end_flag=1;
            break
        end

        path_index=1;
        s_start=path(path_index,:);
%         s_start=input("current location is:\n");
        set(start_point,'Visible','off');
        set(scanner_inner,'Position',[s_start(1)-1.2*scanner_size, s_start(2)-1.2*scanner_size, 2*1.2*scanner_size, 2*1.2*scanner_size],'Visible','on');
        start_point=plot(s_start(1),s_start(2),'s','MarkerSize',accuracy,'MarkerFaceColor','b','MarkerEdgeColor','k');
        goal_point=plot(s_goal(1),s_goal(2),'s','MarkerSize',accuracy,'MarkerFaceColor','r','MarkerEdgeColor','k');
%     else
%         path_index=path_index+1;
% %         s_start=path(path_index,:);
%         s_start=input("current location is:\n");
%     end
end
