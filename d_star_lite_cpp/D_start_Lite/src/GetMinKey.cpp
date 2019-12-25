/* Include files */
#include "test_class.h"
#include "Initialize.h"
#include "GetMinKey.h"

/* Parameters Declarations */
static const int PrimaryKeyIndex = 2;
static const int SecondaryKeyIndex = 3;
static int minKeyIndex, tempKeyIndex;
static double minPrimaryKey, minSecondaryKey;
static int list_length;

/* Matrix Declarations */
static RowVector3d minKey;
static MatrixXd temp_list;
static RowVectorXd temp_row;
static VectorXd primary_list;
static VectorXd secondary_list;

/* Function Declarations */

// �ҵ���СKeyֵ������minKey��minKeyIndex
RowVector3d GetMinKey(MatrixXd list)
{
    list_length = list.rows();
    // ���list���ǿռ�
    if (list_length)
    {
        // ��list�����PrimaryKey��һ��
        primary_list = list.col(PrimaryKeyIndex).array();

        // �ҵ���СPrimaryKey
        minPrimaryKey = primary_list.minCoeff(&minKeyIndex);
        temp_list.setConstant(1, 4, INF);//��ʼ��temp_list

        for (int i = 0; i < list_length; i++)
        {
            // ����list���ҵ�������ͬPrimayKey���������Ž�temp list��
            if (list(i,PrimaryKeyIndex) == minPrimaryKey)
            {
                temp_row = list.row(i).array();
                appendRow(temp_list, temp_row);
            }
        }
        
        // ��temp list�����SecondaryKey��һ��
        secondary_list = temp_list.col(SecondaryKeyIndex).array();
        
        // �ҵ���СSecondaryKey
        minSecondaryKey = secondary_list.minCoeff(&tempKeyIndex);

        //����minKeyIndex
        minKeyIndex = minKeyIndex + tempKeyIndex - 1;

        minKey << minPrimaryKey, minSecondaryKey, minKeyIndex;
    }
    // ���򷵻�INF
    else
    {
        minKey << INF, INF, INF;
    }

    return minKey;
};