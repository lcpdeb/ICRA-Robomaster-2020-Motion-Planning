// main.cpp : This file contains the 'main' function. Program execution begins and ends there.
//
/* Include files */
#include <iostream>
#include <stdio.h>

#include "test_class.h"

/* Parameters Declarations */
BOX box2;

/* Matrix Declarations */

/* Function Declarations */
int main()
{
    box2.x = 7;
    box2.y = 8;
    std::cout << show_answer(box2) << std::endl;
    box2.bbbbbox();
    return 0;
}

