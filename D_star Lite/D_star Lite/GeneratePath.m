function path=GeneratePath()
global s_start
global s_goal
global neighbour
global xmax
global ymax
global rhs
path=[];%�洢�滮·��
while ~isSamePosition(s_start,s_goal)
    temp_rhs=Inf;%��ʱ�洢rhs���ڱȽ�
    min_rhs_point=s_start;
    for i=1:size(neighbour,1)%ѡ��s_start���к�̽ڵ���С��rhsֵ������Ϊ�µ�s_start
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
    s_start=min_rhs_point;%ѡ��s_start���к�̽ڵ���С��gֵ������Ϊ�µ�s_start
%     fprintf("next is %d %d\n",s_start(1),s_start(2))
    if temp_rhs==Inf
        disp('No Path to GOAL!');
        break;
    else
        path=[path;s_start];%�ƶ���s_start�㣬���洢��path��
    end
end
