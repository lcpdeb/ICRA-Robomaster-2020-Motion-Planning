/* Include files */
#include "main.h"
#include "Initialize.h"
#include "rhs_cal.h"

/* Parameters Declarations */
static double cost_ssprime;
static double min_rhs;

/* Matrix Declarations */
static RowVector2i s_prime;

/* Function Declarations */
//取s节点后继节点中最小的rhs作为s节点的rhs值
void rhs_cal(RowVectorXi s)
{
    //用于对比找到min s'∈Succ(u)(c(u,s') + g(s'))
    min_rhs = INF; 
    for (int i = 0; i < 8; i++)
    {
        s_prime << s(0) + neighbour(i, 0), s(1) + neighbour(i, 1);
        //越界跳过
        if (s_prime(0) < 1 || s_prime(0) > xmax || s_prime(1) < 1 || s_prime(1) > ymax)
        {
            continue;
        }
        //如果节点s或者s'是障碍物，则跳过
        if (c(s_prime(0), s_prime(1)) == INF || c(s(0), s(1)) == INF)
        {
            continue;
        }
        else
        {
            cost_ssprime = neighbour(i, 2);
        }
        if (min_rhs > (cost_ssprime + g(s_prime(0), s_prime(1))))
        {
            min_rhs = cost_ssprime + g(s_prime(0), s_prime(1));
        }
    }
    rhs(s(0), s(1)) = min_rhs;
}