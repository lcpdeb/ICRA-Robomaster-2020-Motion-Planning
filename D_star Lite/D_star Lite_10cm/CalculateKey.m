function [PrimaryKey,SecondaryKey]=CalculateKey(s)%计算节点key值,参数（当前节点）,返回该节点key值
    global k_m;
    global g;
    global rhs;
    global key;
    global s_start;

    h=norm(s_start-s(1:2));
    SecondaryKey=min(   g(s(1),s(2)),     rhs(s(1),s(2))  );
    PrimaryKey=SecondaryKey+h+k_m;
    key(s(1),s(2)).PrimaryKey=PrimaryKey;
    key(s(1),s(2)).SecondaryKey=SecondaryKey;
end