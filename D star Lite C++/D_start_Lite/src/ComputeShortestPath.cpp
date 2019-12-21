/* Include files */
#include <iostream>
#include <stdio.h>

#include "main.h"
#include "Initialize.h"
#include "ComputeShortestPath.h"
#include "CalculateKey.h"
#include "GetMinKey.h"
#include "CompareKey.h"
#include "isSamePosition.h"
#include "UpdateVertex.h"

/* Parameters Declarations */
static int minIndex;
static double cost;

/* Matrix Declarations */
static RowVector2d key_s_start;
static RowVector2d key_old;
static RowVector2d key_new;
static RowVector2d key_TopKey;
static RowVector3d temp_key;
static RowVectorXd u;
static RowVector2d s_temp;

/* Function Declarations */
void ComputeShortestPath(void)
{
    key_s_start = CalculateKey(s_start);
    temp_key = GetMinKey(U);
    //TopKey取前两位
    key_TopKey = temp_key.head(2).array();


    while (CompareKey(key_TopKey, key_s_start) || (rhs(s_start(0), s_start(1)) > g(s_start(0), s_start(1))))
    {
        //获取U中最小key和index
        temp_key = GetMinKey(U);
        //minIndex取第三位
        minIndex = temp_key(2);
        //当前节点u为U中最小值
        u = U.row(minIndex);

        //key_old取前两位
        key_old = temp_key.head(2).array();

        //计算该节点u新key值
        key_new = CalculateKey(u);

        //如果该节点的key值小于原先的key值
        if (CompareKey(key_old, key_new))
        {
            //更新key值
            U(minIndex, 2) = key_new(0);
            U(minIndex, 3) = key_new(1);
        }
        //局部过一致，边缘代价函数值变低，代表网格上障碍物被清除或者搜索到一条更短捷径,开始扩展节点
        else if (g(u(0), u(1)) > rhs(u(0), u(1)))
        {
            //使局部一致
            g(u(0), u(1)) = rhs(u(0), u(1));
            //删除该节点
            removeRow(U, minIndex);

            //for all s ∈ Pred(u)
            for (int i = 0; i < 8; i++)
            {
                s_temp << u(0) + neighbour(i, 0), u(1) + neighbour(i, 1);
                //越界跳过
                if (s_temp(0) < 1 || s_temp(0) > xmax || s_temp(1) < 1 || s_temp(1) > ymax)
                {
                    continue;
                }

                if (!isSamePosition(s_temp, s_goal))
                {
                    if (c(s_temp(0), s_temp(1)) != INF)
                    {
                        cost = (s_temp.head(2) - u.head(2)).norm();
                    }
                    else
                    {
                        cost = INF;
                    }
                    rhs(s_temp(0), s_temp(1)) = fmin(rhs(s_temp(0), s_temp(1)), cost + g(u(0), u(1)));
                    //std::cout << "rhs(" << s_temp(0) << "," << s_temp(1) << ") : " << rhs(s_temp(0), s_temp(1)) << std::endl;
                }
                UpdateVertex(s_temp);
            }

        }
        else
        {
            //待补充
        }

        key_s_start = CalculateKey(s_start);
        temp_key = GetMinKey(U);
        //TopKey取前两位
        key_TopKey = temp_key.head(2).array();
    }

    
}