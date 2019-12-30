/* Include files */
#include <iostream>
#include <stdio.h>

#include "../include/main.h"
#include "../include/Initialize.h"
#include "../include/GeneratePath.h"
#include "../include/isSamePosition.h"

/* Parameters Declarations */
static double min_rhs;

/* Matrix Declarations */
static MatrixXi path;
static RowVector2i min_rhs_point;
static RowVector2i s_temp;

/* Function Declarations */
MatrixXi GeneratePath(void)
{
    path = s_start;
    while (!isSamePosition(s_start, s_goal))
    {
        //��ʱ�洢rhs���ڱȽ�
        min_rhs = INF;
        min_rhs_point = s_start;

        //ѡ��s_start���к�̽ڵ���С��rhsֵ������Ϊ�µ�s_start
        for (int i = 0; i < 8; i++)
        {
            s_temp << s_start(0) + neighbour(i, 0), s_start(1) + neighbour(i, 1);
            //Խ������
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
        s_start = min_rhs_point;
        if (min_rhs == INF)
        {
            std::cout << "No Path to Goal!" << std::endl;
            break;
        }
        else
        {
            //�ƶ���s_start�������path
            appendPath(path, s_start);
        }

    }
    return path;
}