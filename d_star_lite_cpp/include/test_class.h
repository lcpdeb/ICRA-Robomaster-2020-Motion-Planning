#ifndef TESTCLASS_H
#define TESTCLASS_H

#include <Eigen/Dense>
using namespace Eigen;

class BOX
{
    
    /*int cddd(int c, int d);*/
public:
    int x;
    int y;
    int z;
    int cddd(int c, int d);
    void bbbbbox();
};

/* Parameters Declarations */
extern char side;

/* Matrix Declarations */
extern RowVector2i s_start;
extern RowVector2i s_goal;

extern int show_answer(BOX box);
#endif