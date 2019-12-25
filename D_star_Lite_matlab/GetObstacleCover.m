function cover=GetObstacleCover()
global accuracy;
global xmax;
global ymax;
global robot_size;
cover=[];
for i=floor(0*10/accuracy)-floor(robot_size/2/accuracy)+1:1:ceil(10*10/accuracy)+floor(robot_size/2/accuracy)+1
    for j=floor(38.5*10/accuracy)-floor(robot_size/2/accuracy)+1:1:ceil(41*10/accuracy)+floor(robot_size/2/accuracy)+1
        if i<1||i>xmax||j<1||j>ymax
            continue;
        end
        cover=[cover;
            i,j];
    end
end

for i=floor(15*10/accuracy)-floor(robot_size/2/accuracy)+1:1:ceil(17.5*10/accuracy)+floor(robot_size/2/accuracy)+1
    for j=floor(0*10/accuracy)-floor(robot_size/2/accuracy)+1:1:ceil(10*10/accuracy)+floor(robot_size/2/accuracy)+1
        if i<1||i>xmax||j<1||j>ymax
            continue;
        end
        cover=[cover;
            i,j];
    end
end
for i=floor(15*10/accuracy)-floor(robot_size/2/accuracy)+1:1:ceil(23*10/accuracy)+floor(robot_size/2/accuracy)+1
    for j=floor(24.25*10/accuracy)-floor(robot_size/2/accuracy)+1:1:ceil((24.25+2.5)*10/accuracy)+floor(robot_size/2/accuracy)+1
        if i<1||i>xmax||j<1||j>ymax
            continue;
        end
        cover=[cover;
            i,j];
    end
end
for i=floor(35*10/accuracy)-floor(robot_size/2/accuracy)+1:1:ceil(45*10/accuracy)+floor(robot_size/2/accuracy)+1
    for j=floor(38.5*10/accuracy)-floor(robot_size/2/accuracy)+1:1:ceil(41*10/accuracy)+floor(robot_size/2/accuracy)+1
        if i<1||i>xmax||j<1||j>ymax
            continue;
        end
        cover=[cover;
            i,j];
    end
end
for i=floor(36*10/accuracy)-floor(robot_size/2/accuracy)+1:1:ceil(46*10/accuracy)+floor(robot_size/2/accuracy)+1
    for j=floor(10*10/accuracy)-floor(robot_size/2/accuracy)+1:1:ceil(12.5*10/accuracy)+floor(robot_size/2/accuracy)+1
        if i<1||i>xmax||j<1||j>ymax
            continue;
        end
        cover=[cover;
            i,j];
    end
end
for i=floor(58*10/accuracy)-floor(robot_size/2/accuracy)+1:1:ceil(66*10/accuracy)+floor(robot_size/2/accuracy)+1
    for j=floor(24.25*10/accuracy)-floor(robot_size/2/accuracy)+1:1:ceil((24.25+2.5)*10/accuracy)+floor(robot_size/2/accuracy)+1
        if i<1||i>xmax||j<1||j>ymax
            continue;
        end
        cover=[cover;
            i,j];
    end
end
for i=floor(71*10/accuracy)-floor(robot_size/2/accuracy)+1:1:ceil(81*10/accuracy)+floor(robot_size/2/accuracy)+1
    for j=floor(10*10/accuracy)-floor(robot_size/2/accuracy)+1:1:ceil(12.5*10/accuracy)+floor(robot_size/2/accuracy)+1
        if i<1||i>xmax||j<1||j>ymax
            continue;
        end
        cover=[cover;
            i,j];
    end
end
for i=floor(63.5*10/accuracy)-floor(robot_size/2/accuracy)+1:1:ceil(66*10/accuracy)+floor(robot_size/2/accuracy)+1
    for j=floor(41*10/accuracy)-floor(robot_size/2/accuracy)+1:1:ceil(51*10/accuracy)+floor(robot_size/2/accuracy)+1
        if i<1||i>xmax||j<1||j>ymax
            continue;
        end
        cover=[cover;
            i,j];
    end
end
%%% center obstacle cover
for k=0:1:ceil(3*sqrt(2)/2*10/accuracy)+floor(robot_size/2/accuracy)
    for i=floor((40.5-3*sqrt(2)/2)*10/accuracy)+k-floor(robot_size/2/accuracy)+1:1:ceil((40.5+3*sqrt(2)/2)*10/accuracy)-k+floor(robot_size/2/accuracy)+1
       cover=[cover
                i,ceil(25.5*10/accuracy)+k+1];
    end
end
for k=floor(-3*sqrt(2)/2*10/accuracy)-floor(robot_size/2/accuracy):1:0
    for i=floor((40.5-3*sqrt(2)/2)*10/accuracy)-k-floor(robot_size/2/accuracy)+1:1:ceil((40.5+3*sqrt(2)/2)*10/accuracy)+k+floor(robot_size/2/accuracy)+1
       cover=[cover
                i,floor(25.5*10/accuracy)+k+1];
    end
end
%%% center obstacle cover

for k=1:1:floor(robot_size/2/accuracy)
    for i1=0+k:(ymax+1-k)
        cover=[cover;[0+k i1]]; % The top side of the map, the first row in the matrix
    end
    for i2=1+k:(xmax+1-k)
        cover=[cover;[i2 0+k]]; % The left side of the map, the first column in matrix
    end
    for i3=1+k:(ymax+1-k)
        cover=[cover;[xmax+1-k i3]]; % The bottom side of the map, the last row in the matrix
    end
    for i4=1+k:(xmax+1-k)
        cover=[cover;[i4 ymax+1-k]]; % The right side of the map, the last column in the matrix
    end
end

end