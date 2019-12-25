// main.cpp : This file contains the 'main' function. Program execution begins and ends there.
//
/* Include files */
#include <iostream>
#include <stdio.h>
#include <fstream>
#include <time.h>

#include "main.h"
#include "Initialize.h"
#include "ComputeShortestPath.h"
#include "GeneratePath.h"
#include "isSamePosition.h"
#include "UpdateRegion.h"
#include "UpdateEdgeCost.h"

/* Parameters Declarations */
static int goal[2];
static int start[2];
char side;
Region region;

/* Matrix Declarations */ 
RowVector2i s_start;
RowVector2i s_goal;
RowVector2i s_last;
MatrixXi path;

/* Function Declarations */
int main()
{
    side = 'B';
    //std::cout << "Select your side(R or B): " << std::endl;
    //std::cin >> side;
    //std::cout << "Select a start point: " << std::endl;
    //std::cin >> start[0] >> start[1];
    //std::cout << "Select a goal point: " << std::endl;
    //std::cin >> goal[0] >> goal[1];
    //
    //s_goal << goal[0], goal[1];
    //s_start << start[0], start[1];

    s_goal << 3, 3;
    s_start << 80, 50;

    //����ʱ��
    clock_t start_time, end_time;
    double totaltime;
    start_time = clock();

    s_last = s_start;
    Initialize();//��������ֻ����һ��

    //����Ŀ���rhsΪ0
    rhs(s_goal(0), s_goal(1)) = 0;
    //��ʼ��U
    U.setZero(1, 4);
    U << s_goal(0), s_goal(1), (s_start - s_goal).norm(), 0;

    ComputeShortestPath();
    path = GeneratePath();

    end_time = clock();
    totaltime = (double)(end_time - start_time) / CLOCKS_PER_SEC;
    //����ʱ��

    std::cout << "Path is:" << std::endl;
    std::cout << path << std::endl;
    std::cout << std::endl;
    std::cout << "\n�˳��������ʱ��Ϊ" << totaltime << "��" << std::endl;

    std::ofstream path_file("pathcpp.txt");
    path_file << path;
    path_file.close();

    //Move to next node(Update Robot Position)
    s_start = path.row(1);
    std::cout << "current location is " << s_start << std::endl;


    while (!isSamePosition(s_start, s_goal))
    {
        //////////////////////////////////////////Update Region//////////////////////////////////////////
        //�Ӳ���ϵͳ��ȡ����������
        region.F1.name = �췽������;
        region.F2.name = ��ֹ�����;
        region.F3.name = �췽��Ѫ��;
        region.F4.name = ������Ѫ��;
        region.F5.name = ����������;
        region.F6.name = ��ֹ�ƶ���;
        //����region
        updated_region = UpdateRegion(region);
        std::cout << "updated_regionis " << updated_region << std::endl;
        //����region״̬��
        region.F1.last_name = region.F1.name;
        region.F2.last_name = region.F2.name;
        region.F3.last_name = region.F3.name;
        region.F4.last_name = region.F4.name;
        region.F5.last_name = region.F5.name;
        region.F6.last_name = region.F6.name;
        //////////////////////////////////////////Update Region//////////////////////////////////////////
        //Update Obstacle in SLAM


        //Update Map
        if (updated_region.rows())
        {
            //����k_m
            k_m = k_m + (s_last - s_start).cast<double>().norm();
            s_last = s_start;
            UpdateEdgeCost(updated_region);
        }
        //Replan
        ComputeShortestPath();
        path = GeneratePath();
        //Move to next node(Update Robot Position)
        s_start = path.row(1);
        std:: cout<< "current location is " << s_start << std::endl;
    }

    //std::ofstream rhs_file("rhscpp.txt");
    //rhs_file << rhs;
    //rhs_file.close();

    //std::ofstream c_file("ccpp.txt");
    //c_file << c;
    //c_file.close();






    return 0;
}

