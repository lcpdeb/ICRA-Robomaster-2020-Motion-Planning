#ifndef NAVIGATION_H
#define NAVIGATION_H

/* Include files */
#include "ros/ros.h"
#include "geometry_msgs/Vector3.h"
#include "geometry_msgs/Vector3Stamped.h"
#include "std_msgs/Float32.h"
#include "std_msgs/Int8.h"

// Include header files, use them as functions
#include <stddef.h>
#include <stdlib.h>
#include <math.h>

#include <yaml-cpp/yaml.h>  // For loading param
#include "eigen3/Eigen/Dense"
#include "eigen3/Eigen/Core"

using namespace Eigen;
using namespace std;

/* Parameters Declarations */
extern char side;

/* Matrix Declarations */
extern RowVector2i s_start;
extern RowVector2i s_goal;

class Navigation
{
private:
  ros::NodeHandle nh;
  ros::Subscriber robot_pos_sub, terminal_sub; // sys_sub for judging sys
  ros::Publisher cmd_pub;

  geometry_msgs::Vector3Stamped cmd_msg;
  YAML::Node properties; // Perpare for loading param
  string properties_file_name;

public:
  EIGEN_MAKE_ALIGNED_OPERATOR_NEW

  Navigation();
  template <typename T>
  void LoadParam(std::string param, T &var);
  void LoadRobotProperties();
  void InitCmdMsg();
  void GetPosition(const geometry_msgs::Vector3Stamped::ConstPtr &terminal);
  void GetTerminal(const geometry_msgs::Vector3Stamped::ConstPtr &terminal);
}


