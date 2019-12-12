function [flag,i]=isInOpenList(m,open)
flag=0;
    if ~isempty(open)
        % search all the point in the OPEN LIST
        for i=1:length(open(:,1))
            if isSamePosition(open(i,1:2),m(1:2))
                flag=1;
                return
            end
        end
    end
end