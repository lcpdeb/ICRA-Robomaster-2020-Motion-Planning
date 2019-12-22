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
#include "isSamePosition.h"


/* Parameters Declarations */
static int goal[2];
static int start[2];

/* Matrix Declarations */
RowVector2d s_start;
RowVector2d s_goal;
RowVector2d s_last;
MatrixXd path;

/* Function Declarations */
int main()
{
    std::cout << "Select a start point: " << std::endl;
    std::cin >> start[0] >> start[1];
    std::cout << "Select a goal point: " << std::endl;
    std::cin >> goal[0] >> goal[1];
    
    s_goal << goal[0], goal[1];
    s_start << start[0], start[1];

    //看看时间
    clock_t start_time, end_time;
    double totaltime;
    start_time = clock();

    s_last = s_start;
    Initialize();
    ComputeShortestPath();
    path = GeneratePath();

    end_time = clock();
    totaltime = (double)(end_time - start_time) / CLOCKS_PER_SEC;
    //看看时间

    std::cout << "Path is:" << std::endl;
    std::cout << path << std::endl;
    std::cout << std::endl;
    std::cout << "\n此程序的运行时间为" << totaltime << "秒" << std::endl;

    std::ofstream path_file("pathcpp.txt");
    path_file << path;
    path_file.close();

    ////Move to next node(Update Robot Position)
    //s_start = path.row(2);
    //while (!isSamePosition(s_start, s_goal))
    //{
    //    //Update Region
    //    //Update Obstacle in SLAM
    //    //Replan
    //    ComputeShortestPath();
    //    path = GeneratePath();
    //    //Move to next node(Update Robot Position)
    //    s_start = path.row(2);
    //}

    




    //std::ofstream rhs_file("rhscpp.txt");
    //rhs_file << rhs;
    //rhs_file.close();

    //std::ofstream c_file("ccpp.txt");
    //c_file << c;
    //c_file.close();

    return 0;
}

