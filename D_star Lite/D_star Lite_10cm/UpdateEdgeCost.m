function UpdateEdgeCost(c_old,c_uv,u,v,NewFreeFlag,NewObstacleFlag)
global g;
global c;
global rhs;
global neighbour;
global s_goal;
global xmax;
global ymax;

% New Free scanned
if c_old>c_uv
    if ~isSamePosition(u,s_goal)
        rhs(u(1),u(2))=min(rhs(u(1),u(2)),c_uv+g(v(1),v(2)));
    end
% New Obstacle scanned
elseif rhs(u(1),u(2))==c_old+g(v(1),v(2))
    if ~isSamePosition(u,s_goal)
        min_rhs=Inf;%用于对比找到min s'∈Succ(u)(c(u,s')+g(s'))
        for k=1:size(neighbour,1)%更新周边点信息
            s_prime=u+neighbour(k,:);
            if s_prime(1)<1||s_prime(1)>xmax||s_prime(2)<1||s_prime(2)>ymax
                continue
            end
            if ~isSamePosition(u,s_goal)
                if c(s_prime(1),s_prime(2))==Inf || c(u(1),u(2))==Inf
                    c_usprime=Inf;
                else
                    c_usprime=norm(u-s_prime);
                end
                if min_rhs>c_usprime+g(s_prime(1),s_prime(2))
                    min_rhs=c_usprime+g(s_prime(1),s_prime(2));
                end
            end
        end
        rhs(u(1),u(2))=min_rhs;
    end
end
UpdateVertex(u);
end