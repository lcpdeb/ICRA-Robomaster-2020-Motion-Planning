/* Include files */
#include "main.h"
#include "Initialize.h"
#include "rhs_cal.h"

/* Parameters Declarations */
static double cost_ssprime;

/* Matrix Declarations */
static RowVector2d min_rhs_point;
static RowVector2d s_prime;

/* Function Declarations */
//ȡs�ڵ��̽ڵ�����С��rhs��Ϊs�ڵ��rhsֵ
void rhs_cal(RowVectorXd s)
{
    //���ڶԱ��ҵ�min s'��Succ(u)(c(u,s') + g(s'))
    static int min_rhs = INF; 
    for (int i = 0; i < 8; i++)
    {
        s_prime << s(0) + neighbour(i, 0), s(1), neighbour(i, 1);
        //Խ������
        if (s_prime(0) < 1 || s_prime(0) > xmax || s_prime(1) < 1 || s_prime(1) > ymax)
        {
            continue;
        }
        //����ڵ�s����s'���ϰ��������
        if (c(s_prime(0), s_prime(1)) == INF || c(s(0), s(1)) == INF)
        {
            continue;
        }
        else
        {
            cost_ssprime = neighbour(i, 2);
        }
        if (min_rhs > (cost_ssprime + g(s_prime(1), s_prime(2))))
        {
            min_rhs = cost_ssprime + g(s_prime(1), s_prime(2));
        }
    }
    rhs(s(0), s(1)) = min_rhs;
    

}