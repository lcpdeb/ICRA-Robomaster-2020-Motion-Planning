#include "test_class.h"
#include "test.h"
#include <iostream>
#include <stdio.h>


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

int show_answer(BOX box)
{
    return box.cddd(box.x, box.y);
}

int BOX::cddd(int c, int d)
{
    return adddd(c, d);
}

void BOX::bbbbbox(void)
{
    std::cout << "bbbbbox is running" << std::endl;
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

    s_start << 80, 50;
    s_goal << 3, 3;
    

    //看看时间

    s_last = s_start;
    Initialize();

    //设置目标点rhs为0
    rhs(s_goal(0), s_goal(1)) = 0;
    //初始化U
    U.setZero(1, 4);
    U << s_goal(0), s_goal(1), (s_start - s_goal).norm(), 0;

    //
    ComputeShortestPath();
    path = GeneratePath();


    //看看时间

    std::cout << "Path is:" << std::endl;
    std::cout << path << std::endl;
    std::cout << std::endl;


    //Move to next node(Update Robot Position)
    s_start = path.row(1);
    std::cout << "current location is " << s_start << std::endl;


    while (!isSamePosition(s_start, s_goal))
    {
        //////////////////////////////////////////Update Region//////////////////////////////////////////
        //从裁判系统读取分析后输入
        region.F1.name = 红方补给区;
        region.F2.name = 禁止射击区;
        region.F3.name = 红方回血区;
        region.F4.name = 蓝方回血区;
        region.F5.name = 蓝方补给区;
        region.F6.name = 禁止移动区;
        //更新region
        updated_region = UpdateRegion(region);
        //储存region状态机
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
            //更新k_m
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
}