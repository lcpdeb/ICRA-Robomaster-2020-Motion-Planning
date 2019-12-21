/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Initialize.h
 *
 * Code generation for function 'Initialize'
 *
 */

#ifndef INITIALIZE_H
#define INITIALIZE_H

/* Include files */
#include <stddef.h>
#include <stdlib.h>
#include "rtwtypes.h"
#include <math.h>
#include <Eigen/Dense>
using namespace Eigen;


/* Parameters Declarations */
extern const double INF;
extern const int robot_size;
extern const int accuracy;
extern const int xmax;
extern const int ymax;
extern double k_m;

/* Matrix Declarations */
extern Matrix<double, Dynamic, Dynamic> g;
extern Matrix<double, Dynamic, Dynamic> rhs;
extern Matrix<double, Dynamic, Dynamic> c;
extern Matrix<double, Dynamic, Dynamic> U;
extern Matrix<int, 8, 2> neighbour;

/* Function Declarations */
extern void Initialize();
extern void removeRow(MatrixXd& matrix, unsigned int rowToRemove);
extern void removeColumn(MatrixXd& matrix, unsigned int colToRemove);
extern void appendRow(MatrixXd& matrix, RowVectorXd& vector);
#endif

/* End of code generation (Initialize.h) */
