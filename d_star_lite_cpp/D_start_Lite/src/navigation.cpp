#include "include/navigation.h"

int main(int argc, char **argv)
{
    ros::init(argv, argc, "navigation");
    Navigation nav;
    nav.Loop();
}

Navigation::Navigation() : nh("~")
{
    // Load param from YAML file
    Navigation::LoadParam<string>("robot_properties", properties_file_name);
    properties = YAML::LoadFile(properties_file_name);

    // Define publishers
    robot_pos_sub = nh.subscribe<geometry_msgs::Vector3Stamped>("/state/robot_pos", 1, &Navigation::GetPosition, this);
    terminal_sub = nh.subscribe<geometry_msgs::Vector3Stamped>("/state/terminal_pos", 1, &Navigation::GetTerminal, this);
    cmd_pub = nh.advertise<geometry_msgs::Vector3Stamped>("/cmd/next_pos", 1);
    
    Navigation::LoadRobotProperties();
    Navigation::InitCmdMsg();
}