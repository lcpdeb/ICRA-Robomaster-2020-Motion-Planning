function updated_region=UpdateRegion(F1, F2, F3, F4, F5, F6)
global side;
global accuracy;
global robot_size;
global xmax;
global ymax;
global c;

new_obstacle=[];
new_free=[];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
F1_obstacle_cover=[];
for i=floor(F1.x)-floor(robot_size/2/accuracy)+floor(robot_size/2/accuracy):1:ceil(F1.x+5.4*10/accuracy)+floor(robot_size/2/accuracy)
    if i<1||i>xmax
        continue;
    end
    F1_obstacle_cover=[F1_obstacle_cover;
                       i,floor(F1.y)-floor(robot_size/2/accuracy)];
%     F1_obstacle_cover=[F1_obstacle_cover;
%                        i,ceil(F1.y+4.8*10/accuracy)+floor(robot_size/2/accuracy)];
end
for j=floor(F1.y)-floor(robot_size/2/accuracy)+1:1:ceil(F1.y+4.8*10/accuracy)+floor(robot_size/2/accuracy)-floor(robot_size/2/accuracy)-1
    if j<1||j>ymax
        continue;
    end
%     F1_obstacle_cover=[F1_obstacle_cover;
%                        floor(F1.x)-floor(robot_size/2/accuracy),j];
    F1_obstacle_cover=[F1_obstacle_cover;
                       ceil(F1.x+5.4*10/accuracy)+floor(robot_size/2/accuracy),j];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
F2_obstacle_cover=[];
for i=floor(F2.x)-floor(robot_size/2/accuracy):1:ceil(F2.x+5.4*10/accuracy)+floor(robot_size/2/accuracy)
    if i<1||i>xmax
        continue;
    end
    F2_obstacle_cover=[F2_obstacle_cover;
                       i,ceil(F2.y)-floor(robot_size/2/accuracy)];
%     F2_obstacle_cover=[F2_obstacle_cover;
%                        i,ceil(F2.y+4.8*10/accuracy)+floor(robot_size/2/accuracy)];
end
for j=floor(F2.y)-floor(robot_size/2/accuracy)+1:1:ceil(F2.y+4.8*10/accuracy)+floor(robot_size/2/accuracy)-floor(robot_size/2/accuracy)-1
    if j<1||j>ymax
        continue;
    end
    F2_obstacle_cover=[F2_obstacle_cover;
                       floor(F2.x)-floor(robot_size/2/accuracy),j];
    F2_obstacle_cover=[F2_obstacle_cover;
                       ceil(F2.x+5.4*10/accuracy)+floor(robot_size/2/accuracy),j];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
F3_obstacle_cover=[];
for j=floor(F3.y)-floor(robot_size/2/accuracy)+floor(robot_size/2/accuracy)+1:1:ceil(F3.y+4.8*10/accuracy)+floor(robot_size/2/accuracy)-floor(robot_size/2/accuracy)
    if j<1||j>ymax
        continue;
    end
    F3_obstacle_cover=[F3_obstacle_cover;
                       floor(F3.x)-floor(robot_size/2/accuracy),j];
    F3_obstacle_cover=[F3_obstacle_cover;
                       ceil(F3.x+5.4*10/accuracy)+floor(robot_size/2/accuracy),j];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
F4_obstacle_cover=[];
for i=floor(F4.x)-floor(robot_size/2/accuracy):1:ceil(F4.x+5.4*10/accuracy)+floor(robot_size/2/accuracy)-floor(robot_size/2/accuracy)
    if i<1||i>xmax
        continue;
    end
%     F4_obstacle_cover=[F4_obstacle_cover;
%                        i,floor(F4.y)-floor(robot_size/2/accuracy)];
    F4_obstacle_cover=[F4_obstacle_cover;
                       i,ceil(F4.y+4.8*10/accuracy)+floor(robot_size/2/accuracy)];
end
for j=floor(F4.y)-floor(robot_size/2/accuracy)+floor(robot_size/2/accuracy)+1:1:ceil(F4.y+4.8*10/accuracy)+floor(robot_size/2/accuracy)-1
    if j<1||j>ymax
        continue;
    end
    F4_obstacle_cover=[F4_obstacle_cover;
                       floor(F4.x)-floor(robot_size/2/accuracy),j];
%     F4_obstacle_cover=[F4_obstacle_cover;
%                        ceil(F4.x+5.4*10/accuracy)+floor(robot_size/2/accuracy),j];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
F5_obstacle_cover=[];
for i=floor(F5.x)-floor(robot_size/2/accuracy):1:ceil(F5.x+5.4*10/accuracy)+floor(robot_size/2/accuracy)
    if i<1||i>xmax
        continue;
    end
%     F5_obstacle_cover=[F5_obstacle_cover;
%                        i,floor(F5.y)-floor(robot_size/2/accuracy)];
    F5_obstacle_cover=[F5_obstacle_cover;
                       i,floor(F5.y+4.8*10/accuracy)+floor(robot_size/2/accuracy)];
