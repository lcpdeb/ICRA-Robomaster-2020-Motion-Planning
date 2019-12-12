function obstacle=GetObstacle()
global accuracy;
obstacle=[];
for i=floor(0*10/accuracy)+1:1:ceil(10*10/accuracy)+1
    for j=floor(38.5*10/accuracy)+1:1:ceil(41*10/accuracy)+1
        obstacle=[obstacle;
            i,j];
    end
end
for i=floor(15*10/accuracy)+1:1:ceil(17.5*10/accuracy)+1
    for j=floor(0*10/accuracy)+1:1:ceil(10*10/accuracy)+1
        obstacle=[obstacle;
            i,j];
    end
end
for i=floor(15*10/accuracy)+1:1:ceil(23*10/accuracy)+1
    for j=floor(24.25*10/accuracy)+1:1:ceil((24.25+2.5)*10/accuracy)+1
        obstacle=[obstacle;
            i,j];
    end
end
for i=floor(35*10/accuracy)+1:1:ceil(45*10/accuracy)+1
    for j=floor(38.5*10/accuracy)+1:1:ceil(41*10/accuracy)+1
        obstacle=[obstacle;
            i,j];
    end
end
for i=floor(36*10/accuracy)+1:1:ceil(46*10/accuracy)+1
    for j=floor(10*10/accuracy)+1:1:ceil(12.5*10/accuracy)+1
        obstacle=[obstacle;
            i,j];
    end
end
%%% center obstacle
for k=0:1:ceil(3*sqrt(2)/2*10/accuracy)
    for i=floor((40.5-3*sqrt(2)/2)*10/accuracy)+k+1:1:ceil((40.5+3*sqrt(2)/2)*10/accuracy)-k+1
       obstacle=[obstacle
                i,ceil(25.5*10/accuracy)+k+1];
    end
end
for k=floor(-3*sqrt(2)/2*10/accuracy):1:0
    for i=floor((40.5-3*sqrt(2)/2)*10/accuracy)-k+1:1:ceil((40.5+3*sqrt(2)/2)*10/accuracy)+k+1
       obstacle=[obstacle
                i,floor(25.5*10/accuracy)+k+1];
    end
end
%%% center obstacle
for i=floor(58*10/accuracy)+1:1:ceil(66*10/accuracy)+1
    for j=floor(24.25*10/accuracy)+1:1:ceil((24.25+2.5)*10/accuracy)+1
        obstacle=[obstacle;
            i,j];
    end
end
for i=floor(71*10/accuracy)+1:1:ceil(81*10/accuracy)+1
    for j=floor(10*10/accuracy)+1:1:ceil(12.5*10/accuracy)+1
        obstacle=[obstacle;
            i,j];
    end
end
for i=floor(63.5*10/accuracy)+1:1:ceil(66*10/accuracy)+1
    for j=floor(41*10/accuracy)+1:1:ceil(51*10/accuracy)+1
        obstacle=[obstacle;
            i,j];
    end
end
end