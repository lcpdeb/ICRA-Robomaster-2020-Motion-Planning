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
#include "Updateregion.h"


/* Parameters Declarations */
const int INF = 999;
const int robot_size = 45; //45cm as width
const int accuracy = 10; //10cm as one grid
const int xmax = 81 * 10 / accuracy + 1;
const int ymax = 51 * 10 / accuracy + 1;
double k_m = 0;
extern Region region;//调用

/* Matrix Declarations */
Matrix<double, Dynamic, Dynamic> g;
Matrix<double, Dynamic, Dynamic> rhs;
Matrix<int, Dynamic, Dynamic> c;
Matrix<double, Dynamic, Dynamic> U;
Matrix<double, 8, 3> neighbour;
MatrixXi updated_region;

/* Function Definitions */
void Initialize()
{
    g.setConstant(xmax + 1, ymax + 1, INF); // operation cost g
    rhs.setConstant(xmax + 1, ymax + 1, INF); // total cost rhs
    c.setZero(xmax + 1, ymax + 1); // movement cost c, used to determine obstacles
    neighbour << -1,  0, 1,
                 -1,  1, 1.414213,
                  0,  1, 1,
                  1,  1, 1.414213,
                  1,  0, 1,
                  1, -1, 1.414213,
                  0, -1, 1,
                 -1, -1, 1.414213;
    //GetBoundary();
    GetObstacleCover();
    //初始化region
    region.F1.name = 红方补给区;
    region.F1.last_name = 未知;
    region.F1.x = 2.3 * 10 / accuracy + 1;
    region.F1.y = 31.2 * 10 / accuracy + 1;
    region.F1.cover.setZero(15, 2);
    region.F1.cover <<  3,  30,
                        4,  30,
                        5,  30,
                        6,  30,
                        7,  30,
                        8,  30,
                        9,  30,
                        10, 30,
                        11, 30,
                        11, 31,
                        11, 32,
                        11, 33,
                        11, 34,
                        11, 35,
                        11, 36;

    region.F2.name = 禁止射击区;
    region.F2.last_name = 未知;
    region.F2.x = 16.3 * 10 / accuracy + 1;
    region.F2.y = 16.95 * 10 / accuracy + 1;
    region.F2.cover.setZero(25, 2);
    region.F2.cover <<  15,	16,
                        16,	16,
                        17,	16,
                        18,	16,
                        19,	16,
                        20,	16,
                        21,	16,
                        22,	16,
                        23,	16,
                        24,	16,
                        25,	16,
                        15,	16,
                        25,	16,
                        15,	17,
                        25,	17,
                        15,	18,
                        25,	18,
                        15,	19,
                        25,	19,
                        15,	20,
                        25,	20,
                        15,	21,
                        25,	21,
                        15,	22,
                        25,	22;

    region.F3.name = 蓝方补给区;
    region.F3.last_name = 未知;
    region.F3.x = (81 - 38.3 - 5.4) * 10 / accuracy + 1;
    region.F3.y = (51 - 2.7 - 4.8) * 10 / accuracy + 1;
    region.F3.cover.setZero(12, 2);
    region.F3.cover <<  36,	45,
                        46,	45,
                        36,	46,
                        46,	46,
                        36,	47,
                        46,	47,
                        36,	48,
                        46,	48,
                        36,	49,
                        46,	49,
                        36,	50,
                        46,	50;

    region.F4.name = 蓝方回血区;
    region.F4.last_name = 未知;
    region.F4.x = (81 - 2.3 - 5.4) * 10 / accuracy + 1;
    region.F4.y = (51 - 31.2 - 4.8) * 10 / accuracy + 1;
    region.F4.cover.setZero(15, 2);
    region.F4.cover <<  72,	23,
                        73,	23,
                        74,	23,
                        75,	23,
                        76,	23,
                        77,	23,
                        78,	23,
                        79,	23,
                        80,	23,
                        72,	17,
                        72,	18,
                        72,	19,
                        72,	20,
                        72,	21,
                        72,	22;

    region.F5.name = 禁止移动区;
    region.F5.last_name = 未知;
    region.F5.x = (81 - 16.3 - 5.4) * 10 / accuracy + 1;
    region.F5.y = (51 - 16.95 - 4.8) * 10 / accuracy + 1;
    region.F5.cover.setZero(25, 2);
    region.F5.cover <<  58,	37,
                        59,	37,
                        60,	37,
                        61,	37,
                        62,	37,
                        63,	37,
                        64,	37,
                        65,	37,
                        66,	37,
                        67,	37,
                        68,	37,
                        58,	31,
                        68,	31,
                        58,	32,
                        68,	32,
                        58,	33,
                        68,	33,
                        58,	34,
                        68,	34,
                        58,	35,
                        68,	35,
                        58,	36,
                        68,	36,
                        58,	37,
                        68,	37;

    region.F6.name = 红方回血区;
    region.F6.last_name = 未知;
    region.F6.x = 38.3 * 10 / accuracy + 1;
    region.F6.y = 2.7 * 10 / accuracy + 1;
    region.F6.cover.setZero(12, 2);
    region.F6.cover <<  37,	3,
                        47,	3,
                        37,	4,
                        47,	4,
                        37,	5,
                        47,	5,
                        37,	6,
                        47,	6,
                        37,	7,
                        47,	7,
                        37,	8,
                        47,	8;

    //更新region
    updated_region=UpdateRegion(region);

    //储存region状态机
    region.F1.last_name = region.F1.name;
    region.F2.last_name = region.F2.name;
    region.F3.last_name = region.F3.name;
    region.F4.last_name = region.F4.name;
    region.F5.last_name = region.F5.name;
    region.F6.last_name = region.F6.name;


    //标记障碍物
    static int row_num = cover.rows();
    for (int i = 0; i < row_num; i++)
    { 
        c(cover(i, 0), cover(i, 1)) = INF;
    }
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
void appendRow(MatrixXd& matrix, RowVectorXd vector)
{
    unsigned int numRows = matrix.rows() + 1;

    matrix.conservativeResize(numRows, NoChange);

    matrix.row(numRows - 1) = vector;
}

//在矩阵最后一列插入向量，仅用于UpdateVertx
void appendCol(MatrixXi& matrix, VectorXi vector)
{
    unsigned int numCols = matrix.cols() + 1;

    matrix.conservativeResize(NoChange, numCols);

    matrix.col(numCols - 1) = vector;
}
                                                                  
//矩阵垂直拼接，在matrix1下拼接matrix2，只修改matrix1，仅用于UpdateVertx
void MatrixVerticalSplice(MatrixXi& matrix1, MatrixXi matrix2)
{
    unsigned int numRows = matrix1.rows() + matrix2.rows();
    unsigned int numCols = matrix2.cols();
    MatrixXi temp_matrix;

    temp_matrix.conservativeResize(numRows, numCols);

    //matrix1和matrix2都不是空
    if (matrix1.rows() && matrix2.rows())
    {
        temp_matrix <<  matrix1,
                        matrix2;
    }
    //matrix1不是空，matrix2是空
    else if(matrix1.rows() && !matrix2.rows())
    {
        temp_matrix = matrix1;
    }
    //matrix1是空，matrix2不是空
    else if (!matrix1.rows() && matrix2.rows())
    {
        temp_matrix = matrix2;
    }
    //matrix1和matrix2都是空
    else
    {
        return;
    }

    matrix1.conservativeResize(numRows, NoChange);
    matrix1 = temp_matrix;
}


/* End of code generation (Initialize.cpp) */
