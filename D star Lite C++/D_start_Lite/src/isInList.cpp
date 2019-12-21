/* Include files */
#include "main.h"
#include "Initialize.h"
#include "isInList.h"
#include "isSamePosition.h"

/* Parameters Declarations */
static int flag;
static int list_length;
static int index;

/* Matrix Declarations */
static RowVector2i isInListInfo;

/* Function Declarations */
//���ҽڵ��Ƿ���list�У�����flag��index
RowVector2i isInList(RowVectorXd u, MatrixXd list)
{
    flag = 0;
    index = 0;
    list_length = list.rows();

    if (list_length)
    {
        for (index = 0; index < list_length; index++)
        {
            if (isSamePosition(list.row(index).array(), u.head(2)))
            {
                flag = 1;
                isInListInfo << flag, index;
                return isInListInfo;
            }
        }
    }
    isInListInfo << flag, index;
    return isInListInfo;
}