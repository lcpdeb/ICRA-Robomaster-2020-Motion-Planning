function flag=over_border(s)%�ж������Ƿ�Խ��,������������ж����꣩
    global xmax;
    global ymax;
    if s(1)<1||s(1)>xmax||s(2)<1||s(2)>ymax%Խ�緵��0
        flag=0;
    else 
        flag=1;
    end
end