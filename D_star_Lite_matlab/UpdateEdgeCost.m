function UpdateEdgeCost(updated_region)
global s_goal;
global neighbour;
global c;
global g;
global rhs;
global xmax;
global ymax;
    for i=1:size(updated_region,1)%����ܱߵ����
        s_updated=updated_region(i,:);
        %δԽ��
        if s_updated(1)<1||s_updated(1)>xmax||s_updated(2)<1||s_updated(2)>ymax
            continue
        end
        u=s_updated(1:2);
        % Scanning map surround
        % Scan graph for changed edge cost
        % for all directed edges(u,v) with changed edge costs
        for k=1:size(neighbour,1)%�����ܱߵ���Ϣ
            %         v        =    u      + neighbour
            s_surround_updated = s_updated(1:2) + neighbour(k,1:2);
            if s_surround_updated(1)<1||s_surround_updated(1)>xmax||s_surround_updated(2)<1||s_surround_updated(2)>ymax
                continue
            end
            %%%%%%%%%%%%%%%%% edge direction from u to v %%%%%%%%%%%%%%%%%
            v=s_surround_updated;
            % Update from both direction
            if s_updated(3)==1
                c(u(1),u(2))=Inf;%��⵽obstacle������c
                % c_old=c(u,v)
                if c(v(1),v(2))==Inf %���v��obstacle,��c_old��Inf
                    c_old=Inf;
                else
                    c_old=neighbour(k,3);%new obstacle˵����ǰ��free������c_old
                end
                % Update the edge cost c(u,v)
                c_uv=Inf;%����u��obstacle�ˣ�����update c(u,v)=Inf;
            elseif s_updated(3)==0
                c(u(1),u(2))=0;%��⵽free������c
                c_old=Inf;% new free ˵����ǰ�� obstacle, c_oldһ��ΪInf
                % Update the edge cost c(u,v)
                if c(v(1),v(2))==Inf % ���v��obstacle,��c(u,v)ΪInf
                    c_uv=Inf;
                else
                    c_uv=neighbour(k,3);
                end
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
    end
end