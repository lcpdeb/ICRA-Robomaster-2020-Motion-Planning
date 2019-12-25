/* Include files */
#include "test_class.h"
#include "Initialize.h"
#include "GetMinKey.h"

/* Parameters Declarations */
static const int PrimaryKeyIndex = 2;
static const int SecondaryKeyIndex = 3;
static int minKeyIndex, tempKeyIndex;
static double minPrimaryKey, minSecondaryKey;
static int list_length;

/* Matrix Declarations */
static RowVector3d minKey;
static MatrixXd temp_list;
static RowVectorXd temp_row;
static VectorXd primary_list;
static VectorXd secondary_list;

/* Function Declarations */

// 找到最小Key值，返回minKey和minKeyIndex
RowVector3d GetMinKey(MatrixXd list)
{
    list_length = list.rows();
    // 如果list不是空集
    if (list_length)
    {
        // 从list中提出PrimaryKey这一列
        primary_list = list.col(PrimaryKeyIndex).array();

        // 找到最小PrimaryKey
        minPrimaryKey = primary_list.minCoeff(&minKeyIndex);
        temp_list.setConstant(1, 4, INF);//初始化temp_list

        for (int i = 0; i < list_length; i++)
        {
            // 遍历list，找到所有相同PrimayKey的行数，放进temp list里
            if (list(i,PrimaryKeyIndex) == minPrimaryKey)
            {
                temp_row = list.row(i).array();
                appendRow(temp_list, temp_row);
            }
        }
        
        // 从temp list中提出SecondaryKey这一列
        secondary_list = temp_list.col(SecondaryKeyIndex).array();
        
        // 找到最小SecondaryKey
        minSecondaryKey = secondary_list.minCoeff(&tempKeyIndex);

        //计算minKeyIndex
        minKeyIndex = minKeyIndex + tempKeyIndex - 1;

        minKey << minPrimaryKey, minSecondaryKey, minKeyIndex;
    }
    // 否则返回INF
    else
    {
        minKey << INF, INF, INF;
    }

    return minKey;
};