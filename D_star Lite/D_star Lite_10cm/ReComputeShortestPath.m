function ComputeShortestPath()
    global s_start;
    global s_goal;
    global U;
    global neighbour;
    global g;
    global rhs;
    global map;
    global obstacle;
    global xmax;
    global ymax;
    global close_list;
    close_list=[];
    [key_s_start(1),key_s_start(2)]=CalculateKey(s_start);
    [key_TopKey(1),key_TopKey(2),~]=minKey(U);
    while(CompareKey(key_TopKey,key_s_start)||(rhs(s_start(1), s_start(2))>g(s_start(1), s_start(2))))%�������б������ŵ㣨key��С����keyֵС����ʼ���keyֵ������ʼ��ֲ���һ�£�g��rhs���ȣ�ʱ

        % ��ʱU����λ��keyֵ��С��Ԫ��
        [k_old(1),k_old(2),minIndex]=minKey(U);
        u=U(minIndex,:);
        
        
        pause(0.001)
        % plot current node
        if ~isSamePosition(u, s_start)
            red=norm(u(1:2)-s_start)/norm(s_goal-s_start);
            if red>1
                red=abs(2-1*red);
                green=0;
            else
                green=1-red;
            end
            node_color=[red,green,0];
            plot(u(1),u(2),'o','MarkerFaceColor',node_color,'MarkerEdgeColor',node_color)
        end
        

        U(minIndex,:)=[];%ɾ���ýڵ�
        close_list=[close_list
                    u(1:2) 0 0 size(close_list,1)];
        [k_new(1),k_new(2)]=CalculateKey(u);%����ýڵ���keyֵ
        if(CompareKey(k_old,k_new))%����ýڵ��keyֵ����ԭ�ȵ�keyֵ
            U=[U;
               u(1:2),k_new,size(close_list,1)];%���������뵽U
        elseif(g(u(1),u(2))>rhs(u(1),u(2)))%�ֲ���һ�£���Ե���ۺ���ֵ��ͣ������������ϰ��ﱻ�������������һ�����̽ݾ�,��ʼ��չ�ڵ�
            g(u(1),u(2))=rhs(u(1),u(2));%ʹ�ֲ�һ��
            for i=1:size(neighbour,1)
                s_temp=u(1:2)+neighbour(i,:);
                temp_g=g(u(1),u(2))+norm(s_temp(1:2)-u(1:2));
                s_temp=[s_temp,0,0,temp_g];
                if s_temp(1)<1||s_temp(1)>xmax||s_temp(2)<1||s_temp(2)>ymax
                    continue
                end
                if isObstacle(s_temp,obstacle)
                    continue
                end
%                 if isInCloseList(s_temp,close_list)
%                     continue
%                 end
                if isInOpenList(s_temp,U)
                    continue
                end

                UpdateVertex(s_temp);%����ǰ�̽ڵ㼯������ǰ�̽ڵ��keyֵ
                % plot temp next node
                plot(s_temp(1),s_temp(2),'o','color','b')
            end
            
%%%%%%%%%%%%%%%% REACH TO HERE AFTER NEW OBSTACLE SCANNED %%%%%%%%%%%%%%%%
        else
            g(u(1),u(2))=Inf;%�����ϰ���
            for i=1:size(neighbour,1)
                s_temp=u(1:2)+neighbour(i,:);
                if s_temp(1)<1||s_temp(1)>xmax||s_temp(2)<1||s_temp(2)>ymax
                    continue
                end
                if isObstacle(s_temp,obstacle)
                    continue
                end
%                 if isInOpenList(s_temp,U)
%                     continue
%                 end
                
                UpdateVertex(s_temp);%����ǰ�̽ڵ㼯������ǰ�̽ڵ��keyֵ
            end
            UpdateVertex(u);%��ǰ�����
%%%%%%%%%%%%%%%% REACH TO HERE AFTER NEW OBSTACLE SCANNED %%%%%%%%%%%%%%%%

        end
        [key_s_start(1),key_s_start(2)]=CalculateKey(s_start);
        [key_TopKey(1),key_TopKey(2),~]=minKey(U);
    end
end