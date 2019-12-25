/* Include files */
#include "navigation.h"
#include "Initialize.h"
#include "UpdateVertex.h"
#include "isInList.h"
#include "CalculateKey.h"

/* Parameters Declarations */
static int isInListFlag;
static int isInListIndex;

/* Matrix Declarations */
static RowVector2i result_array;
static RowVector2d key;
static RowVector4d temp_row;

/* Function Declarations */
void UpdateVertex(RowVectorXi u)
{
    try
    {
        result_array = isInList(u, U);
        isInListFlag = result_array(0);
        isInListIndex = result_array(1);
    }
    catch(...)
    {
        isInListFlag = 0;
    }

    if ((g(u(0), u(1)) != rhs(u(0), u(1))) && isInListFlag)
    {
        // U.Update
        key = CalculateKey(u);
        //更新key值
        U(isInListIndex, 2) = key(0);
        U(isInListIndex, 3) = key(1);
    }
    else if ((g(u(0), u(1)) != rhs(u(0), u(1))) && !isInListFlag)
    {
        //计算key值后加入U
        key = CalculateKey(u);
        temp_row << u(0), u(1), key;
        appendRow(U, temp_row);
    }
    else if ((g(u(0), u(1)) == rhs(u(0), u(1))) && isInListFlag)
    {       
        //从U中删除节点
        removeRow(U, isInListIndex);
    }



}