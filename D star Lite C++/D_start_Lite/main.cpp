// main.cpp : This file contains the 'main' function. Program execution begins and ends there.
//
/* Include files */
#include <iostream>
#include <stdio.h>

#include "Initialize.h"
#include "ComputeShortestPath.h"
#include "GeneratePath.h"


/* Parameters Declarations */

/* Matrix Declarations */
RowVector2d s_start;
RowVector2d s_goal;
MatrixXd path;

/* Function Declarations */
int main()
{
    s_goal << 45, 23;
    s_start << 38, 30;
    Initialize();
    ComputeShortestPath();
    path = GeneratePath();
    std::cout << path << std::endl;
    return 0;
}

