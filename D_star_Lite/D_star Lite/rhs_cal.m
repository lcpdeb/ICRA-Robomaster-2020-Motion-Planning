function rhs_cal(s)%����ڵ�rhs
global neighbour;
global rhs;
global g;
global c;
global s_goal;
global xmax;
global ymax;
%ȡs�ڵ��̽ڵ�����С��rhs��Ϊs�ڵ��rhsֵ
min_rhs=Inf;%���ڶԱ��ҵ�min s'��Succ(u)(c(u,s')+g(s'))
for i=1:size(neighbour,1)
    s_prime=s(1:2)+neighbour(i,1:2);
    if s_prime(1)<1||s_prime(1)>xmax||s_prime(2)<1||s_prime(2)>ymax
        continue
    end
    if c(s_prime(1),s_prime(2))==Inf||c(s(1),s(2))==Inf%�õ����ϰ���
        continue
    else
        cost_ssprime=neighbour(i,3);%��ֵ���Լ����ʵ�ʾ���
    end
    if min_rhs>(cost_ssprime+g(s_prime(1),s_prime(2)))
        min_rhs=cost_ssprime+g(s_prime(1),s_prime(2));
    end
end
rhs(s(1),s(2))=min_rhs;
    
end