%% D* Lite Path Planning
% Yuan You
% Dec. 1 2019
clc
clear
close all
scanner_size=10;
plot_cover_flag=0;
global accuracy;
accuracy=10; % cm
global robot_size;
robot_size=45; % cm
global side;
side='B';%�췽R����B
% input
global s_start;
global s_goal;
global xmax;
global ymax;
global U; % open list
global k_m;
global g;
global c;
global rhs;
global neighbour;
global obstacle;
global cover;

Initialize();

%% ���ɱ߽���ϰ���
boundary=GetBoundary();
obstacle=GetObstacle();
cover=GetObstacleCover();
for i=1:1:size(cover,1)
    c(cover(i,1),cover(i,2))=Inf;
end
% ���»����
F1.name="�췽������";
F1.x=2.3*10/accuracy+1;
F1.y=31.2*10/accuracy+1;

F2.name="��ֹ�����";
F2.x=16.3*10/accuracy+1;
F2.y=16.95*10/accuracy+1;

F3.name="����������";
F3.x=(81-38.3-5.4)*10/accuracy+1;
F3.y=(51-2.7-4.8)*10/accuracy+1;

F4.name="������Ѫ��";
F4.x=(81-2.3-5.4)*10/accuracy+1;
F4.y=(51-31.2-4.8)*10/accuracy+1;

F5.name="��ֹ�ƶ���";
F5.x=(81-16.3-5.4)*10/accuracy+1;
F5.y=(51-16.95-4.8)*10/accuracy+1;

F6.name="�췽��Ѫ��";
F6.x=38.3*10/accuracy+1;
F6.y=2.7*10/accuracy+1;
%%
% ��ʼ��״̬��
F1.last_name="";
F2.last_name="";
F3.last_name="";
F4.last_name="";
F5.last_name="";
F6.last_name="";
updated_region=UpdateRegion(F1, F2, F3, F4, F5, F6);
% ����״̬��
F1.last_name=F1.name;
F2.last_name=F2.name;
F3.last_name=F3.name;
F4.last_name=F4.name;
F5.last_name=F5.name;
F6.last_name=F6.name;
%% %%%%%%%%%%%%%%%%%%%%%% SCANNER %%%%%%%%%%%%%%%%%%%%%%%%%
scanner_region=[];
for i=-scanner_size:1:scanner_size
    for j=-scanner_size:1:scanner_size
        scanner_region=[scanner_region
                        i j];
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    PLOTTING    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
hold on
grid on;
axis equal
set(gcf, 'position', [0 0 16*(xmax) 16*(ymax)]);
xticks(0:1:xmax+1)
yticks(0:1:ymax+1)
xlim([-0.0*scanner_size+floor(robot_size/2/accuracy)-2,xmax+0.0*scanner_size-floor(robot_size/2/accuracy)+3])
ylim([-0.0*scanner_size+floor(robot_size/2/accuracy)-2,ymax+0.0*scanner_size-floor(robot_size/2/accuracy)+3])


%%
if plot_cover_flag
    plot(cover(:,1),cover(:,2),'s','MarkerSize',accuracy,'MarkerFaceColor','w','MarkerEdgeColor','k')
