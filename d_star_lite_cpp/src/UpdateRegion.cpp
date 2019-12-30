#include "../include/main.h"
#include "../include/Initialize.h"
#include "../include/UpdateRegion.h"

/* Parameters Declarations */


/* Matrix Declarations */

/* Function Declarations */
MatrixXi UpdateRegion(Region region)
{
    MatrixXi updated_region;
    MatrixXi new_obstacle;
    MatrixXi new_free;
    //region状态机
    if (side == 'R')
    {
        //F1 Zone
        if ((region.F1.last_name == SHOOT_FREE || region.F1.last_name == MOVE_FREE || region.F1.last_name == BLUE_REGENERATION) && (region.F1.name != SHOOT_FREE && region.F1.name != MOVE_FREE && region.F1.name != BLUE_REGENERATION))
        {
            MatrixVerticalSplice(new_free, region.F1.cover);
        }
        if ((region.F1.last_name != SHOOT_FREE && region.F1.last_name != MOVE_FREE && region.F1.last_name != BLUE_REGENERATION) && (region.F1.name == SHOOT_FREE || region.F1.name == MOVE_FREE || region.F1.name == BLUE_REGENERATION))
        {
            MatrixVerticalSplice(new_obstacle, region.F1.cover);
        }
        //F2 Zone
        if ((region.F2.last_name == SHOOT_FREE || region.F2.last_name == MOVE_FREE || region.F2.last_name == BLUE_REGENERATION) && (region.F2.name != SHOOT_FREE && region.F2.name != MOVE_FREE && region.F2.name != BLUE_REGENERATION))
        {
            MatrixVerticalSplice(new_free, region.F2.cover);
        }
        if ((region.F2.last_name != SHOOT_FREE && region.F2.last_name != MOVE_FREE && region.F2.last_name != BLUE_REGENERATION) && (region.F2.name == SHOOT_FREE || region.F2.name == MOVE_FREE || region.F2.name == BLUE_REGENERATION))
        {
            MatrixVerticalSplice(new_obstacle, region.F2.cover);
        }
        //F3 Zone
        if ((region.F3.last_name == SHOOT_FREE || region.F3.last_name == MOVE_FREE || region.F3.last_name == BLUE_REGENERATION) && (region.F3.name != SHOOT_FREE && region.F3.name != MOVE_FREE && region.F3.name != BLUE_REGENERATION))
        {
            MatrixVerticalSplice(new_free, region.F3.cover);
        }
        if ((region.F3.last_name != SHOOT_FREE && region.F3.last_name != MOVE_FREE && region.F3.last_name != BLUE_REGENERATION) && (region.F3.name == SHOOT_FREE || region.F3.name == MOVE_FREE || region.F3.name == BLUE_REGENERATION))
        {
            MatrixVerticalSplice(new_obstacle, region.F3.cover);
        }
        //F4 Zone
        if ((region.F4.last_name == SHOOT_FREE || region.F4.last_name == MOVE_FREE || region.F4.last_name == BLUE_REGENERATION) && (region.F4.name != SHOOT_FREE && region.F4.name != MOVE_FREE && region.F4.name != BLUE_REGENERATION))
        {
            MatrixVerticalSplice(new_free, region.F4.cover);
        }
        if ((region.F4.last_name != SHOOT_FREE && region.F4.last_name != MOVE_FREE && region.F4.last_name != BLUE_REGENERATION) && (region.F4.name == SHOOT_FREE || region.F4.name == MOVE_FREE || region.F4.name == BLUE_REGENERATION))
        {
            MatrixVerticalSplice(new_obstacle, region.F4.cover);
        }
        //F5 Zone
        if ((region.F5.last_name == SHOOT_FREE || region.F5.last_name == MOVE_FREE || region.F5.last_name == BLUE_REGENERATION) && (region.F5.name != SHOOT_FREE && region.F5.name != MOVE_FREE && region.F5.name != BLUE_REGENERATION))
        {
            MatrixVerticalSplice(new_free, region.F5.cover);
        }
        if ((region.F5.last_name != SHOOT_FREE && region.F5.last_name != MOVE_FREE && region.F5.last_name != BLUE_REGENERATION) && (region.F5.name == SHOOT_FREE || region.F5.name == MOVE_FREE || region.F5.name == BLUE_REGENERATION))
        {
            MatrixVerticalSplice(new_obstacle, region.F5.cover);
        }
        //F6 Zone
        if ((region.F6.last_name == SHOOT_FREE || region.F6.last_name == MOVE_FREE || region.F6.last_name == BLUE_REGENERATION) && (region.F6.name != SHOOT_FREE && region.F6.name != MOVE_FREE && region.F6.name != BLUE_REGENERATION))
        {
            MatrixVerticalSplice(new_free, region.F6.cover);
        }
        if ((region.F6.last_name != SHOOT_FREE && region.F6.last_name != MOVE_FREE && region.F6.last_name != BLUE_REGENERATION) && (region.F6.name == SHOOT_FREE || region.F6.name == MOVE_FREE || region.F6.name == BLUE_REGENERATION))
        {
            MatrixVerticalSplice(new_obstacle, region.F6.cover);
        }

    }
    else if (side == 'B')
    {
        //F1 Zone
        if ((region.F1.last_name == SHOOT_FREE || region.F1.last_name == MOVE_FREE || region.F1.last_name == RED_REGENERATION) && (region.F1.name != SHOOT_FREE && region.F1.name != MOVE_FREE && region.F1.name != RED_REGENERATION))
        {
            MatrixVerticalSplice(new_free, region.F1.cover);
        }
        if ((region.F1.last_name != SHOOT_FREE && region.F1.last_name != MOVE_FREE && region.F1.last_name != RED_REGENERATION) && (region.F1.name == SHOOT_FREE || region.F1.name == MOVE_FREE || region.F1.name == RED_REGENERATION))
        {
            MatrixVerticalSplice(new_obstacle, region.F1.cover);
        }
        //F2 Zone
        if ((region.F2.last_name == SHOOT_FREE || region.F2.last_name == MOVE_FREE || region.F2.last_name == RED_REGENERATION) && (region.F2.name != SHOOT_FREE && region.F2.name != MOVE_FREE && region.F2.name != RED_REGENERATION))
        {
            MatrixVerticalSplice(new_free, region.F2.cover);
        }
        if ((region.F2.last_name != SHOOT_FREE && region.F2.last_name != MOVE_FREE && region.F2.last_name != RED_REGENERATION) && (region.F2.name == SHOOT_FREE || region.F2.name == MOVE_FREE || region.F2.name == RED_REGENERATION))
        {
            MatrixVerticalSplice(new_obstacle, region.F2.cover);
        }
        //F3 Zone
        if ((region.F3.last_name == SHOOT_FREE || region.F3.last_name == MOVE_FREE || region.F3.last_name == RED_REGENERATION) && (region.F3.name != SHOOT_FREE && region.F3.name != MOVE_FREE && region.F3.name != RED_REGENERATION))
        {
            MatrixVerticalSplice(new_free, region.F3.cover);
        }
        if ((region.F3.last_name != SHOOT_FREE && region.F3.last_name != MOVE_FREE && region.F3.last_name != RED_REGENERATION) && (region.F3.name == SHOOT_FREE || region.F3.name == MOVE_FREE || region.F3.name == RED_REGENERATION))
        {
            MatrixVerticalSplice(new_obstacle, region.F3.cover);
        }
        //F4 Zone
        if ((region.F4.last_name == SHOOT_FREE || region.F4.last_name == MOVE_FREE || region.F4.last_name == RED_REGENERATION) && (region.F4.name != SHOOT_FREE && region.F4.name != MOVE_FREE && region.F4.name != RED_REGENERATION))
        {
            MatrixVerticalSplice(new_free, region.F4.cover);
        }
        if ((region.F4.last_name != SHOOT_FREE && region.F4.last_name != MOVE_FREE && region.F4.last_name != RED_REGENERATION) && (region.F4.name == SHOOT_FREE || region.F4.name == MOVE_FREE || region.F4.name == RED_REGENERATION))
        {
            MatrixVerticalSplice(new_obstacle, region.F4.cover);
        }
        //F5 Zone
        if ((region.F5.last_name == SHOOT_FREE || region.F5.last_name == MOVE_FREE || region.F5.last_name == RED_REGENERATION) && (region.F5.name != SHOOT_FREE && region.F5.name != MOVE_FREE && region.F5.name != RED_REGENERATION))
        {
            MatrixVerticalSplice(new_free, region.F5.cover);
        }
        if ((region.F5.last_name != SHOOT_FREE && region.F5.last_name != MOVE_FREE && region.F5.last_name != RED_REGENERATION) && (region.F5.name == SHOOT_FREE || region.F5.name == MOVE_FREE || region.F5.name == RED_REGENERATION))
        {
            MatrixVerticalSplice(new_obstacle, region.F5.cover);
        }
        //F6 Zone
        if ((region.F6.last_name == SHOOT_FREE || region.F6.last_name == MOVE_FREE || region.F6.last_name == RED_REGENERATION) && (region.F6.name != SHOOT_FREE && region.F6.name != MOVE_FREE && region.F6.name != RED_REGENERATION))
        {
            MatrixVerticalSplice(new_free, region.F6.cover);
        }
        if ((region.F6.last_name != SHOOT_FREE && region.F6.last_name != MOVE_FREE && region.F6.last_name != RED_REGENERATION) && (region.F6.name == SHOOT_FREE || region.F6.name == MOVE_FREE || region.F6.name == RED_REGENERATION))
        {
            MatrixVerticalSplice(new_obstacle, region.F6.cover);
        }
    }
    
    ///////////////////////////////////////////////////////////////////////////////////////////////
    //更新region cover的cost
    //标记障碍物
    int row_num = new_obstacle.rows();
    for (int i = 0; i < row_num; i++)
    {
        c(new_obstacle(i, 0), new_obstacle(i, 1)) = INF;
    }
    //标记自由区
    row_num = new_free.rows();
    for (int i = 0; i < row_num; i++)
    {
        c(new_free(i, 0), new_free(i, 1)) = 0;
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////

    appendCol(new_free, VectorXi::Zero(new_free.rows()));//插入0在最后一列
    appendCol(new_obstacle, VectorXi::Ones(new_obstacle.rows()));//插入1在最后一列
        
    //合并
    MatrixVerticalSplice(updated_region, new_free);
    MatrixVerticalSplice(updated_region, new_obstacle);

    return updated_region;
}