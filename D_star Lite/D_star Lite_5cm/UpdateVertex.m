function UpdateVertex(u)%���½ڵ���Ϣ
    global rhs;
    global g;
    global U;
    global close_list;
%     rhs_cal(s);
%     for i=1:size(U,1)
%         if isSamePosition(s,U(i,:))%���s�ڵ���U�У������Ƴ�
%             U(i,:)=[];
%             close_list=[close_list
%                         s(1:2) 0 0 size(close_list,1)];
%             break;
%         end
%     end
%     if g(s(1),s(2))~=rhs(s(1),s(2))%���s�ڵ�ֲ���һ�£�g��rhs���ȣ������ýڵ����keyֵ���뵽U��
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