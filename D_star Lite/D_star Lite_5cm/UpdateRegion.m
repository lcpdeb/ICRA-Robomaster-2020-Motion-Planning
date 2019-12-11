function UpdateRegion(F1, F2, F3, F4, F5, F6)
global side;
global obstacle;
global accuracy;
global cover;
global robot_size;
global xmax;
global ymax;
global c;

cover=[];%清空cover
% 
% F1_obstacle=[];
% for i=floor(F1.x):1:ceil(F1.x+5.4*10/accuracy)
%     for j=floor(F1.y):1:ceil(F1.y+4.8*10/accuracy)
%         F1_obstacle=[F1_obstacle;
%                                 i,j];
%     end
% end

F1_obstacle_cover=[];
for i=floor(F1.x)-floor(robot_size/2/accuracy):1:ceil(F1.x+5.4*10/accuracy)+floor(robot_size/2/accuracy)
    for j=floor(F1.y)-floor(robot_size/2/accuracy):1:ceil(F1.y+4.8*10/accuracy)+floor(robot_size/2/accuracy)
        if i<1||i>xmax||j<1||j>ymax
            continue;
        end
        F1_obstacle_cover=[F1_obstacle_cover;
                                       i,j];
    end
end

% F2_obstacle=[];
% for i=floor(F2.x):1:ceil(F2.x+5.4*10/accuracy)
%     for j=floor(F2.y):1:ceil(F2.y+4.8*10/accuracy)
%         F2_obstacle=[F2_obstacle;
%                             i,j];
%     end
% end

F2_obstacle_cover=[];
for i=floor(F2.x)-floor(robot_size/2/accuracy):1:ceil(F2.x+5.4*10/accuracy)+floor(robot_size/2/accuracy)
    for j=floor(F2.y)-floor(robot_size/2/accuracy):1:ceil(F2.y+4.8*10/accuracy)+floor(robot_size/2/accuracy)
        if i<1||i>xmax||j<1||j>ymax
            continue;
        end
        F2_obstacle_cover=[F2_obstacle_cover;
                                  i,j];
    end
end


% F3_obstacle=[];
% for i=floor(F3.x):1:ceil(F3.x+5.4*10/accuracy)
%     for j=floor(F3.y):1:ceil(F3.y+4.8*10/accuracy)
%         F3_obstacle=[F3_obstacle;
%                                  i,j];
%     end
% end

F3_obstacle_cover=[];
for i=floor(F3.x)-floor(robot_size/2/accuracy):1:ceil(F3.x+5.4*10/accuracy)+floor(robot_size/2/accuracy)
    for j=floor(F3.y)-floor(robot_size/2/accuracy):1:ceil(F3.y+4.8*10/accuracy)+floor(robot_size/2/accuracy)
        if i<1||i>xmax||j<1||j>ymax
            continue;
        end
        F3_obstacle_cover=[F3_obstacle_cover;
                                       i,j];
    end
end

% F4_obstacle=[];
% for i=floor(F4.x):1:ceil(F4.x+5.4*10/accuracy)
%     for j=floor(F4.y):1:ceil(F4.y+4.8*10/accuracy)
%         F4_obstacle=[F4_obstacle;
%                      i,j];
%     end
% end

F4_obstacle_cover=[];
for i=floor(F4.x)-floor(robot_size/2/accuracy):1:ceil(F4.x+5.4*10/accuracy)+floor(robot_size/2/accuracy)
    for j=floor(F4.y)-floor(robot_size/2/accuracy):1:ceil(F4.y+4.8*10/accuracy)+floor(robot_size/2/accuracy)
        if i<1||i>xmax||j<1||j>ymax
            continue;
        end
        F4_obstacle_cover=[F4_obstacle_cover;
                           i,j];
    end
end

% F5_obstacle=[];
% for i=floor(F5.x):1:ceil(F5.x+5.4*10/accuracy)
%     for j=floor(F5.y):1:ceil(F5.y+4.8*10/accuracy)
%         F5_obstacle=[F5_obstacle;
%                      i,j];
%     end
% end

F5_obstacle_cover=[];
for i=floor(F5.x)-floor(robot_size/2/accuracy):1:ceil(F5.x+5.4*10/accuracy)+floor(robot_size/2/accuracy)
    for j=floor(F5.y)-floor(robot_size/2/accuracy):1:ceil(F5.y+4.8*10/accuracy)+floor(robot_size/2/accuracy)
        if i<1||i>xmax||j<1||j>ymax
            continue;
        end
        F5_obstacle_cover=[F5_obstacle_cover;
                           i,j];
    end
