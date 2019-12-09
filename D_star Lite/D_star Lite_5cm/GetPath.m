function path=GetPath(close_list)
%Path plotting
j = size(close_list,1);
path=[];
while(j > 0)
    x = close_list(j,1);
    y = close_list(j,2);
    j = close_list(j,5);
    path = [x,y;
            path];
end
end