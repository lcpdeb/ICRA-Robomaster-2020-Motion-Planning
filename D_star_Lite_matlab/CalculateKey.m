function [PrimaryKey,SecondaryKey]=CalculateKey(s)%����ڵ�keyֵ,��������ǰ�ڵ㣩,���ظýڵ�keyֵ
    global k_m;
    global g;
    global rhs;
    global s_start;

    h=norm(s_start-s(1:2));
    SecondaryKey=min(   g(s(1),s(2)),     rhs(s(1),s(2))  );
    PrimaryKey=SecondaryKey+0.99*h+k_m;
end