/* Include files */
#include "main.h"
#include "Initialize.h"
#include "CalculateKey.h"

/* Parameters Declarations */
static double SecondaryKey;
static double PrimaryKey;

/* Matrix Declarations */
static RowVector2d key;

/* Function Declarations */
RowVector2d CalculateKey(RowVectorXd s)
{
    SecondaryKey = fmin(g(s(0), s(1)), rhs(s(0), s(1)));
    PrimaryKey = SecondaryKey + 0.99 * (s_start - s.head(2)).norm() + k_m;
    key << PrimaryKey, SecondaryKey;
    return key;
}