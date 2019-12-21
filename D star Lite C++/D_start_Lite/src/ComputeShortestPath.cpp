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
    //TopKeyȡǰ��λ
    key_TopKey = temp_key.head(2).array();


    while (CompareKey(key_TopKey, key_s_start) || (rhs(s_start(0), s_start(1)) > g(s_start(0), s_start(1))))
    {
        //��ȡU����Сkey��index
        temp_key = GetMinKey(U);
        //minIndexȡ����λ
        minIndex = temp_key(2);
        //��ǰ�ڵ�uΪU����Сֵ
        u = U.row(minIndex);

        //key_oldȡǰ��λ
        key_old = temp_key.head(2).array();

        //����ýڵ�u��keyֵ
        key_new = CalculateKey(u);

        //����ýڵ��keyֵС��ԭ�ȵ�keyֵ
        if (CompareKey(key_old, key_new))
        {
            //����keyֵ
            U(minIndex, 2) = key_new(0);
            U(minIndex, 3) = key_new(1);
        }
        //�ֲ���һ�£���Ե���ۺ���ֵ��ͣ������������ϰ��ﱻ�������������һ�����̽ݾ�,��ʼ��չ�ڵ�
        else if (g(u(0), u(1)) > rhs(u(0), u(1)))
        {
            //ʹ�ֲ�һ��
            g(u(0), u(1)) = rhs(u(0), u(1));
            //ɾ���ýڵ�
            removeRow(U, minIndex);

            //for all s �� Pred(u)
            for (int i = 0; i < 8; i++)
            {
                s_temp << u(0) + neighbour(i, 0), u(1) + neighbour(i, 1);
                //Խ������
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
            //������
        }

        key_s_start = CalculateKey(s_start);
        temp_key = GetMinKey(U);
        //TopKeyȡǰ��λ
        key_TopKey = temp_key.head(2).array();
    }

    
}