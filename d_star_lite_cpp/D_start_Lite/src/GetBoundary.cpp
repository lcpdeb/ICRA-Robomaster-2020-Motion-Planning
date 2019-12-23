/* Include files */
#include "Initialize.h"
#include "GetBoundary.h"

/* Parameters Declarations */
static int total_length;

/* Matrix Declarations */
Matrix<int, Dynamic, 2> boundary;

/* Function Declarations */
void GetBoundary(void)
{
	total_length = 2 * (xmax+2) + 2 * (ymax+2) - 4;//计算boundary有多少个
	boundary.setZero(total_length,2);//改变boundary的大小并重置为0
	for (int i = 0; i < ymax + 2; i++)
	{
		boundary.row(i) << 0, i;
	}
	for (int i = 1; i < xmax + 2; i++)
	{
		boundary.row(i + ymax + 1) << i, 0;
	}
	for (int i = 1; i < ymax + 2; i++)
	{
		boundary.row(i + ymax + 1 + xmax + 1) << xmax + 1, i;
	}
	for (int i = 1; i < xmax + 1; i++)
	{
		boundary.row(i + ymax + 1 + xmax + 1 + ymax + 1) << i, ymax + 1;
	}
}

