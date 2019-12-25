/* Include files */
#include "navigation.h"
#include "Initialize.h"
#include "UpdateRegion.h"

/* Parameters Declarations */


/* Matrix Declarations */

/* Function Declarations */
MatrixXi UpdateRegion(Region region)
{
    MatrixXi updated_region;
    MatrixXi new_obstacle;
    MatrixXi new_free;
    //region״̬��
    if (side == 'R')
    {
        //F1 Zone
        if ((region.F1.last_name == ��ֹ����� || region.F1.last_name == ��ֹ�ƶ��� || region.F1.last_name == ������Ѫ��) && (region.F1.name != ��ֹ����� && region.F1.name != ��ֹ�ƶ��� && region.F1.name != ������Ѫ��))
        {
            MatrixVerticalSplice(new_free, region.F1.cover);
        }
        if ((region.F1.last_name != ��ֹ����� && region.F1.last_name != ��ֹ�ƶ��� && region.F1.last_name != ������Ѫ��) && (region.F1.name == ��ֹ����� || region.F1.name == ��ֹ�ƶ��� || region.F1.name == ������Ѫ��))
        {
            MatrixVerticalSplice(new_obstacle, region.F1.cover);
        }
        //F2 Zone
        if ((region.F2.last_name == ��ֹ����� || region.F2.last_name == ��ֹ�ƶ��� || region.F2.last_name == ������Ѫ��) && (region.F2.name != ��ֹ����� && region.F2.name != ��ֹ�ƶ��� && region.F2.name != ������Ѫ��))
        {
            MatrixVerticalSplice(new_free, region.F2.cover);
        }
        if ((region.F2.last_name != ��ֹ����� && region.F2.last_name != ��ֹ�ƶ��� && region.F2.last_name != ������Ѫ��) && (region.F2.name == ��ֹ����� || region.F2.name == ��ֹ�ƶ��� || region.F2.name == ������Ѫ��))
        {
            MatrixVerticalSplice(new_obstacle, region.F2.cover);
        }
        //F3 Zone
        if ((region.F3.last_name == ��ֹ����� || region.F3.last_name == ��ֹ�ƶ��� || region.F3.last_name == ������Ѫ��) && (region.F3.name != ��ֹ����� && region.F3.name != ��ֹ�ƶ��� && region.F3.name != ������Ѫ��))
        {
            MatrixVerticalSplice(new_free, region.F3.cover);
        }
        if ((region.F3.last_name != ��ֹ����� && region.F3.last_name != ��ֹ�ƶ��� && region.F3.last_name != ������Ѫ��) && (region.F3.name == ��ֹ����� || region.F3.name == ��ֹ�ƶ��� || region.F3.name == ������Ѫ��))
        {
            MatrixVerticalSplice(new_obstacle, region.F3.cover);
        }
        //F4 Zone
        if ((region.F4.last_name == ��ֹ����� || region.F4.last_name == ��ֹ�ƶ��� || region.F4.last_name == ������Ѫ��) && (region.F4.name != ��ֹ����� && region.F4.name != ��ֹ�ƶ��� && region.F4.name != ������Ѫ��))
        {
            MatrixVerticalSplice(new_free, region.F4.cover);
        }
        if ((region.F4.last_name != ��ֹ����� && region.F4.last_name != ��ֹ�ƶ��� && region.F4.last_name != ������Ѫ��) && (region.F4.name == ��ֹ����� || region.F4.name == ��ֹ�ƶ��� || region.F4.name == ������Ѫ��))
        {
            MatrixVerticalSplice(new_obstacle, region.F4.cover);
        }
        //F5 Zone
        if ((region.F5.last_name == ��ֹ����� || region.F5.last_name == ��ֹ�ƶ��� || region.F5.last_name == ������Ѫ��) && (region.F5.name != ��ֹ����� && region.F5.name != ��ֹ�ƶ��� && region.F5.name != ������Ѫ��))
        {
            MatrixVerticalSplice(new_free, region.F5.cover);
        }
        if ((region.F5.last_name != ��ֹ����� && region.F5.last_name != ��ֹ�ƶ��� && region.F5.last_name != ������Ѫ��) && (region.F5.name == ��ֹ����� || region.F5.name == ��ֹ�ƶ��� || region.F5.name == ������Ѫ��))
        {
            MatrixVerticalSplice(new_obstacle, region.F5.cover);
        }
        //F6 Zone
        if ((region.F6.last_name == ��ֹ����� || region.F6.last_name == ��ֹ�ƶ��� || region.F6.last_name == ������Ѫ��) && (region.F6.name != ��ֹ����� && region.F6.name != ��ֹ�ƶ��� && region.F6.name != ������Ѫ��))
        {
            MatrixVerticalSplice(new_free, region.F6.cover);
        }
        if ((region.F6.last_name != ��ֹ����� && region.F6.last_name != ��ֹ�ƶ��� && region.F6.last_name != ������Ѫ��) && (region.F6.name == ��ֹ����� || region.F6.name == ��ֹ�ƶ��� || region.F6.name == ������Ѫ��))
        {
            MatrixVerticalSplice(new_obstacle, region.F6.cover);
        }

    }
    else if (side == 'B')
    {
        //F1 Zone
        if ((region.F1.last_name == ��ֹ����� || region.F1.last_name == ��ֹ�ƶ��� || region.F1.last_name == �췽��Ѫ��) && (region.F1.name != ��ֹ����� && region.F1.name != ��ֹ�ƶ��� && region.F1.name != �췽��Ѫ��))
        {
            MatrixVerticalSplice(new_free, region.F1.cover);
        }
        if ((region.F1.last_name != ��ֹ����� && region.F1.last_name != ��ֹ�ƶ��� && region.F1.last_name != �췽��Ѫ��) && (region.F1.name == ��ֹ����� || region.F1.name == ��ֹ�ƶ��� || region.F1.name == �췽��Ѫ��))
        {
            MatrixVerticalSplice(new_obstacle, region.F1.cover);
        }
        //F2 Zone
        if ((region.F2.last_name == ��ֹ����� || region.F2.last_name == ��ֹ�ƶ��� || region.F2.last_name == �췽��Ѫ��) && (region.F2.name != ��ֹ����� && region.F2.name != ��ֹ�ƶ��� && region.F2.name != �췽��Ѫ��))
        {
            MatrixVerticalSplice(new_free, region.F2.cover);
        }
        if ((region.F2.last_name != ��ֹ����� && region.F2.last_name != ��ֹ�ƶ��� && region.F2.last_name != �췽��Ѫ��) && (region.F2.name == ��ֹ����� || region.F2.name == ��ֹ�ƶ��� || region.F2.name == �췽��Ѫ��))
        {
            MatrixVerticalSplice(new_obstacle, region.F2.cover);
        }
        //F3 Zone
        if ((region.F3.last_name == ��ֹ����� || region.F3.last_name == ��ֹ�ƶ��� || region.F3.last_name == �췽��Ѫ��) && (region.F3.name != ��ֹ����� && region.F3.name != ��ֹ�ƶ��� && region.F3.name != �췽��Ѫ��))
        {
            MatrixVerticalSplice(new_free, region.F3.cover);
        }
        if ((region.F3.last_name != ��ֹ����� && region.F3.last_name != ��ֹ�ƶ��� && region.F3.last_name != �췽��Ѫ��) && (region.F3.name == ��ֹ����� || region.F3.name == ��ֹ�ƶ��� || region.F3.name == �췽��Ѫ��))
        {
            MatrixVerticalSplice(new_obstacle, region.F3.cover);
        }
        //F4 Zone
        if ((region.F4.last_name == ��ֹ����� || region.F4.last_name == ��ֹ�ƶ��� || region.F4.last_name == �췽��Ѫ��) && (region.F4.name != ��ֹ����� && region.F4.name != ��ֹ�ƶ��� && region.F4.name != �췽��Ѫ��))
        {
            MatrixVerticalSplice(new_free, region.F4.cover);
        }
        if ((region.F4.last_name != ��ֹ����� && region.F4.last_name != ��ֹ�ƶ��� && region.F4.last_name != �췽��Ѫ��) && (region.F4.name == ��ֹ����� || region.F4.name == ��ֹ�ƶ��� || region.F4.name == �췽��Ѫ��))
        {
            MatrixVerticalSplice(new_obstacle, region.F4.cover);
        }
        //F5 Zone
        if ((region.F5.last_name == ��ֹ����� || region.F5.last_name == ��ֹ�ƶ��� || region.F5.last_name == �췽��Ѫ��) && (region.F5.name != ��ֹ����� && region.F5.name != ��ֹ�ƶ��� && region.F5.name != �췽��Ѫ��))
        {
            MatrixVerticalSplice(new_free, region.F5.cover);
        }
        if ((region.F5.last_name != ��ֹ����� && region.F5.last_name != ��ֹ�ƶ��� && region.F5.last_name != �췽��Ѫ��) && (region.F5.name == ��ֹ����� || region.F5.name == ��ֹ�ƶ��� || region.F5.name == �췽��Ѫ��))
        {
            MatrixVerticalSplice(new_obstacle, region.F5.cover);
        }
        //F6 Zone
        if ((region.F6.last_name == ��ֹ����� || region.F6.last_name == ��ֹ�ƶ��� || region.F6.last_name == �췽��Ѫ��) && (region.F6.name != ��ֹ����� && region.F6.name != ��ֹ�ƶ��� && region.F6.name != �췽��Ѫ��))
        {
            MatrixVerticalSplice(new_free, region.F6.cover);
        }
        if ((region.F6.last_name != ��ֹ����� && region.F6.last_name != ��ֹ�ƶ��� && region.F6.last_name != �췽��Ѫ��) && (region.F6.name == ��ֹ����� || region.F6.name == ��ֹ�ƶ��� || region.F6.name == �췽��Ѫ��))
        {
            MatrixVerticalSplice(new_obstacle, region.F6.cover);
        }
    }
    
    ///////////////////////////////////////////////////////////////////////////////////////////////
    //����region cover��cost
    //����ϰ���
    int row_num = new_obstacle.rows();
    for (int i = 0; i < row_num; i++)
    {
        c(new_obstacle(i, 0), new_obstacle(i, 1)) = INF;
    }
    //���������
    row_num = new_free.rows();
    for (int i = 0; i < row_num; i++)
    {
        c(new_free(i, 0), new_free(i, 1)) = 0;
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////

    appendCol(new_free, VectorXi::Zero(new_free.rows()));//����0�����һ��
    appendCol(new_obstacle, VectorXi::Ones(new_obstacle.rows()));//����1�����һ��
        
    //�ϲ�
    MatrixVerticalSplice(updated_region, new_free);
    MatrixVerticalSplice(updated_region, new_obstacle);

    return updated_region;
}