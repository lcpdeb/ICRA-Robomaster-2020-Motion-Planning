function UpdateRegion(RedRegenerate, RedSupply, BlueRegenerate, BlueSupply, ShootFree, MoveFree)
global side;
global obstacle;
global accuracy;
global cover;
global robot_size;
global xmax;
global ymax;
RedRegenerate_obstacle=[];
for i=floor(RedRegenerate.x):1:ceil(RedRegenerate.x+5.4*10/accuracy)
    for j=floor(RedRegenerate.y):1:ceil(RedRegenerate.y+4.8*10/accuracy)
        RedRegenerate_obstacle=[RedRegenerate_obstacle;
                                i,j];
    end
end

RedRegenerate_obstacle_cover=[];
for i=floor(RedRegenerate.x)-floor(robot_size/2/accuracy):1:ceil(RedRegenerate.x+5.4*10/accuracy)+floor(robot_size/2/accuracy)
    for j=floor(RedRegenerate.y)-floor(robot_size/2/accuracy):1:ceil(RedRegenerate.y+4.8*10/accuracy)+floor(robot_size/2/accuracy)
        if i<1||i>xmax||j<1||j>ymax
            continue;
        end
        RedRegenerate_obstacle_cover=[RedRegenerate_obstacle_cover;
                                       i,j];
    end
end

ShootFree_obstacle=[];
for i=floor(ShootFree.x):1:ceil(ShootFree.x+5.4*10/accuracy)
    for j=floor(ShootFree.y):1:ceil(ShootFree.y+4.8*10/accuracy)
        ShootFree_obstacle=[ShootFree_obstacle;
                            i,j];
    end
end
ShootFree_obstacle_cover=[];
for i=floor(ShootFree.x)-floor(robot_size/2/accuracy):1:ceil(ShootFree.x+5.4*10/accuracy)+floor(robot_size/2/accuracy)
    for j=floor(ShootFree.y)-floor(robot_size/2/accuracy):1:ceil(ShootFree.y+4.8*10/accuracy)+floor(robot_size/2/accuracy)
        if i<1||i>xmax||j<1||j>ymax
            continue;
        end
        ShootFree_obstacle_cover=[ShootFree_obstacle_cover;
                                  i,j];
    end
end


BlueRegenerate_obstacle=[];
for i=floor(BlueRegenerate.x):1:ceil(BlueRegenerate.x+5.4*10/accuracy)
    for j=floor(BlueRegenerate.y):1:ceil(BlueRegenerate.y+4.8*10/accuracy)
        BlueRegenerate_obstacle=[BlueRegenerate_obstacle;
                                 i,j];
    end
end

BlueRegenerate_obstacle_cover=[];
for i=floor(BlueRegenerate.x)-floor(robot_size/2/accuracy):1:ceil(BlueRegenerate.x+5.4*10/accuracy)+floor(robot_size/2/accuracy)
    for j=floor(BlueRegenerate.y)-floor(robot_size/2/accuracy):1:ceil(BlueRegenerate.y+4.8*10/accuracy)+floor(robot_size/2/accuracy)
        if i<1||i>xmax||j<1||j>ymax
            continue;
        end
        BlueRegenerate_obstacle_cover=[BlueRegenerate_obstacle_cover;
                                       i,j];
    end
end

MoveFree_obstacle=[];
for i=floor(MoveFree.x):1:ceil(MoveFree.x+5.4*10/accuracy)
    for j=floor(MoveFree.y):1:ceil(MoveFree.y+4.8*10/accuracy)
        MoveFree_obstacle=[MoveFree_obstacle;
                            i,j];
    end
end
MoveFree_obstacle_cover=[];
for i=floor(MoveFree.x)-floor(robot_size/2/accuracy):1:ceil(MoveFree.x+5.4*10/accuracy)+floor(robot_size/2/accuracy)
    for j=floor(MoveFree.y)-floor(robot_size/2/accuracy):1:ceil(MoveFree.y+4.8*10/accuracy)+floor(robot_size/2/accuracy)
        if i<1||i>xmax||j<1||j>ymax
            continue;
        end
        MoveFree_obstacle_cover=[MoveFree_obstacle_cover;
                                i,j];
    end
end
obstacle=[obstacle;
          MoveFree_obstacle
          ShootFree_obstacle];
      
cover=[cover
       MoveFree_obstacle_cover
       ShootFree_obstacle_cover];
   
if all(side=='R')
    obstacle=[obstacle;
          BlueRegenerate_obstacle];
    cover=[cover
           BlueRegenerate_obstacle_cover];
elseif all(side=='B')
    obstacle=[obstacle;
          RedRegenerate_obstacle];
    cover=[cover
           RedRegenerate_obstacle_cover];
end
end