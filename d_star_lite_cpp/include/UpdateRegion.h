#ifndef UPDATEREGION_H
#define UPDATEREGION_H

/* Include files */

/* Parameters Declarations */
typedef enum
{
    δ֪ = 0,
    �췽������,
    ��ֹ�����,
    ����������,
    ������Ѫ��,
    ��ֹ�ƶ���,
    �췽��Ѫ��,
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