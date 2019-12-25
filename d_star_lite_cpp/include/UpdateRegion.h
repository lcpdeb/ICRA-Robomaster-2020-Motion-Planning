#ifndef UPDATEREGION_H
#define UPDATEREGION_H

/* Include files */

/* Parameters Declarations */
typedef enum
{
    未知 = 0,
    红方补给区,
    禁止射击区,
    蓝方补给区,
    蓝方回血区,
    禁止移动区,
    红方回血区,
}Zone_name;
typedef struct
{
    Zone_name name;
    Zone_name last_name;
    Matrix<int, Dynamic, 2> cover;
    double x;
    double y;
}Zone;
typedef struct
{
    Zone F1;
    Zone F2;
    Zone F3;
    Zone F4;
    Zone F5;
    Zone F6;
}Region;

/* Matrix Declarations */

/* Function Declarations */
extern MatrixXi UpdateRegion(Region region);

#endif