function rhs_cal(s)%计算节点rhs
    global neighbour;
    global rhs;
    global g;
    global c;
    global s_goal;
    global xmax;
    global ymax;
    if ~isSamePosition(s,s_goal)%如果s不是目标点，取s节点后继节点中最小的rhs作为s节点的rhs值
        min_rhs=Inf;%用于对比找到min s'∈Succ(u)(c(u,s')+g(s'))
        for i=1:size(neighbour,1)
            s_prime=s(1:2)+neighbour(i,1:2);
            if s_prime(1)<1||s_prime(1)>xmax||s_prime(2)<1||s_prime(2)>ymax
                continue
            end
            if c(s_prime(1),s_prime(2))==Inf||c(s(1),s(2))==Inf%该点是障碍物
                c_ssprime=Inf;
                continue
            else
                c_ssprime=norm(s_prime-s(1:2));%该值可以计算成实际距离
            end
            if min_rhs>(c_ssprime+g(s_prime(1),s_prime(2)))
                min_rhs=c_ssprime+g(s_prime(1),s_prime(2));
            end
        end
        rhs(s(1),s(2))=min_rhs;
    end
end