% keyֵ�Ƚ�,<PrimaryKey�򷵻�1������Ƚ�<=SecondaryKey
function flag=CompareKey(key1,key2)
flag=0;
    if key1(1)<key2(1)
        flag=1;
        return
    elseif key1(1)==key2(1)
        if key1(2)<key2(2)
            flag=1;
            return
        end
    else 
        return
    end
end
