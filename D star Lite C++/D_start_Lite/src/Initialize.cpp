/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Initialize.cpp
 *
 * Code generation for function 'Initialize'
 *
 */

/* Include files */
#include "main.h"
#include "Initialize.h"
#include "GetBoundary.h"
#include "GetObstacleCover.h"


/* Parameters Declarations */
const double INF = 999.0;
const int robot_size = 45; //45cm as width
const int accuracy = 10; //10cm as one grid
const int xmax = 81 * 10 / accuracy + 1;
const int ymax = 51 * 10 / accuracy + 1;
double k_m = 0;

/* Matrix Declarations */
Matrix<double, Dynamic, Dynamic> g;
Matrix<double, Dynamic, Dynamic> rhs;
Matrix<double, Dynamic, Dynamic> c;
Matrix<double, Dynamic, Dynamic> U;
Matrix<int, 8, 2> neighbour;

/* Function Definitions */
void Initialize()
{
    g.setConstant(xmax + 1, ymax + 1, INF); // operation cost g
    rhs.setConstant(xmax + 1, ymax + 1, INF); // total cost rhs
    c.setZero(xmax + 1, ymax + 1); // movement cost c, used to determine obstacles
    neighbour << -1, 0, 
                 -1, 1, 
                  0, 1, 
                  1, 1, 
                  1, 0, 
                  1,-1, 
                  0,-1, 
                 -1,-1;
    //GetBoundary();
    GetObstacleCover();
    //标记障碍物
    int row_num = cover.rows();
    for (int i = 0; i < row_num; i++)
    { 
        c(cover(i, 0), cover(i, 1)) = INF;
    }
    //设置目标点rhs为0
    rhs(s_goal(0), s_goal(1)) = 0;
    //初始化U
    U.setZero(1, 4);
    U << s_goal(0), s_goal(1), (s_start - s_goal).norm(), 0;
}

//移除矩阵中指定行
void removeRow(MatrixXd& matrix, unsigned int rowToRemove)
{
    unsigned int numRows = matrix.rows() - 1;
    unsigned int numCols = matrix.cols();

    if (rowToRemove < numRows)
    {
        matrix.block(rowToRemove, 0, numRows - rowToRemove, numCols) = matrix.bottomRows(numRows - rowToRemove);
    }

    matrix.conservativeResize(numRows, numCols);
}

//移除矩阵中指定列
void removeColumn(MatrixXd& matrix, unsigned int colToRemove)
{
    unsigned int numRows = matrix.rows();
    unsigned int numCols = matrix.cols() - 1;

    if (colToRemove < numCols)
    {
        matrix.block(0, colToRemove, numRows, numCols - colToRemove) = matrix.rightCols(numCols - colToRemove);
    }

    matrix.conservativeResize(numRows, numCols);
}

//在矩阵最后一行插入向量
void appendRow(MatrixXd& matrix, RowVectorXd& vector)
{
    unsigned int numRows = matrix.rows() + 1;

    matrix.conservativeResize(numRows, NoChange);

    matrix.row(numRows-1) = vector;
}

/* End of code generation (Initialize.cpp) */
