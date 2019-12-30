/* Include files */
#include "../include/main.h"
#include "../include/Initialize.h"
#include "../include/CalculateKey.h"

/* Parameters Declarations */
static double SecondaryKey;
static double PrimaryKey;
static double h;

/* Matrix Declarations */
static RowVector2d key;

/* Function Declarations */
RowVector2d CalculateKey(RowVectorXi s)
{
    h = (s_start - s.head(2)).cast<double>().norm();
    SecondaryKey = fmin(g(s(0), s(1)), rhs(s(0), s(1)));
    PrimaryKey = SecondaryKey + 0.99 * h + k_m;
    key << PrimaryKey, SecondaryKey;
    return key;
}