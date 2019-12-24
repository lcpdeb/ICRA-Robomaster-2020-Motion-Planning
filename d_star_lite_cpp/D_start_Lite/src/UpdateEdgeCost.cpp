/* Include files */
#include <iostream>
#include <stdio.h>

#include "main.h"
#include "Initialize.h"
#include "UpdateEdgeCost.h"
#include "isSamePosition.h"
#include "rhs_cal.h"
#include "UpdateVertex.h"

/* Parameters Declarations */
static RowVector2i s_surround_updated;
static RowVector2i v;
static RowVector2i u;
static double c_old;
static double c_uv;

/* Matrix Declarations */
static RowVector3i s_updated; // (x, y, obstacle/free)

/* Function Declarations */
void UpdateEdgeCost(MatrixXi updated_region)
{
    //检测周边点情况
    for (int i = 0; i < updated_region.rows(); i++)
    {
        s_updated = updated_region.row(i).array();
        //越界跳过
        if (s_updated(0) < 1 || s_updated(0) > xmax || s_updated(1) < 1 || s_updated(1) > ymax)
        {
            continue;
        }
        //Assign current node u
        u = s_updated.head(2);
        //Scanning Map surround, Scan node for changed edge cost
        //for all directed edges(u,v) with changed edge costs
        for (int k = 0; k < 8; k++)
        {
            s_surround_updated << s_updated(0) + neighbour(k, 0), s_updated(1) + neighbour(k, 1);
            //越界跳过
            if (s_surround_updated(0) < 1 || s_surround_updated(0) > xmax || s_surround_updated(1) < 1 || s_surround_updated(1) > ymax)
            {
                continue;
            }
            //Assign surround node v
            v = s_surround_updated.head(2);

            //判断u的类型
            //new obstacle
            if (s_updated(2) == 1)
            {
                c(u(0), u(1)) = INF; //检测到obstacle，更新c
                //c_old=c(u,v)
                if (c(v(0), v(1)) == INF)//如果v是obstacle,则c_old是Inf
                {
                    c_old = INF;
                }
                else
                {
                    c_old = neighbour(k, 2);//new obstacle说明以前是free，计算c_old
                }
                c_uv = INF;//现在u是obstacle了，所以c(u,v)=Inf;
            }
            //new free
            else
            {
                c(u(0), u(1)) = 0; //检测到obstacle，更新c
                c_old = INF;//new free说明以前是obstacle, c_old一定为Inf
                if (c(v(0), v(1)) == INF)//如果v是obstacle,则c(u,v)为Inf
                {
                    c_uv = INF;
                }
                else
                {
                    c_uv = neighbour(k, 2);//new free说明以前是obstacle，计算c_old
                }
            }
            //std::cout << "c_old " << c_old << std::endl;
            //std::cout << "c_uv " << c_uv << std::endl;

            if (c_old > c_uv)
            {
                if (!isSamePosition(u, s_goal))
                {
                    //std::cout << "rhs(" << u(0) << ", " << u(1) << ") " << rhs(u(0), u(1)) << std::endl;
                    //std::cout << "g(" << v(0) << ", " << v(1) << ") " << g(v(0), v(1)) << std::endl;
                    rhs(u(0), u(1)) = fmin(rhs(u(0), u(1)), c_uv + g(v(0), v(1)));
                }
            }
            else if (rhs(u(0), u(1)) == c_old + g(v(0), v(1)))
            {
                if (!isSamePosition(u, s_goal))
                {
                    //rhs(u)=min s'∈Succ(u) (c(u,s')+g(s'))
                    rhs_cal(u);
                }
            }
            UpdateVertex(u);
            
            rhs_cal(v);
            UpdateVertex(v);
        }
    }
}