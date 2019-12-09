function flag=over_border(s)%判断坐标是否越界,输入参数（待判断坐标）
    global xmax;
    global ymax;
    if s(1)<1||s(1)>xmax||s(2)<1||s(2)>ymax%越界返回0
        flag=0;
    else 
        flag=1;
    end
end