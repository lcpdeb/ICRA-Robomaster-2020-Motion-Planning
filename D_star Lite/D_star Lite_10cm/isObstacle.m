function [flag,index]=isObstacle(m,obstacle)
    for index=1:length(obstacle(:,1))
        if isSamePosition(obstacle(index,:),m(1:2))
            flag=true;
            return;
        end
    end
    flag=false;
end