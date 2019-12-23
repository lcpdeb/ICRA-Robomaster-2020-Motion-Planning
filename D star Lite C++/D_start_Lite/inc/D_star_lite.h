#ifndef DSTARLITE_H
#define DSTARLITE_H

/* Include files */

/* Parameters Declarations */
extern char side;

/* Matrix Declarations */
extern RowVector2d s_start;
extern RowVector2d s_goal;

/* Function Declarations */
MatrixXd D_start_lite(char side, int goal[2], int start[2]);
#endif