end
%%
plot(obstacle(:,1),obstacle(:,2),'s','MarkerSize',accuracy,'MarkerFaceColor',[0.7,0.7,0.7],'MarkerEdgeColor','k')
plot(boundary(:,1),boundary(:,2),'s','MarkerSize',accuracy','MarkerFaceColor','w','MarkerEdgeColor','k')
PlotRealRange(F1, F2, F3, F4, F5, F6);
% plot region cover
if plot_cover_flag
    for i=1:1:size(updated_region,1)
        if updated_region(i,3)==1
            plot(updated_region(i,1),updated_region(i,2),'s','MarkerSize',accuracy,'MarkerFaceColor','k','MarkerEdgeColor','k')
        elseif updated_region(i,3)==0
            plot(updated_region(i,1),updated_region(i,2),'s','MarkerSize',accuracy,'MarkerFaceColor','w','MarkerEdgeColor','w')
        end
    end
end
F1_text=text(F1.x+0.25,F1.y+2.5,F1.name);
F2_text=text(F2.x+0.25,F2.y+2.5,F2.name);
F3_text=text(F3.x+0.25,F3.y+2.5,F3.name);
F4_text=text(F4.x+0.25,F4.y+2.5,F4.name);
F5_text=text(F5.x+0.25,F5.y+2.5,F5.name);
F6_text=text(F6.x+0.25,F6.y+2.5,F6.name);
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
goal_point=plot(s_goal(1),s_goal(2),'s','MarkerSize',accuracy,'MarkerFaceColor','g','MarkerEdgeColor','k');

start_point=rectangle('Position',[s_start(1)-robot_size/accuracy/2, s_start(2)-robot_size/accuracy/2, 2*robot_size/accuracy/2, 2*robot_size/accuracy/2],'FaceColor',side);
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

pause(0.5)

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
remove_list=[];
while~isSamePosition(s_start,s_goal) && ~end_flag%s_start������s_goal
    pause(0.2)
    % Update start point marker, scanner
    % Replot start point
    set(start_point,'Visible','off');
%     start_point=plot(s_start(1),s_start(2),'s','MarkerSize',accuracy,'MarkerFaceColor','b','MarkerEdgeColor','k');
    start_point=rectangle('Position',[s_start(1)-robot_size/accuracy/2, s_start(2)-robot_size/accuracy/2, 2*robot_size/accuracy/2, 2*robot_size/accuracy/2],'FaceColor',side);
    goal_point=plot(s_goal(1),s_goal(2),'s','MarkerSize',accuracy,'MarkerFaceColor','g','MarkerEdgeColor','k');
    set(start_point,'Position',[s_start(1)-robot_size/accuracy/2, s_start(2)-robot_size/accuracy/2, 2*robot_size/accuracy/2, 2*robot_size/accuracy/2],'Visible','on')
    set(scanner,'Position',[s_start(1)-1.05*scanner_size, s_start(2)-1.05*scanner_size, 2*1.05*scanner_size, 2*1.05*scanner_size],'Visible','on');
    %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% NEW OBSTACLE/FREE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   % ���µз�������λ��
    try
        set(enemy_cover,'visible','off')
        set(enemy_robot,'visible','off')
        c(enemy_cover(:,1),enemy_cover(:,2))=0;
    catch
    end
    enemy_robot_point=[27,11];
    enemy_robot_cover=[];
    for i=enemy_robot_point(1)-ceil(robot_size/accuracy/2)-floor(robot_size/accuracy/2):1:enemy_robot_point(1)+ceil(robot_size/accuracy/2)+floor(robot_size/accuracy/2)
        enemy_robot_cover=[enemy_robot_cover
                            i,enemy_robot_point(2)-ceil(robot_size/accuracy/2)-floor(robot_size/accuracy/2)];
        enemy_robot_cover=[enemy_robot_cover
                            i,enemy_robot_point(2)+ceil(robot_size/accuracy/2)+floor(robot_size/accuracy/2)];
    end
    for j=enemy_robot_point(2)-ceil(robot_size/accuracy/2)-floor(robot_size/accuracy/2):1:enemy_robot_point(2)+ceil(robot_size/accuracy/2)+floor(robot_size/accuracy/2)
        enemy_robot_cover=[enemy_robot_cover
                           enemy_robot_point(1)-ceil(robot_size/accuracy/2)-floor(robot_size/accuracy/2),j];
        enemy_robot_cover=[enemy_robot_cover
                           enemy_robot_point(1)+ceil(robot_size/accuracy/2)+floor(robot_size/accuracy/2),j];
    end
    if side=='R'
        if plot_cover_flag
            plot(enemy_robot_cover(:,1),enemy_robot_cover(:,2),'s','MarkerSize',accuracy,'MarkerFaceColor','c','MarkerEdgeColor','k');
        end
        enemy_robot=rectangle('Position',[enemy_robot_point(1)-robot_size*(4/3)/accuracy/2, enemy_robot_point(2)-robot_size*(4/3)/accuracy/2, 2*robot_size*(4/3)/accuracy/2, 2*robot_size*(4/3)/accuracy/2],'FaceColor','b');
    elseif side=='B'
        if plot_cover_flag
            plot(enemy_robot_cover(:,1),enemy_robot_cover(:,2),'s','MarkerSize',accuracy,'MarkerFaceColor',[0.9290 0.6940 0.1250],'MarkerEdgeColor','k');
        end
        enemy_robot=rectangle('Position',[enemy_robot_point(1)-robot_size*(4/3)/accuracy/2, enemy_robot_point(2)-robot_size*(4/3)/accuracy/2, 2*robot_size*(4/3)/accuracy/2, 2*robot_size*(4/3)/accuracy/2],'FaceColor','r');
    end
        
    % ���»����
    F1.name="�췽������";
    F2.name="��ֹ�����";
    F3.name="�췽��Ѫ��";
    F4.name="������Ѫ��";
    F5.name="����������";
    F6.name="��ֹ�ƶ���";
    updated_region=UpdateRegion(F1,F2,F3,F4,F5,F6);
    % ����״̬
    F1.last_name=F1.name;
    F2.last_name=F2.name;
    F3.last_name=F3.name;
    F4.last_name=F4.name;
    F5.last_name=F5.name;
    F6.last_name=F6.name; 
    if plot_cover_flag
        for i=1:1:size(updated_region,1)
            if updated_region(i,3)==1
                plot(updated_region(i,1),updated_region(i,2),'s','MarkerSize',accuracy,'MarkerFaceColor','k','MarkerEdgeColor','k')
            elseif updated_region(i,3)==0
                plot(updated_region(i,1),updated_region(i,2),'s','MarkerSize',accuracy,'MarkerFaceColor','w','MarkerEdgeColor','w')
            end
        end
    end
    set(F1_text,'String',F1.name);
    set(F2_text,'String',F2.name);
    set(F3_text,'String',F3.name);
    set(F4_text,'String',F4.name);
    set(F5_text,'String',F5.name);
    set(F6_text,'String',F6.name);
    %% check Enemy Robot SLAM
    obstacle_detected_list=[];
    for i=1:size(scanner_region,1)
        s_scanning=s_start+scanner_region(i,:);
        %δԽ��
        if s_scanning(1)<1||s_scanning(1)>xmax||s_scanning(2)<1||s_scanning(2)>ymax
            continue
        end
        %�Ѿ�����
        if c(s_scanning(1),s_scanning(2))==Inf
            continue
        end
        [obstacle_detected_flag,obstacle_detected_index]=isInCloseList(s_scanning,enemy_robot_cover);
        if obstacle_detected_flag
            obstacle_detected_list=[obstacle_detected_list
                                enemy_robot_cover(obstacle_detected_index,:) 1];
        end
    end
    %��ɨ�赽���ϰ�����ӵ�updated region��
    updated_region=[updated_region
                    obstacle_detected_list];
    %% check Update
    if size(updated_region,1)
        k_m=k_m+norm(s_last-s_start);%k_m����
        s_last=s_start;
        UpdateEdgeCost(updated_region);
    end
    
    
   %% replan
    ComputeShortestPath();%���¹滮·��
    path=GeneratePath();%����·��
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
    set(scanner,'Position',[s_start(1)-1.05*scanner_size, s_start(2)-1.05*scanner_size, 2*1.05*scanner_size, 2*1.05*scanner_size],'Visible','on');
%         start_point=plot(s_start(1),s_start(2),'s','MarkerSize',accuracy,'MarkerFaceColor','b','MarkerEdgeColor','k');
    start_point=rectangle('Position',[s_start(1)-robot_size/accuracy/2, s_start(2)-robot_size/accuracy/2, 2*robot_size/accuracy/2, 2*robot_size/accuracy/2],'FaceColor',side);
    goal_point=plot(s_goal(1),s_goal(2),'s','MarkerSize',accuracy,'MarkerFaceColor','g','MarkerEdgeColor','k');
end