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
	total_length = 2 * (xmax+2) + 2 * (ymax+2) - 4;//����boundary�ж��ٸ�
	boundary.setZero(total_length,2);//�ı�boundary�Ĵ�С������Ϊ0
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

