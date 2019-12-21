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
static MatrixXd min_rhs_point;
static RowVector2d s_temp;
static RowVectorXd s_next;

/* Function Declarations */
MatrixXd GeneratePath(void)
{
    s_next = s_start;
    path = s_start;
    while (!isSamePosition(s_next, s_goal))
    {
        //临时存储rhs用于比较
        static double temp_rhs = INF;
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
            std::cout << "s_temp is " << s_temp << std::endl;
            if (temp_rhs > rhs(s_temp(0), s_temp(1)))
            {
                temp_rhs = rhs(s_temp(0), s_temp(1));
                std::cout << "temp_rhs is " << temp_rhs << std::endl;
                min_rhs_point = s_temp;

            }
        }
        s_next = min_rhs_point;
        std::cout << "next is " << s_next << std::endl;
        if (temp_rhs == INF)
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