end

% F6_obstacle=[];
% for i=floor(F6.x):1:ceil(F6.x+5.4*10/accuracy)
%     for j=floor(F6.y):1:ceil(F6.y+4.8*10/accuracy)
%         F6_obstacle=[F6_obstacle;
%                             i,j];
%     end
% end

F6_obstacle_cover=[];
for i=floor(F6.x)-floor(robot_size/2/accuracy):1:ceil(F6.x+5.4*10/accuracy)+floor(robot_size/2/accuracy)
    for j=floor(F6.y)-floor(robot_size/2/accuracy):1:ceil(F6.y+4.8*10/accuracy)+floor(robot_size/2/accuracy)
        if i<1||i>xmax||j<1||j>ymax
            continue;
        end
        F6_obstacle_cover=[F6_obstacle_cover;
                                i,j];
    end
end

if all(F1.name=='禁止射击区')||all(F1.name=='禁止移动区')
%     obstacle=[obstacle;
%               F1_obstacle];
    cover=[cover;
           F1_obstacle_cover];
end
if all(F2.name=='禁止射击区')||all(F2.name=='禁止移动区')
%     obstacle=[obstacle;
%               F2_obstacle];
    cover=[cover;
           F2_obstacle_cover];
end
if all(F3.name=='禁止射击区')||all(F3.name=='禁止移动区')
%     obstacle=[obstacle;
%               F3_obstacle];
    cover=[cover;
           F3_obstacle_cover];
end
if all(F4.name=='禁止射击区')||all(F4.name=='禁止移动区')
%     obstacle=[obstacle;
%               F4_obstacle];
    cover=[cover;
           F4_obstacle_cover];
end
if all(F5.name=='禁止射击区')||all(F5.name=='禁止移动区')
%     obstacle=[obstacle;
%               F5_obstacle];
    cover=[cover;
           F5_obstacle_cover];
end
if all(F6.name=='禁止射击区')||all(F6.name=='禁止移动区')
%     obstacle=[obstacle;
%               F6_obstacle];
    cover=[cover;
           F6_obstacle_cover];
end

if all(F1.name=='红方回血区')&& all(side=='B')
%     obstacle=[obstacle;
%               F1_obstacle];
    cover=[cover;
           F1_obstacle_cover];
end
if all(F2.name=='红方回血区')&& all(side=='B')
%     obstacle=[obstacle;
%               F2_obstacle];
    cover=[cover;
           F2_obstacle_cover];
end
if all(F3.name=='红方回血区')&& all(side=='B')
%     obstacle=[obstacle;
%               F3_obstacle];
    cover=[cover;
           F3_obstacle_cover];
end
if all(F4.name=='红方回血区')&& all(side=='B')
%     obstacle=[obstacle;
%               F4_obstacle];
    cover=[cover;
           F4_obstacle_cover];
end
if all(F5.name=='红方回血区')&& all(side=='B')
%     obstacle=[obstacle;
%               F5_obstacle];
    cover=[cover;
           F5_obstacle_cover];
end
if all(F6.name=='红方回血区')&& all(side=='B')
%     obstacle=[obstacle;
%               F6_obstacle];
    cover=[cover;
           F6_obstacle_cover];
end



if all(F1.name=='蓝方回血区')&& all(side=='R')
%     obstacle=[obstacle;
%               F1_obstacle];
    cover=[cover;
           F1_obstacle_cover];
end
if all(F2.name=='蓝方回血区')&& all(side=='R')
%     obstacle=[obstacle;
%               F2_obstacle];
    cover=[cover;
           F2_obstacle_cover];
end
if all(F3.name=='蓝方回血区')&& all(side=='R')
%     obstacle=[obstacle;
%               F3_obstacle];
    cover=[cover;
           F3_obstacle_cover];
end
if all(F4.name=='蓝方回血区')&& all(side=='R')
%     obstacle=[obstacle;
%               F4_obstacle];
    cover=[cover;
           F4_obstacle_cover];
end
if all(F5.name=='蓝方回血区')&& all(side=='R')
%     obstacle=[obstacle;
%               F5_obstacle];
    cover=[cover;
           F5_obstacle_cover];
end
if all(F6.name=='蓝方回血区')&& all(side=='R')
%     obstacle=[obstacle;
%               F6_obstacle];
    cover=[cover;
           F6_obstacle_cover];
end
%清空并更新obstacle 和 cover 的cost
c(1:xmax,1:ymax)=0;
for i=1:1:size(cover,1)
    c(cover(i,1),cover(i,2))=Inf;
end
end