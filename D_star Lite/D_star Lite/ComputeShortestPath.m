function ComputeShortestPath()
    global s_start;
    global s_goal;
    global U;
    global neighbour;
    global g;
    global c;
    global rhs;
    global xmax;
    global ymax;
    [key_s_start(1),key_s_start(2)]=CalculateKey(s_start);
    [key_TopKey(1),key_TopKey(2),~]=GetMinKey(U);
    while(CompareKey(key_TopKey,key_s_start)||(rhs(s_start(1), s_start(2))>g(s_start(1), s_start(2))))%当优先列表中最优点（key最小）的key值小于起始点的key值或者起始点局部不一致（g和rhs不等）时

        % 此时U的首位是key值最小的元素
        [key_old(1),key_old(2),minIndex]=GetMinKey(U);
        u=U(minIndex,:);
        
        [key_new(1),key_new(2)]=CalculateKey(u);%计算该节点新key值     
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         pause(0.0001)        
%         % plot current node
%         if ~isSamePosition(u, s_start)
%             red=norm(u(1:2)-s_start)/norm(s_goal-s_start);
%             if red>1
%                 red=abs(2-1*red);
%                 green=0;
%             else
%                 green=1-red;
%             end
%             node_color=[red,green,0];
%             plot(u(1),u(2),'o','MarkerFaceColor',node_color,'MarkerEdgeColor',node_color)
%         end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        if(CompareKey(key_old,key_new))%如果该节点的key值小于原先的key值
            %U.Update(u,key_new)
            U(minIndex,3:4)=key_new;
            
        elseif(g(u(1),u(2))>rhs(u(1),u(2)))%局部过一致，边缘代价函数值变低，代表网格上障碍物被清除或者搜索到一条更短捷径,开始扩展节点
            g(u(1),u(2))=rhs(u(1),u(2));%使局部一致
            U(minIndex,:)=[];%删除该节点
            
            % for all s ∈ Pred(u)
            for i=1:size(neighbour,1)
                s_temp=u(1:2)+neighbour(i,1:2);
                if s_temp(1)<1||s_temp(1)>xmax||s_temp(2)<1||s_temp(2)>ymax
                    continue
                end
%                 if isInOpenList(s_temp,U)
%                     continue
%                 end
%                 if isObstacle(s_temp,obstacle)
%                     continue
%                 end
                if ~isSamePosition(s_temp, s_goal)
                    if c(s_temp(1),s_temp(2))~=Inf
                        cost=neighbour(i,3);
                    else
                        cost=Inf;
                    end
                    rhs(s_temp(1),s_temp(2))=min(rhs(s_temp(1),s_temp(2)),cost+g(u(1),u(2)));
%                     fprintf("rhs(%d,%d): %d\n",s_temp(1),s_temp(2),rhs(s_temp(1),s_temp(2)))
                end
                UpdateVertex(s_temp);%遍历前继节点集并更新前继节点的key值
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 % plot temp next node
%                 plot(s_temp(1),s_temp(2),'o','color','b')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            end
            
%%%%%%%%%%%%%%%% REACH TO HERE AFTER NEW OBSTACLE SCANNED %%%%%%%%%%%%%%%%
        else
            g_old=g(u(1),u(2));
            g(u(1),u(2))=Inf;%遇到障碍物
            predecessor_list=[u(1:2)+neighbour(:,1:2)
                              u(1:2)];

            for j=1:size(predecessor_list,1)
                s_temp=predecessor_list(j,:);
                if s_temp(1)<1||s_temp(1)>xmax||s_temp(2)<1||s_temp(2)>ymax
                    continue
                end
%                 if c(u(1),u(2))==Inf || c(s_temp(1),s_temp(2))==Inf
%                     c_su=Inf;
%                 else
%                     c_su=norm(u(1:2)-s_temp);
%                 end
%                 if rhs(s_temp(1),s_temp(2))==c_su+g_old
                if ~isSamePosition(s_temp,s_goal)
                    rhs_cal(s_temp);
                end
%                 end
                UpdateVertex(s_temp);
            end
%%%%%%%%%%%%%%%% REACH TO HERE AFTER NEW OBSTACLE SCANNED %%%%%%%%%%%%%%%%

        end
        [key_s_start(1),key_s_start(2)]=CalculateKey(s_start);
        [key_TopKey(1),key_TopKey(2),~]=GetMinKey(U);
    end
end