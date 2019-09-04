#ifndef IMAGEPROCESS_H
#define IMAGEPROCESS_H


#include <QObject>
#include <QFileDialog>
#include <QDebug>
#include <QtQuick>

#include <QApplication>

#include "opencv2/opencv.hpp"
using namespace cv;

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

    QImage imageRes;

    //颜色直方图
    int hisSize[1],hisWidth,hisHeight;  //直方图大小、宽、高
    float range[2];                     //直方图取值范围
    const float *ranges;                //
    Mat channelsRGB[3];                 //分离后的RGB通道
    Mat outputRGB[3];                   //输出直方图分量

public:
    //打开显示图片
    void openImageCV(QString imgName);
    void cvShow(QString title, Mat img);

    //图像格式转换
    Mat qImage2cvMat(QImage img);
    QImage cvMat2qImage(Mat img);

    //颜色直方图
    void splitChannels(Mat image);
    void getHistogram();
    void displayHistogram();

signals:


};


#endif // IMAGEPROCESS_H
