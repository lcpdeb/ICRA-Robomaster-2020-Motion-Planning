// main.cpp : This file contains the 'main' function. Program execution begins and ends there.
//
/* Include files */
#include <iostream>
#include <stdio.h>
#include <fstream>
#include <time.h>

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
    s_goal << 80, 50;
    s_start << 3, 3;


    clock_t start_time, end_time;
    double totaltime;
    start_time = clock();

    Initialize();
    ComputeShortestPath();
    path = GeneratePath();

    end_time = clock();
    totaltime = (double)(end_time - start_time) / CLOCKS_PER_SEC;
    



    s_last = s_start;
    std::cout << path << std::endl;
    std::cout << std::endl;
    std::cout << "\n此程序的运行时间为" << totaltime << "秒" << std::endl;

    std::ofstream path_file("pathcpp.txt");
    path_file << path;
    path_file.close();

    //std::ofstream rhs_file("rhscpp.txt");
    //rhs_file << rhs;
    //rhs_file.close();

    //std::ofstream c_file("ccpp.txt");
    //c_file << c;
    //c_file.close();

    return 0;
}

