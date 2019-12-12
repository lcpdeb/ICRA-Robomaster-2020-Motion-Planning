function UpdateVertex(u)%更新节点信息
    global rhs;
    global g;
    global U;
    try
        [IsInFlag,index]=isInOpenList(u,U);
    catch
        IsInFlag=false;
    end
    if g(u(1),u(2))~=rhs(u(1),u(2)) && IsInFlag
        % U.Update
        [key(1),key(2)]=CalculateKey(u);
        U(index,3:4)=key;

    elseif g(u(1),u(2))~=rhs(u(1),u(2)) && ~IsInFlag
        [calculated_key(1),calculated_key(2)]=CalculateKey(u);
        U=[U
           u,calculated_key];
    elseif g(u(1),u(2))==rhs(u(1),u(2)) && IsInFlag
        U(index,:)=[];
    end
end