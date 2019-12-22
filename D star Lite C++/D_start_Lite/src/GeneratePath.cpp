/* Include files */
#include <iostream>
#include <stdio.h>

#include "main.h"
#include "Initialize.h"
#include "GeneratePath.h"
#include "isSamePosition.h"

/* Parameters Declarations */

/* Matrix Declarations */
static MatrixXd path;
static RowVector2d min_rhs_point;
static RowVector2d s_temp;
static RowVector2d s_next;

/* Function Declarations */
MatrixXd GeneratePath(void)
{
    s_next = s_start;
    path = s_start;
    while (!isSamePosition(s_next, s_goal))
    {
        //临时存储rhs用于比较
        static double min_rhs = INF;
        min_rhs_point = s_next;

        //选择s_start所有后继节点最小的rhs值坐标作为新的s_start
        for (int i = 0; i < 8; i++)
        {
            s_temp << s_next(0) + neighbour(i, 0), s_next(1) + neighbour(i, 1);
            //越界跳过
            if (s_temp(0) < 1 || s_temp(0) > xmax || s_temp(1) < 1 || s_temp(1) > ymax)
            {
                continue;
            }
            if (min_rhs > rhs(s_temp(0), s_temp(1)))
            {
                min_rhs = rhs(s_temp(0), s_temp(1));
                min_rhs_point = s_temp;

            }
        }
        s_next = min_rhs_point;
        if (min_rhs == INF)
        {
            std::cout << "No Path to Goal!" << std::endl;
            break;
        }
        else
        {
            //移动到s_next并储存进path
            appendRow(path, s_next);
        }

    }
    return path;
}