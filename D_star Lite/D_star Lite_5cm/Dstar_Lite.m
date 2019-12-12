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
xmax=81*10/accuracy+1;%�����ͼ��С-��
ymax=51*10/accuracy+1;%�����ͼ��С-��


%% ���ɱ߽���ϰ���
boundary=GetBoundary();
obstacle=GetObstacle();
cover=GetObstacleCover();

% ���»����
F1.name='�췽��Ѫ��';
F1.x=2.3*10/accuracy+1;
F1.y=31.2*10/accuracy+1;

F2.name='��ֹ�����';
F2.x=16.3*10/accuracy+1;
F2.y=16.95*10/accuracy+1;

F3.name='����������';
F3.x=(81-38.3-5.4)*10/accuracy+1;
F3.y=(51-2.7-4.8)*10/accuracy+1;

F4.name='������Ѫ��';
F4.x=(81-2.3-5.4)*10/accuracy+1;
F4.y=(51-31.2-4.8)*10/accuracy+1;

F5.name='��ֹ�ƶ���';
F5.x=(81-16.3-5.4)*10/accuracy+1;
F5.y=(51-16.95-4.8)*10/accuracy+1;

F6.name='�췽������';
F6.x=38.3*10/accuracy+1;
F6.y=2.7*10/accuracy+1;
%%
UpdateRegion(F1, F2, F3, F4, F5, F6)
%%
U=[];%���ȼ��б����ڴ洢����չ�ķ�һ�½ڵ�(g(s)!=rhs(s))
close_list=[];
k_m=0;%��¼�����㵽��ǰ��ʼ��Ĵ���ֵ
g=[];%g��rhs��ʾ�ڵ�s��Ŀ������С���۵Ĺ���ֵ
rhs=[];%rhs������ǰ��ڵ㣨��ʼ�㵽��ǰ�㣩��gֵ����õ�
key=[];
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
for i=1:1:size(cover,1)
    c(cover(i,1),cover(i,2))=Inf;
end
%% %%%%%%%%%%%%%%%%%%%%%% SCANNER %%%%%%%%%%%%%%%%%%%%%%%%%
% Radius of the real SCANNER 
scanner_size=5;
scanner_region=[];
for i=-scanner_size:1:scanner_size
    for k=-scanner_size:1:scanner_size
        scanner_region=[scanner_region
                        i k];
    end
