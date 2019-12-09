function UpdateVertex(u)%更新节点信息
    global rhs;
    global g;
    global U;
    global close_list;
%     rhs_cal(s);
%     for i=1:size(U,1)
%         if isSamePosition(s,U(i,:))%如果s节点在U中，将其移出
%             U(i,:)=[];
%             close_list=[close_list
%                         s(1:2) 0 0 size(close_list,1)];
%             break;
%         end
%     end
%     if g(s(1),s(2))~=rhs(s(1),s(2))%如果s节点局部不一致（g和rhs不等），将该节点和其key值插入到U中
%         [key(1),key(2)]=CalculateKey(s);
%         U=[U;
%            s(1:2),key,size(close_list,1)];
%     end
    try
        [IsInFlag,index]=isInOpenList(u,U);
    catch
        IsInFlag=false;
    end
    if g(u(1),u(2))~=rhs(u(1),u(2)) && IsInFlag
        % U.Update
        [key(1),key(2)]=CalculateKey(u);
        U(index,3:4)=key;
        U(index,5)=size(close_list,1);
    elseif g(u(1),u(2))~=rhs(u(1),u(2)) && ~IsInFlag
        [calculated_key(1),calculated_key(2)]=CalculateKey(u);
        U=[U
           u,calculated_key,size(close_list,1)];
    elseif g(u(1),u(2))==rhs(u(1),u(2)) && IsInFlag
        U(index,:)=[];
    end
end