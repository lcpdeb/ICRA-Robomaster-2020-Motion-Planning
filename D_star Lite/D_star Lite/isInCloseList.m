function [flag,i]=isInCloseList(m,close)
flag=0;
i=0;
    if ~isempty(close)
        % search all the point in the CLOSE LIST
        for i=1:length(close(:,1))
            if isSamePosition(close(i,1:2),m(1:2))
                flag=1;
                return
            end
        end
    end
end