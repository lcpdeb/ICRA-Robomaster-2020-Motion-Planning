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
    //����//����//����//����//����//����//����//����//����//����//����//����//����//����//����//����//����//����//����//����//����//����//����//����//����
    side = 'B';
    s_start << robot_pos_sub[0], robot_pos_sub[1];
    s_goal << terminal_sub[0], terminal_sub[1];

    s_last = s_start;
    Initialize();

    //����Ŀ���rhsΪ0
    rhs(s_goal(0), s_goal(1)) = 0;
    //��ʼ��U
    U.setZero(1, 4);
    U << s_goal(0), s_goal(1), (s_start - s_goal).norm(), 0;

    //
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
        //���//���//���//���//���//���//���//���//���//���//���//���//���//���//���//���//���//���
        s_start = path.row(1);
        std:: cout<< "current location is " << s_start << std::endl;
    }






    Navigation::LoadRobotProperties();
    Navigation::InitCmdMsg();
    Navigation::GetPosition(const geometry_msgs::Vector3Stamped::ConstPtr &terminal);
    Navigation::GetTerminal(const geometry_msgs::Vector3Stamped::ConstPtr &terminal);
}