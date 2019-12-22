function path=GeneratePath()
global s_start
global s_goal
global neighbour
global xmax
global ymax
global rhs
path=[];%存储规划路径
while ~isSamePosition(s_start,s_goal)
    temp_rhs=Inf;%临时存储rhs用于比较
    min_rhs_point=s_start;
    for i=1:size(neighbour,1)%选择s_start所有后继节点最小的rhs值坐标作为新的s_start
        s_temp=s_start+neighbour(i,1:2);
        if s_temp(1)<1||s_temp(1)>xmax||s_temp(2)<1||s_temp(2)>ymax
            continue
        end
%         fprintf("s_temp is %d %d\n",s_temp(1),s_temp(2))
        if temp_rhs>rhs(s_temp(1),s_temp(2))
            temp_rhs=rhs(s_temp(1),s_temp(2));
%             fprintf("temp_rhs is %d\n",temp_rhs)
            min_rhs_point=s_temp;
        end
    end
    s_start=min_rhs_point;%选择s_start所有后继节点最小的g值坐标作为新的s_start
%     fprintf("next is %d %d\n",s_start(1),s_start(2))
    if temp_rhs==Inf
        disp('No Path to GOAL!');
        break;
    else
        path=[path;s_start];%移动到s_start点，并存储到path中
    end
end
