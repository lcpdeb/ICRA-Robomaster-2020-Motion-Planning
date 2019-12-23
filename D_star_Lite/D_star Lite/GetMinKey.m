function [minKey_1,minKey_2,minKeyIndex]=GetMinKey(list)
if size(list)
    temp_list=Inf*ones(size(list));
    minPrimaryKey=min(list(:,3));
    temp_index=ismember(list(:,3),minPrimaryKey);
    temp_list(temp_index,:)=list(temp_index,:);
    [minSecondaryKey,minSecondaryIndex]=min(temp_list(:,4));
    
    minKey_1=minPrimaryKey;
    minKey_2=minSecondaryKey;
    minKeyIndex=minSecondaryIndex;
else
    minKey_1=Inf;
    minKey_2=Inf;
    minKeyIndex=Inf;
end
end