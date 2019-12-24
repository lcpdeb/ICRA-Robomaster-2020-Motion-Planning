/* Include files */
#include "main.h"
#include "Initialize.h"
#include "isSamePosition.h"

/* Parameters Declarations */

/* Matrix Declarations */

/* Function Declarations */
bool isSamePosition(RowVectorXi a, RowVectorXi b)
{
    if (a(0) == b(0) && a(1) == b(1))
    {
        return true;
    }
    return false;
}