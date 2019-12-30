/* Include files */
#include "../include/main.h"
#include "../include/Initialize.h"
#include "../include/isInList.h"
#include "../include/isSamePosition.h"

/* Parameters Declarations */
static int flag;
static int list_length;
static int list_index;

/* Matrix Declarations */
static RowVector2i isInListInfo;

/* Function Declarations */
//查找节点是否在list中，返回flag和list_index
RowVector2i isInList(RowVectorXi u, MatrixXd list)
{
    flag = 0;
    list_index = 0;
    list_length = list.rows();

    if (list_length)
    {
        for (list_index = 0; list_index < list_length; list_index++)
        {
            if (isSamePosition(list.row(list_index).array().cast<int>(), u.head(2)))
            {
                flag = 1;
                isInListInfo << flag, list_index;
                return isInListInfo;
            }
        }
    }
    isInListInfo << flag, list_index;
    return isInListInfo;
}