end
for j=floor(F5.y)-floor(robot_size/2/accuracy)+floor(robot_size/2/accuracy)+1:1:ceil(F5.y+4.8*10/accuracy)+floor(robot_size/2/accuracy)-1
    if j<1||j>ymax
        continue;
    end
    F5_obstacle_cover=[F5_obstacle_cover;
                       floor(F5.x)-floor(robot_size/2/accuracy),j];
    F5_obstacle_cover=[F5_obstacle_cover;
                       ceil(F5.x+5.4*10/accuracy)+floor(robot_size/2/accuracy),j];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
F6_obstacle_cover=[];
for j=floor(F6.y)-floor(robot_size/2/accuracy)+floor(robot_size/2/accuracy):1:ceil(F6.y+4.8*10/accuracy)+floor(robot_size/2/accuracy)-floor(robot_size/2/accuracy)-1
    if j<1||j>ymax
        continue;
    end
    F6_obstacle_cover=[F6_obstacle_cover;
                       floor(F6.x)-floor(robot_size/2/accuracy),j];
    F6_obstacle_cover=[F6_obstacle_cover;
                       ceil(F6.x+5.4*10/accuracy)+floor(robot_size/2/accuracy),j];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if all(side=='R')
    if (F1.last_name=="��ֹ�����"||F1.last_name=="��ֹ�ƶ���"||F1.last_name=="������Ѫ��") && (F1.name~="��ֹ�����"&&F1.name~="��ֹ�ƶ���"&&F1.name~="������Ѫ��")
        new_free=[new_free
                  F1_obstacle_cover];
    end
    if (F1.last_name~="��ֹ�����"&&F1.last_name~="��ֹ�ƶ���"&&F1.last_name~="������Ѫ��") && (F1.name=="��ֹ�����"||F1.name=="��ֹ�ƶ���"||F1.name=="������Ѫ��")
        new_obstacle=[new_obstacle
                        F1_obstacle_cover];
    end
    
    if (F2.last_name=="��ֹ�����"||F2.last_name=="��ֹ�ƶ���"||F2.last_name=="������Ѫ��") && (F2.name~="��ֹ�����"&&F2.name~="��ֹ�ƶ���"&&F2.name~="������Ѫ��")
        new_free=[new_free
                  F2_obstacle_cover];
    end
    if (F2.last_name~="��ֹ�����"&&F2.last_name~="��ֹ�ƶ���"&&F2.last_name~="������Ѫ��") && (F2.name=="��ֹ�����"||F2.name=="��ֹ�ƶ���"||F2.name=="������Ѫ��")
        new_obstacle=[new_obstacle
                        F2_obstacle_cover];
    end
    
    if (F3.last_name=="��ֹ�����"||F3.last_name=="��ֹ�ƶ���"||F3.last_name=="������Ѫ��") && (F3.name~="��ֹ�����"&&F3.name~="��ֹ�ƶ���"&&F3.name~="������Ѫ��")
        new_free=[new_free
                  F3_obstacle_cover];
    end
    if (F3.last_name~="��ֹ�����"&&F3.last_name~="��ֹ�ƶ���"&&F3.last_name~="������Ѫ��") && (F3.name=="��ֹ�����"||F3.name=="��ֹ�ƶ���"||F3.name=="������Ѫ��")
        new_obstacle=[new_obstacle
                        F3_obstacle_cover];
    end
    
    if (F4.last_name=="��ֹ�����"||F4.last_name=="��ֹ�ƶ���"||F4.last_name=="������Ѫ��") && (F4.name~="��ֹ�����"&&F4.name~="��ֹ�ƶ���"&&F4.name~="������Ѫ��")
        new_free=[new_free
                  F4_obstacle_cover];
    end
    if (F4.last_name~="��ֹ�����"&&F4.last_name~="��ֹ�ƶ���"&&F4.last_name~="������Ѫ��") && (F4.name=="��ֹ�����"||F4.name=="��ֹ�ƶ���"||F4.name=="������Ѫ��")
        new_obstacle=[new_obstacle
                        F4_obstacle_cover];
    end
    
    if (F5.last_name=="��ֹ�����"||F5.last_name=="��ֹ�ƶ���"||F5.last_name=="������Ѫ��") && (F5.name~="��ֹ�����"&&F5.name~="��ֹ�ƶ���"&&F5.name~="������Ѫ��")
        new_free=[new_free
                  F5_obstacle_cover];
    end
    if (F5.last_name~="��ֹ�����"&&F5.last_name~="��ֹ�ƶ���"&&F5.last_name~="������Ѫ��") && (F5.name=="��ֹ�����"||F5.name=="��ֹ�ƶ���"||F5.name=="������Ѫ��")
        new_obstacle=[new_obstacle
                        F5_obstacle_cover];
    end
    
    if (F6.last_name=="��ֹ�����"||F6.last_name=="��ֹ�ƶ���"||F6.last_name=="������Ѫ��") && (F6.name~="��ֹ�����"&&F6.name~="��ֹ�ƶ���"&&F6.name~="������Ѫ��")
        new_free=[new_free
                  F6_obstacle_cover];
    end
    if (F6.last_name~="��ֹ�����"&&F6.last_name~="��ֹ�ƶ���"&&F6.last_name~="������Ѫ��") && (F6.name=="��ֹ�����"||F6.name=="��ֹ�ƶ���"||F6.name=="������Ѫ��")
        new_obstacle=[new_obstacle
                        F6_obstacle_cover];
    end
