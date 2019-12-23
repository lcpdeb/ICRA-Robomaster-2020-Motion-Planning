%% D* Lite Path Planning
% Yuan You
% Dec. 1 2019
clc
clear
close all
scanner_size=10;
plot_cover_flag=1;
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
% %% %%%%%%%%%%%%%%%%%%%%%% SCANNER %%%%%%%%%%%%%%%%%%%%%%%%%
% scanner_region=[];
% for i=-scanner_size:1:scanner_size
%     for j=-scanner_size:1:scanner_size
%         scanner_region=[scanner_region
%                         i j];
%     end
% end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%%
load(fullfile('D:','OneDrive - The Ohio State University','ICRA-Robomaster-2020-Motion-Planning','D star Lite C++','D_start_Lite','ccpp.txt'))


s_start=[80,50];
s_goal=[3,3];
s_last=s_start;%��ǰλ�õ�sl(��һʱ�̵�λ�õ�)��Ϊ�µ���ʼ�㷴������Ŀ���sg���µ���ʼ�������·��
rhs(s_goal(1),s_goal(2))=0;%Ŀ���rhs��0
U=[s_goal,norm(s_start-s_goal),0];%��Ŀ��㼰��keyֵ���뵽�����б�U��
ComputeShortestPath();%�滮·��
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
load(fullfile('D:','OneDrive - The Ohio State University','ICRA-Robomaster-2020-Motion-Planning','D star Lite C++','D_start_Lite','pathcpp.txt'))
plot(pathcpp(:,1),pathcpp(:,2),'LineWidth',1,'Color','k');
load(fullfile('D:','OneDrive - The Ohio State University','ICRA-Robomaster-2020-Motion-Planning','D star Lite C++','D_start_Lite','rhscpp.txt'))