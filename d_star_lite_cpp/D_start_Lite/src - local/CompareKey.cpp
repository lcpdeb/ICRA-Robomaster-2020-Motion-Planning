/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * CompareKey.cpp
 *
 * Code generation for function 'CompareKey'
 *
 */

/* Include files */
#include "main.h"
#include "Initialize.h"
#include "CompareKey.h"

/* Parameters Declarations */

/* Matrix Declarations */

/* Function Definitions */
// key值比较,<PrimaryKey则返回1，否则比较<=SecondaryKey
bool CompareKey(RowVector2d key1, RowVector2d key2)
{

  if (key1(0) < key2(0)) 
  {
    return true;
  } 
  else 
  {
    if ((key1(0) == key2(0)) && (key1(1) < key2(1))) 
    {
        return true;
    }
  }

  return false;
}

/* End of code generation (CompareKey.cpp) */
