// main.cpp : This file contains the 'main' function. Program execution begins and ends there.
//
/* Include files */
#include <iostream>
#include <stdio.h>
#include <fstream>

#include "Initialize.h"
#include "ComputeShortestPath.h"
#include "GeneratePath.h"


/* Parameters Declarations */

/* Matrix Declarations */
RowVector2d s_start;
RowVector2d s_goal;
RowVector2d s_last;
MatrixXd path;

/* Function Declarations */
int main()
{
    s_goal << 72, 42;
    s_start << 11, 11;
    Initialize();
    ComputeShortestPath();
    path = GeneratePath();
    s_last = s_start;

    std::ofstream path_file("pathcpp.txt");
    path_file << path;
    path_file.close();

    std::ofstream rhs_file("rhscpp.txt");
    rhs_file << rhs;
    rhs_file.close();

    std::ofstream c_file("ccpp.txt");
    c_file << c;
    c_file.close();

    return 0;
}

