function boundary=GetBoundary()
global xmax;
global ymax;
boundary=[];

for i1=0:(ymax+1)
    boundary=[boundary;[0 i1]]; % The top side of the map, the first row in the matrix
end
for i2=1:(xmax+1)
    boundary=[boundary;[i2 0]]; % The left side of the map, the first column in matrix
end
for i3=1:(ymax+1)
    boundary=[boundary;[xmax+1 i3]]; % The bottom side of the map, the last row in the matrix
end
for i4=1:(xmax)
    boundary=[boundary;[i4 ymax+1]]; % The right side of the map, the last column in the matrix
end
end


