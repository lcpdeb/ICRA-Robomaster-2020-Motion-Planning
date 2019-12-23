% % figure(2)
% % path_line=plot([ 1 2 3 4 5],[1 2 3 4 5])
% % hold on
% % x=[3 4 5 6];
% % y=[3 4 5 6];
% % pause(1)
% % path_line.XData=x;
% % path_line.YData=y;
% % pause(1)
% % refreshdata 
% 
% 
% list=[2
%       3
%       4
%       5
%       6];
%  
% figure(2)
% hold on
% start_point=plot(s_start(1),s_start(2),'s','MarkerSize',10','MarkerFaceColor','b','MarkerEdgeColor','k');
% goal_point=plot(s_goal(1),s_goal(2),'s','MarkerSize',10','MarkerFaceColor','r','MarkerEdgeColor','k');
% plot(obstacle(1,1),obstacle(1,2),'s','MarkerSize',10','MarkerFaceColor',[0.7,0.7,0.7],'MarkerEdgeColor','k')
% path_line=plot(path(1,1),path(1,2),'LineWidth',4,'Color','r');
% % Plot new OBSTACLE
% plot(new_obstacle(1,1),new_obstacle(1,2),'s','MarkerSize',10','MarkerFaceColor',[1,0.5,0.7],'MarkerEdgeColor','k')
% % Plot new FREE
% plot(new_free(1,1),new_free(1,2),'s','MarkerSize',10','MarkerFaceColor',[0.9,0.9,0.9],'MarkerEdgeColor',[0.9,0.9,0.9])
% % Call SCANNER
% % scanner_inner=rectangle('LineWidth',2,'edgecolor','y');
% % scanner_outer=rectangle('LineWidth',2,'edgecolor','y'); 
% 
% path_li333ne=plot(path(2,1),path(2,2),'LineWidth',2,'Color','y');
% legend('Start','Goal','Known Obstacle','Path','Unknown Obstacle','Unknown Free','Scanner Region')
list=[1 1 3
      2 2 4
      3 3 5
      4 4 6];
c=[3 3];
tt=[c+list(:,1:2)]