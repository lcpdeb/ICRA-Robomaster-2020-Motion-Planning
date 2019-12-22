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
    while(CompareKey(key_TopKey,key_s_start)||(rhs(s_start(1), s_start(2))>g(s_start(1), s_start(2))))%�������б������ŵ㣨key��С����keyֵС����ʼ���keyֵ������ʼ��ֲ���һ�£�g��rhs���ȣ�ʱ

        % ��ʱU����λ��keyֵ��С��Ԫ��
        [key_old(1),key_old(2),minIndex]=GetMinKey(U);
        u=U(minIndex,:);
        
        [key_new(1),key_new(2)]=CalculateKey(u);%����ýڵ���keyֵ     
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

        if(CompareKey(key_old,key_new))%����ýڵ��keyֵС��ԭ�ȵ�keyֵ
            %U.Update(u,key_new)
            U(minIndex,3:4)=key_new;
            
        elseif(g(u(1),u(2))>rhs(u(1),u(2)))%�ֲ���һ�£���Ե���ۺ���ֵ��ͣ������������ϰ��ﱻ�������������һ�����̽ݾ�,��ʼ��չ�ڵ�
            g(u(1),u(2))=rhs(u(1),u(2));%ʹ�ֲ�һ��
            U(minIndex,:)=[];%ɾ���ýڵ�
            
            % for all s �� Pred(u)
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
                UpdateVertex(s_temp);%����ǰ�̽ڵ㼯������ǰ�̽ڵ��keyֵ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 % plot temp next node
%                 plot(s_temp(1),s_temp(2),'o','color','b')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            end
            
%%%%%%%%%%%%%%%% REACH TO HERE AFTER NEW OBSTACLE SCANNED %%%%%%%%%%%%%%%%
        else
            g_old=g(u(1),u(2));
            g(u(1),u(2))=Inf;%�����ϰ���
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