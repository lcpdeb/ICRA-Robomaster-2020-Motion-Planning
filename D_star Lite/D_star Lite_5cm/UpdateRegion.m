function UpdateRegion(RedRegenerate, RedSupply, BlueRegenerate, BlueSupply, ShootFree, MoveFree)
global side;
global obstacle;

RedRegenerate_obstacle=[];
for i=round(RedRegenerate.x):1:round(RedRegenerate.x+5.4)
    for j=round(RedRegenerate.y):1:round(RedRegenerate.y+4.8)
        RedRegenerate_obstacle=[RedRegenerate_obstacle;
                                i,j];
    end
end

ShootFree_obstacle=[];
for i=round(ShootFree.x):1:round(ShootFree.x+5.4)
    for j=round(ShootFree.y):1:round(ShootFree.y+4.8)
        ShootFree_obstacle=[ShootFree_obstacle;
                            i,j];
    end
end

BlueRegenerate_obstacle=[];
for i=round(BlueRegenerate.x):1:round(BlueRegenerate.x+5.4)
    for j=round(BlueRegenerate.y):1:round(BlueRegenerate.y+4.8)
        BlueRegenerate_obstacle=[BlueRegenerate_obstacle;
                                 i,j];
    end
end

MoveFree_obstacle=[];
for i=round(MoveFree.x):1:round(MoveFree.x+5.4)
    for j=round(MoveFree.y):1:round(MoveFree.y+4.8)
        MoveFree_obstacle=[MoveFree_obstacle;
                            i,j];
    end
end
obstacle=[obstacle;
          MoveFree_obstacle
          ShootFree_obstacle];

if all(side=='R')
    obstacle=[obstacle;
          BlueRegenerate_obstacle];
elseif all(side=='B')
    obstacle=[obstacle;
          RedRegenerate_obstacle];
end
end