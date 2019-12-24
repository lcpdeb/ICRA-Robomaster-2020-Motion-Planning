#ifndef NAVIGATION_H
#define NAVIGATION_H

/* Include files */
#include "ros/ros.h"
#include "geometry_msgs/Vector3.h"
#include "geometry_msgs/Vector3Stamped.h"
#include "std_msgs/Float32.h"
#include "std_msgs/Int8.h"

// Include header files, use them as functions
#include "CalculateKey.h"
#include "CompareKey.h"
#include "ComputeShortestPath.h"
#include "GeneratePath.h"
#include "GetBoundary.h"
#include "GetMinKey.h"
#include "GetObstacleCover.h"
#include "Initialize.h"
#include "isInList.h"
#include "isSamePosition.h"
#include "rhs_cal.h"
#include "rtwtypes.h"
#include "UpdateRegion.h"
#include "UpdateVertex.h"

#include <stddef.h>
#include <stdlib.h>
#include <math.h>

#include <yaml-cpp/yaml.h>  // For loading param
#include "eigen3/Eigen/Dense"
#include "eigen3/Eigen/Core"

using namespace Eigen;
using namespace std;

typedef Matrix<double, 8, 3> Matrix83;

class Navigation
{
private:
  ros::NodeHandle nh;
  ros::Subscriber robot_pos_sub, terminal_sub; // sys_sub for judging sys
  ros::Publisher cmd_pub;

  geometry_msgs::Vector3Stamped cmd_msg;

  /* Parameters Declarations */
  // Some of this can be included into the yaml file
  /*extern const int INF;
  extern const int robot_size;
  extern const int accuracy;
  extern const int xmax;
  extern const int ymax;
  extern double k_m;*/

  /* Matrix Declarations */
  // What is extern here? Seems to be redundant
  /* extern Matrix<double, Dynamic, Dynamic> g;
  extern Matrix<double, Dynamic, Dynamic> rhs;
  extern Matrix<int, Dynamic, Dynamic> c;
  extern Matrix<double, Dynamic, Dynamic> U;
  extern Matrix<double, 8, 3> neighbour;
  extern MatrixXi updated_region; */

  YAML::Node properties; // Perpare for loading param
  string properties_file_name;
  MatrixXd g, rhs, U;
  MatrixXi c, update_region;
  Matrix83 neighbour;


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