elseif (side=='B')
    if (F1.last_name=="��ֹ�����"||F1.last_name=="��ֹ�ƶ���"||F1.last_name=="�췽��Ѫ��") && (F1.name~="��ֹ�����"&&F1.name~="��ֹ�ƶ���"&&F1.name~="�췽��Ѫ��")
        new_free=[new_free
                  F1_obstacle_cover];
    end
    if (F1.last_name~="��ֹ�����"&&F1.last_name~="��ֹ�ƶ���"&&F1.last_name~="�췽��Ѫ��") && (F1.name=="��ֹ�����"||F1.name=="��ֹ�ƶ���"||F1.name=="�췽��Ѫ��")
        new_obstacle=[new_obstacle
                        F1_obstacle_cover];
    end
    
    if (F2.last_name=="��ֹ�����"||F2.last_name=="��ֹ�ƶ���"||F2.last_name=="�췽��Ѫ��") && (F2.name~="��ֹ�����"&&F2.name~="��ֹ�ƶ���"&&F2.name~="�췽��Ѫ��")
        new_free=[new_free
                  F2_obstacle_cover];
    end
    if (F2.last_name~="��ֹ�����"&&F2.last_name~="��ֹ�ƶ���"&&F2.last_name~="�췽��Ѫ��") && (F2.name=="��ֹ�����"||F2.name=="��ֹ�ƶ���"||F2.name=="�췽��Ѫ��")
        new_obstacle=[new_obstacle
                        F2_obstacle_cover];
    end
    
    if (F3.last_name=="��ֹ�����"||F3.last_name=="��ֹ�ƶ���"||F3.last_name=="�췽��Ѫ��") && (F3.name~="��ֹ�����"&&F3.name~="��ֹ�ƶ���"&&F3.name~="�췽��Ѫ��")
        new_free=[new_free
                  F3_obstacle_cover];
    end
    if (F3.last_name~="��ֹ�����"&&F3.last_name~="��ֹ�ƶ���"&&F3.last_name~="�췽��Ѫ��") && (F3.name=="��ֹ�����"||F3.name=="��ֹ�ƶ���"||F3.name=="�췽��Ѫ��")
        new_obstacle=[new_obstacle
                        F3_obstacle_cover];
    end
    
    if (F4.last_name=="��ֹ�����"||F4.last_name=="��ֹ�ƶ���"||F4.last_name=="�췽��Ѫ��") && (F4.name~="��ֹ�����"&&F4.name~="��ֹ�ƶ���"&&F4.name~="�췽��Ѫ��")
        new_free=[new_free
                  F4_obstacle_cover];
    end
    if (F4.last_name~="��ֹ�����"&&F4.last_name~="��ֹ�ƶ���"&&F4.last_name~="�췽��Ѫ��") && (F4.name=="��ֹ�����"||F4.name=="��ֹ�ƶ���"||F4.name=="�췽��Ѫ��")
        new_obstacle=[new_obstacle
                        F4_obstacle_cover];
    end
    
    if (F5.last_name=="��ֹ�����"||F5.last_name=="��ֹ�ƶ���"||F5.last_name=="�췽��Ѫ��") && (F5.name~="��ֹ�����"&&F5.name~="��ֹ�ƶ���"&&F5.name~="�췽��Ѫ��")
        new_free=[new_free
                  F5_obstacle_cover];
    end
    if (F5.last_name~="��ֹ�����"&&F5.last_name~="��ֹ�ƶ���"&&F5.last_name~="�췽��Ѫ��") && (F5.name=="��ֹ�����"||F5.name=="��ֹ�ƶ���"||F5.name=="�췽��Ѫ��")
        new_obstacle=[new_obstacle
                        F5_obstacle_cover];
    end
    
    if (F6.last_name=="��ֹ�����"||F6.last_name=="��ֹ�ƶ���"||F6.last_name=="�췽��Ѫ��") && (F6.name~="��ֹ�����"&&F6.name~="��ֹ�ƶ���"&&F6.name~="�췽��Ѫ��")
        new_free=[new_free
                  F6_obstacle_cover];
    end
    if (F6.last_name~="��ֹ�����"&&F6.last_name~="��ֹ�ƶ���"&&F6.last_name~="�췽��Ѫ��") && (F6.name=="��ֹ�����"||F6.name=="��ֹ�ƶ���"||F6.name=="�췽��Ѫ��")
        new_obstacle=[new_obstacle
                        F6_obstacle_cover];
    end
end


%���� cover ��cost
for i=1:1:size(new_obstacle,1)
    c(new_obstacle(i,1),new_obstacle(i,2))=Inf;
end
for i=1:1:size(new_free,1)
    c(new_free(i,1),new_free(i,2))=0;
end
updated_region=[new_obstacle ones(size(new_obstacle,1),1)
               new_free zeros(size(new_free,1),1)];
end