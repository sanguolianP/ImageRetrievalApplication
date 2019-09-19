#ifndef IMAGEPROCESS_H
#define IMAGEPROCESS_H

#include <QObject>
#include <QFileDialog>
#include <QDebug>
#include <QtQuick>
#include <QApplication>
#include <QString>
#include <QMap>

#include <vector>
#include <iostream>
#include <fstream>
using namespace std;

#include "opencv2/opencv.hpp"
#include "opencv2/xfeatures2d.hpp"
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/xfeatures2d/nonfree.hpp>
#include <opencv2/ml/ml.hpp>
using namespace cv;
using namespace cv::xfeatures2d;

typedef vector<vector<int> > VecGLCM;
typedef struct _GCLMFeatures
{
    _GCLMFeatures()
        :energy(0.0)
        ,entropy(0.0)
        ,constrast(0.0)
        ,idMoment(0.0)
    {}

    double energy;     //能量
    double entropy;    //熵
    double constrast;  //对比度
    double idMoment;   //逆差分矩

}GLCMFeatures;

typedef struct FileMap
{
    FileMap()
        :originId(0)
        ,filePath("")
        ,fileName("")
        ,fileSuffix("")
        ,finalFeatureDis(0.0)
    {}

    int originId;
    QString filePath;
    QString fileName;
    QString fileSuffix;
    double finalFeatureDis;

}FILEMAP;

class ImageProcess: public QQuickItem
{
    Q_OBJECT
public:
    ImageProcess();
    ~ImageProcess();

public:

    Q_INVOKABLE QImage openImage();
    Q_INVOKABLE QImage processImage();
    Q_INVOKABLE int getGlobalWidth();
    Q_INVOKABLE int getGlobalHeight();

public:

//    ImageProcess imgPro;
    QImage imageRes;

    //颜色直方图
    int hisSize[1],hisWidth,hisHeight;  //直方图大小、宽、高
    float range[2];                     //直方图取值范围
    const float *ranges;                //
    Mat channelsRGB[3];                 //分离后的RGB通道
    Mat outputRGB[3];                   //输出直方图分量

    //灰度共生矩阵方向枚举
    enum
    {
        GLCM_HORIZONTAL = 0,  //水平
        GLCM_VERTICAL   = 1, //垂直
        GLCM_ANGLE_45   = 2,  //45°
        GLCM_ANGLE_135  = 3   //135°
    };

    FILEMAP fm;
    QMap<int, FILEMAP> fileMap;
    int fnmapIndex;



public:
    //打开显示图片
    void openImageCV(QString imgName);
    void cvShow(QString title, Mat img);

    //图像格式转换
    Mat qImage2cvMat(QImage img);
    QImage cvMat2qImage(Mat img);

/***颜色直方图***********************************************/
    void splitChannels(Mat image);
    void getHistogram();
    Mat HSVHist(Mat src);
    void displayHistogram();
    double compareColorHis(Mat h1, Mat h2);

/***灰度共生矩阵**********************************************/
    //计算灰度共生矩阵
    void calGLCM(Mat inputImage, VecGLCM& vecGLCM, int angle);
    //由灰度共生矩阵计算特征值
    void getGLCMFeatures(VecGLCM& vecGLCM, GLCMFeatures& features);
    //初始化共生矩阵
    void initGLCM(VecGLCM& vecGLCM, int size);
    //get、set共生矩阵灰度级
    void setGrayLevel(int gl);
    int getGrayLevel();

    //计算水平灰度共生矩阵
    void getHorizontalGLCM(VecGLCM& src, VecGLCM& dst, int imgWidth, int imgHeight);
    //计算垂直灰度共生矩阵
    void getVerticalGLCM(VecGLCM& src, VecGLCM& dst, int imgWidth, int imgHeight);
    //计算45°灰度共生矩阵
    void get45GLCM(VecGLCM& src, VecGLCM& dst, int imgWidth, int imgHeight);
    //计算135°灰度共生矩阵
    void get135GLCM(VecGLCM& src, VecGLCM& dst, int imgWidth, int imgHeight);
    //生成GLCM各参数综合的特征向量
    Mat genVecGLCM(Mat inputImg);
    //计算两图GLCM的距离
    double compareGLCM(Mat genVec1,Mat genVec2);
/***canny边缘检测********************************************/
    Mat CannyThreshold(Mat src);
    double CannyMatch(Mat src, Mat src2);

/***sift关键点检测********************************************/
    void SiftKeypoints(Mat src);
    //基于sift的BruteForce Match
    void BFKeypointsCalc(Mat src, Mat src2, int KpNum, bool RANSAC);
//    void debugFeatures();


    void searchFolder(QString path);
    void debugMap();
    void featureExtraction(QString path);

    void matToCSV(QString filename, Mat fm);

    Mat CSVToMat(QString csvfilename);

    double FeatureSum(double color, double clw, double gray, double grw, double canny, double cnw);



private:
    int grayLevel;//共生矩阵灰度级

signals:


};


#endif // IMAGEPROCESS_H
