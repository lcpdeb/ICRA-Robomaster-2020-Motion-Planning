#include "navigation.h"

#include "Initialize.h"
#include "ComputeShortestPath.h"
#include "GeneratePath.h"
#include "isSamePosition.h"
#include "UpdateRegion.h"
#include "UpdateEdgeCost.h"

int main(int argc, char **argv)
{
    ros::init(argv, argc, "navigation");
    Navigation nav;
    nav.Loop();
}

/* Parameters Declarations */
char side;
Region region;

/* Matrix Declarations */
RowVector2i s_start;
RowVector2i s_goal;
RowVector2i s_last;
MatrixXi path;

Navigation::Navigation() : nh("~")
{


    // Load param from YAML file
    Navigation::LoadParam<string>("robot_properties", properties_file_name);
    properties = YAML::LoadFile(properties_file_name);

    // Define publishers
    robot_pos_sub = nh.subscribe<geometry_msgs::Vector3Stamped>("/state/robot_pos", 1, &Navigation::GetPosition, this);
    terminal_sub = nh.subscribe<geometry_msgs::Vector3Stamped>("/state/terminal_pos", 1, &Navigation::GetTerminal, this);
    cmd_pub = nh.advertise<geometry_msgs::Vector3Stamped>("/cmd/next_pos", 1);
    
    // Choose side
    //输入//输入//输入//输入//输入//输入//输入//输入//输入//输入//输入//输入//输入//输入//输入//输入//输入//输入//输入//输入//输入//输入//输入//输入//输入
    side = 'B';
    s_start << robot_pos_sub[0], robot_pos_sub[1];
    s_goal << terminal_sub[0], terminal_sub[1];

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
        //输出//输出//输出//输出//输出//输出//输出//输出//输出//输出//输出//输出//输出//输出//输出//输出//输出//输出
        s_start = path.row(1);
        std:: cout<< "current location is " << s_start << std::endl;
    }






    Navigation::LoadRobotProperties();
    Navigation::InitCmdMsg();
    Navigation::GetPosition(const geometry_msgs::Vector3Stamped::ConstPtr &terminal);
    Navigation::GetTerminal(const geometry_msgs::Vector3Stamped::ConstPtr &terminal);
}