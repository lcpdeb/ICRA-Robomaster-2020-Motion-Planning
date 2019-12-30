/* Include files */
#include "../include/Initialize.h"
#include "../include/GetObstacleCover.h"

/* Parameters Declarations */
static int total_length;
static int k = 0;

/* Matrix Declarations */
Matrix<int, Dynamic, 2> cover;

/* Function Declarations */
void GetObstacleCover(void)
{
	total_length = 1446;//计算boundary有多少个
	cover.setZero(total_length, 2);//改变boundary的大小并重置为0
	for (int i = floor(0 * 10 / accuracy) - floor(robot_size / 2 / accuracy) + 1; i < (ceil(10 * 10 / accuracy) + floor(robot_size / 2 / accuracy) + 1) + 1; i++)
	{
		for (int j = floor(38.5 * 10 / accuracy) - floor(robot_size / 2 / accuracy) + 1; j < (ceil(41 * 10 / accuracy) + floor(robot_size / 2 / accuracy) + 1) + 1; j++)
		{
			if (i<1 || i>xmax || j<1 || j>ymax)
			{
				continue;
			}
			cover.row(k) << i, j;
			k = k + 1;
		}
	}
	for (int i = floor(15 * 10 / accuracy) - floor(robot_size / 2 / accuracy) + 1; i < (ceil(17.5 * 10 / accuracy) + floor(robot_size / 2 / accuracy) + 1) + 1; i++)
	{
		for (int j = floor(0 * 10 / accuracy) - floor(robot_size / 2 / accuracy) + 1; j < (ceil(10 * 10 / accuracy) + floor(robot_size / 2 / accuracy) + 1) + 1; j++)
		{
			if (i<1 || i>xmax || j<1 || j>ymax)
			{
				continue;
			}
			cover.row(k) << i, j;
			k = k + 1;
		}
	}
	for (int i = floor(15 * 10 / accuracy) - floor(robot_size / 2 / accuracy) + 1; i < (ceil(23 * 10 / accuracy) + floor(robot_size / 2 / accuracy) + 1) + 1; i++)
	{
		for (int j = floor(24.25 * 10 / accuracy) - floor(robot_size / 2 / accuracy) + 1; j < (ceil((24.25 + 2.5) * 10 / accuracy) + floor(robot_size / 2 / accuracy) + 1) + 1; j++)
		{
			if (i<1 || i>xmax || j<1 || j>ymax)
			{
				continue;
			}
			cover.row(k) << i, j;
			k = k + 1;
		}
	}
	for (int i = floor(35 * 10 / accuracy) - floor(robot_size / 2 / accuracy) + 1; i < (ceil(45 * 10 / accuracy) + floor(robot_size / 2 / accuracy) + 1) + 1; i++)
	{
		for (int j = floor(38.5 * 10 / accuracy) - floor(robot_size / 2 / accuracy) + 1; j < (ceil(41 * 10 / accuracy) + floor(robot_size / 2 / accuracy) + 1) + 1; j++)
		{
			if (i<1 || i>xmax || j<1 || j>ymax)
			{
				continue;
			}
			cover.row(k) << i, j;
			k = k + 1;
		}
	}
	for (int i = floor(36 * 10 / accuracy) - floor(robot_size / 2 / accuracy) + 1; i < (ceil(46 * 10 / accuracy) + floor(robot_size / 2 / accuracy) + 1) + 1; i++)
	{
		for (int j = floor(10 * 10 / accuracy) - floor(robot_size / 2 / accuracy) + 1; j < (ceil(12.5 * 10 / accuracy) + floor(robot_size / 2 / accuracy) + 1) + 1; j++)
		{
			if (i<1 || i>xmax || j<1 || j>ymax)
			{
				continue;
			}
			cover.row(k) << i, j;
			k = k + 1;
		}
	}
	for (int i = floor(58 * 10 / accuracy) - floor(robot_size / 2 / accuracy) + 1; i < (ceil(66 * 10 / accuracy) + floor(robot_size / 2 / accuracy) + 1) + 1; i++)
	{
		for (int j = floor(24.25 * 10 / accuracy) - floor(robot_size / 2 / accuracy) + 1; j < (ceil((24.25 + 2.5) * 10 / accuracy) + floor(robot_size / 2 / accuracy) + 1) + 1; j++)
		{
			if (i<1 || i>xmax || j<1 || j>ymax)
			{
				continue;
			}
			cover.row(k) << i, j;
			k = k + 1;
		}
	}
	for (int i = floor(71 * 10 / accuracy) - floor(robot_size / 2 / accuracy) + 1; i < (ceil(81 * 10 / accuracy) + floor(robot_size / 2 / accuracy) + 1) + 1; i++)
	{
		for (int j = floor(10 * 10 / accuracy) - floor(robot_size / 2 / accuracy) + 1; j < (ceil(12.5 * 10 / accuracy) + floor(robot_size / 2 / accuracy) + 1) + 1; j++)
		{
			if (i<1 || i>xmax || j<1 || j>ymax)
			{
				continue;
			}
			cover.row(k) << i, j;
			k = k + 1;
		}
	}
	for (int i = floor(63.5 * 10 / accuracy) - floor(robot_size / 2 / accuracy) + 1; i < (ceil(66 * 10 / accuracy) + floor(robot_size / 2 / accuracy) + 1) + 1; i++)
	{
		for (int j = floor(41 * 10 / accuracy) - floor(robot_size / 2 / accuracy) + 1; j < (ceil(51 * 10 / accuracy) + floor(robot_size / 2 / accuracy) + 1) + 1; j++)
		{
			if (i<1 || i>xmax || j<1 || j>ymax)
			{
				continue;
			}
			cover.row(k) << i, j;
			k = k + 1;
		}
	}
	// center obstacle cover
	for (int j = 0; j < (ceil(3 * sqrt(2) / 2 * 10 / accuracy) + floor(robot_size / 2 / accuracy)) + 1; j++)
	{
		for (int i = floor((40.5 - 3 * sqrt(2) / 2) * 10 / accuracy) + j - floor(robot_size / 2 / accuracy) + 1; i < (ceil((40.5 + 3 * sqrt(2) / 2) * 10 / accuracy) - j + floor(robot_size / 2 / accuracy) + 1) + 1; i++)
		{
			cover.row(k) << i, ceil(25.5 * 10 / accuracy) + j + 1;
			k = k + 1;
		}
	}
	for (int j = floor(-3 * sqrt(2) / 2 * 10 / accuracy) - floor(robot_size / 2 / accuracy); j < 0 + 1; j++)
	{
		for (int i = floor((40.5 - 3 * sqrt(2) / 2) * 10 / accuracy) - j - floor(robot_size / 2 / accuracy) + 1; i < (ceil((40.5 + 3 * sqrt(2) / 2) * 10 / accuracy) + j + floor(robot_size / 2 / accuracy) + 1) + 1; i++)
		{
			cover.row(k) << i, floor(25.5 * 10 / accuracy) + j + 1;
			k = k + 1;
		}
	}
	// center obstacle cover

	// boundary cover
	for (int j = 1; j < floor(robot_size / 2 / accuracy) + 1; j++)
	{
		for (int i = 0 + j; i < (ymax + 1 - j) + 1; i++)
		{
			cover.row(k) << 0 + j, i;
			k = k + 1;
		}
		for (int i = 1 + j; i < (xmax + 1 - j) + 1; i++)
		{
			cover.row(k) << i, 0 + j;
			k = k + 1;
		}
		for (int i = 1 + j; i < (ymax + 1 - j) + 1; i++)
		{
			cover.row(k) << xmax + 1 - j, i;
			k = k + 1;
		}
		for (int i = 1 + j; i < (xmax + 1 - j) + 1; i++)
		{
			cover.row(k) << i, ymax + 1 - j;
			k = k + 1;
		}
	}
	// boundary cover
}