end
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    PLOTTING    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
hold on
grid on;
axis equal
xticks(0:1:xmax+1)
yticks(0:1:ymax+1)
xlim([-1.2*scanner_size,xmax+1.2*scanner_size])
ylim([-1.2*scanner_size,ymax+1.2*scanner_size])
set(gcf, 'position', [0 0 15*xmax 15*ymax]);
%%
plot(cover(:,1),cover(:,2),'s','MarkerSize',accuracy,'MarkerFaceColor','w','MarkerEdgeColor','k')
%%
plot(obstacle(:,1),obstacle(:,2),'s','MarkerSize',accuracy,'MarkerFaceColor',[0.7,0.7,0.7],'MarkerEdgeColor','k')
plot(boundary(:,1),boundary(:,2),'s','MarkerSize',accuracy','MarkerFaceColor','w','MarkerEdgeColor','k')
%%
PlotRealRange(F1, F2, F3, F4, F5, F6);
text(F1.x+0.25,F1.y+2.5,F1.name)
text(F2.x+0.25,F2.y+2.5,F2.name)
text(F3.x+0.25,F3.y+2.5,F3.name)
text(F4.x+0.25,F4.y+2.5,F4.name)
text(F5.x+0.25,F5.y+2.5,F5.name)
text(F6.x+0.25,F6.y+2.5,F6.name)
%% Choose Start and Goal
% s_start=round([75 50]*10/accuracy);%��ʼ��
s_start=round(ginput(1));
while c(s_start(1),s_start(2))==Inf
    s_start=round(ginput(1));
end
start_saved=s_start;%������ʼ��
% s_goal=round([5 5]*10/accuracy);%Ŀ���
s_goal=round(ginput(1));
while c(s_goal(1),s_goal(2))==Inf
    s_goal=round(ginput(1));
end
%%
s_last=s_start;%��ǰλ�õ�sl(��һʱ�̵�λ�õ�)��Ϊ�µ���ʼ�㷴������Ŀ���sg���µ���ʼ�������·��
rhs(s_goal(1),s_goal(2))=0;%Ŀ���rhs��0
CalculateKey(s_goal);
U=[s_goal,norm(s_start-s_goal),0];%��Ŀ��㼰��keyֵ���뵽�����б�U��
goal_point=plot(s_goal(1),s_goal(2),'s','MarkerSize',accuracy,'MarkerFaceColor','r','MarkerEdgeColor','k');
start_point=plot(s_start(1),s_start(2),'s','MarkerSize',accuracy,'MarkerFaceColor','b','MarkerEdgeColor','k');
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% COMPUTE FIRST OPTIMAL PATH %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic
ComputeShortestPath();%�滮·��
toc
path=GeneratePath();%����·��
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












%% Plot Map Updated
try
    % Plot new OBSTACLE
    plot(new_obstacle(:,1),new_obstacle(:,2),'s','MarkerSize',accuracy,'MarkerFaceColor',[1,0.5,0.7],'MarkerEdgeColor','k')
catch
end
try
    % Plot new FREE
    plot(new_free(:,1),new_free(:,2),'s','MarkerSize',accuracy,'MarkerFaceColor',[0.9,0.9,0.9],'MarkerEdgeColor',[0.9,0.9,0.9])
catch
end
    % Call SCANNER
scanner=rectangle('LineWidth',2,'edgecolor','y','Visible','off');




% New start
try
    path_index=1;
    s_start=path(path_index,:);
    end_flag=0;
catch
    end_flag=1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    MAIN LOOP    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while~isSamePosition(s_start,s_goal) && ~end_flag%s_start������s_goal
    pause(0.1)
    % Update start point marker, scanner
    % Replot start point
    set(start_point,'Visible','off');
    start_point=plot(s_start(1),s_start(2),'s','MarkerSize',accuracy,'MarkerFaceColor','b','MarkerEdgeColor','k');
    goal_point=plot(s_goal(1),s_goal(2),'s','MarkerSize',accuracy,'MarkerFaceColor','r','MarkerEdgeColor','k');
    set(start_point,'xdata',s_start(1),'ydata',s_start(2),'Visible','on')
    set(scanner,'Position',[s_start(1)-1.25*scanner_size, s_start(2)-1.25*scanner_size, 2*1.25*scanner_size, 2*1.25*scanner_size],'Visible','on');

    %% Recompute
    Update_Map_Flag=0;%����ܱߵ�״̬�Ƿ����仯
    for i=1:size(scanner_region,1)%����ܱߵ����
        s_scanned=s_start+scanner_region(i,:);
        %δԽ��
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
        catch
            NewObstacleFlag=false;
        end
        % If any edge costs changed
        % If new free scanned
        if NewFreeFlag
%             c(s_scanned(1),s_scanned(2))=norm(s_start-s_scanned);%��⵽free������c
            c(s_scanned(1),s_scanned(2))=0;%��⵽free������c
            k_m=k_m+norm(s_last-s_start);%k_m����
            s_last=s_start;
            new_free(NewFreeIndex,:)=[];
            Update_Map_Flag=1;%�ܱߵ��и���
            % for all directed edges(u,v) with changed edge costs
            for k=1:size(neighbour,1)%�����ܱߵ���Ϣ
                %         v        =    u      + neighbour
                s_surround_scanned = s_scanned + neighbour(k,:);
                if s_surround_scanned(1)<1||s_surround_scanned(1)>xmax||s_surround_scanned(2)<1||s_surround_scanned(2)>ymax
                    continue
                end
                %%%%%%%%%%%%%%%%% edge direction from u to v %%%%%%%%%%%%%%%%%
                v=s_surround_scanned;
                u=s_scanned;
                c_old=Inf;% new free ˵����ǰ�� obstacle, c_oldһ��ΪInf
                % Update the edge cost c(u,v)
                if c(v(1),v(2))==Inf % ���v��obstacle,��c(u,v)ΪInf
                    c_uv=Inf;
                else
                    c_uv=norm(u-v);
                end
                if c_old>c_uv
                    if ~isSamePosition(u,s_goal)
                        rhs(u(1),u(2))=min(rhs(u(1),u(2)),c_uv+g(v(1),v(2)));
                    end
                elseif rhs(u(1),u(2))==c_old+g(v(1),v(2))
                    if ~isSamePosition(u,s_goal)
                        % rhs(u)=min s'��Succ(u) (c(u,s')+g(s'))
                        rhs_cal(u);
                    end
                end
                UpdateVertex(u);
                rhs_cal(v);
                UpdateVertex(v);
            end
        elseif NewObstacleFlag
            c(s_scanned(1),s_scanned(2))=Inf;%��⵽obstacle������c
            k_m=k_m+norm(s_last-s_start);%k_m����
            s_last=s_start;
            new_obstacle(NewObstacleIndex,:)=[];
            Update_Map_Flag=1;%�ܱߵ��и���
            % for all directed edges(u,v) with changed edge costs
            for k=1:size(neighbour,1)%�����ܱߵ���Ϣ
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
                if c(v(1),v(2))==Inf %���v��obstacle,��c_old��Inf
                    c_old=Inf;
                else
                    c_old=norm(v-u);%��obstacle˵����ǰ��free����c_old
                end
                % Update the edge cost c(u,v)
                c_uv=Inf;%����u��obstacle�ˣ�����update c(u,v)=Inf;
                
                if c_old>c_uv
                    if ~isSamePosition(u,s_goal)
                        rhs(u(1),u(2))=min(rhs(u(1),u(2)),c_uv+g(v(1),v(2)));
                    end
                elseif rhs(u(1),u(2))==c_old+g(v(1),v(2))
                    if ~isSamePosition(u,s_goal)
                        % rhs(u)=min s'��Succ(u) (c(u,s')+g(s'))
                        rhs_cal(u);
                    end
                end
                UpdateVertex(u);
                rhs_cal(v);
                UpdateVertex(v);
            end
        end
    end
 %% Raise a FLAG and Update Buff Zone by reading Referee System (or read in real time?)
    cla
    F1.name='����������';
    F2.name='��ֹ�����';
    F3.name='��ֹ�ƶ���';
    F4.name='������Ѫ��';
    F5.name='�췽��Ѫ��';
    F6.name='�췽������';
    UpdateRegion(F1, F2, F3, F4, F5, F6)
    %%
    plot(cover(:,1),cover(:,2),'s','MarkerSize',accuracy,'MarkerFaceColor','w','MarkerEdgeColor','k')
    plot(obstacle(:,1),obstacle(:,2),'s','MarkerSize',accuracy,'MarkerFaceColor',[0.7,0.7,0.7],'MarkerEdgeColor','k')
    plot(boundary(:,1),boundary(:,2),'s','MarkerSize',accuracy','MarkerFaceColor','w','MarkerEdgeColor','k')
    %%
    PlotRealRange(F1, F2, F3, F4, F5, F6);
    text(F1.x+0.25,F1.y+2.5,F1.name)
    text(F2.x+0.25,F2.y+2.5,F2.name)
    text(F3.x+0.25,F3.y+2.5,F3.name)
    text(F4.x+0.25,F4.y+2.5,F4.name)
    text(F5.x+0.25,F5.y+2.5,F5.name)
    text(F6.x+0.25,F6.y+2.5,F6.name)
    %% Replot
    % plot path, update in main
    try
        path_line=plot(path(:,1),path(:,2),'LineWidth',round(accuracy/2),'Color','r');
    catch
        disp('END')
        end_flag=1;
    end
    scanner=rectangle('LineWidth',2,'edgecolor','y','Visible','off');
    set(scanner,'Position',[s_start(1)-1.25*scanner_size, s_start(2)-1.25*scanner_size, 2*1.25*scanner_size, 2*1.25*scanner_size],'Visible','on');
    start_point=plot(s_start(1),s_start(2),'s','MarkerSize',accuracy,'MarkerFaceColor','b','MarkerEdgeColor','k');
    goal_point=plot(s_goal(1),s_goal(2),'s','MarkerSize',accuracy,'MarkerFaceColor','r','MarkerEdgeColor','k');
    %% Update LIDAR
    %% replan
    ComputeShortestPath();%���¹滮·��


    path=GeneratePath();%����·��
    if ~size(path,1)
        disp('No path found.')
        end_flag=1;
        break;
    end
    path_line.XData=path(:,1);
    path_line.YData=path(:,2);

    path_index=1;
    s_start=path(path_index,:);
    %         s_start=input("current location is:\n");
    set(start_point,'Visible','off');
    set(scanner,'Position',[s_start(1)-1.25*scanner_size, s_start(2)-1.25*scanner_size, 2*1.25*scanner_size, 2*1.25*scanner_size],'Visible','on');
    start_point=plot(s_start(1),s_start(2),'s','MarkerSize',accuracy,'MarkerFaceColor','b','MarkerEdgeColor','k');
    goal_point=plot(s_goal(1),s_goal(2),'s','MarkerSize',accuracy,'MarkerFaceColor','r','MarkerEdgeColor','k');

end
