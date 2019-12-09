function obstacle=GetObstacle()
obstacle=[];
%%%%
for i=4:1:11
    obstacle=[obstacle;
        i,11];
end
for i=4:1:11
    obstacle=[obstacle;
        11,i];
end
%%%%
for i=0+1:1:10+1
    for j=38+1:1:41+1
        obstacle=[obstacle;
            i,j];
    end
end
for i=15+1:1:18+1
    for j=0+1:1:10+1
        obstacle=[obstacle;
            i,j];
    end
end
for i=15+1:1:23+1
    for j=24+1:1:27+1
        obstacle=[obstacle;
            i,j];
    end
end
for i=35+1:1:45+1
    for j=38+1:1:41+1
        obstacle=[obstacle;
            i,j];
    end
end
for i=36+1:1:46+1
    for j=10+1:1:13+1
        obstacle=[obstacle;
            i,j];
    end
end
obstacle=[obstacle
    38+1 26+1
    39+1 26+1
    40+1 27+1
    40+1 28+1
    39+1 27+1
    38+1 25+1
    41+1 27+1
    41+1 28+1
    42+1 26+1
    42+1 27+1
    43+1 26+1
    43+1 25+1
    42+1 25+1
    40+1 26+1
    41+1 26+1
    39+1 25+1
    40+1 25+1
    41+1 25+1
    39+1 24+1
    40+1 24+1
    41+1 24+1
    42+1 24+1
    40+1 23+1
    41+1 23+1];
for i=58+1:1:66+1
    for j=24+1:1:27+1
        obstacle=[obstacle;
            i,j];
    end
end
for i=71+1:1:81+1
    for j=10+1:1:13+1
        obstacle=[obstacle;
            i,j];
    end
end
for i=63+1:1:66+1
    for j=41+1:1:51+1
        obstacle=[obstacle;
            i,j];
    end
end
end