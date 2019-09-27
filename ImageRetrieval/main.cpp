#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QApplication>
#include <vector>

#include <QFile>
#include <QString>

#include "myimageprovider.h"
#include "imageprocess.h"

#include "opencv2/opencv.hpp"
#include "opencv2/xfeatures2d.hpp"

using namespace cv;
using namespace cv::xfeatures2d;
using namespace std;

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setOrganizationName("something");

    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<ImageProcess>("Imagepro", 1, 1, "ImageProItem");

    engine.addImageProvider(QLatin1String("imgProvider"), new MyImageProvider);

    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));


/*************************************************************************/
    ImageProcess *ip = new ImageProcess();

    imageGlobal = QImage("../10/1.jpg");
    //相对路径是相对于.exe来说的，所以图片应该放在bin目录下，../表示上一级目录

    Mat img = ip->qImage2cvMat(imageGlobal);
    Mat img2 = imread("../data/carpet1.jpg");


//    ip->searchFolder("../10");

//    ip->debugMap();

////    ip->featureExtraction("../10");

//    ip->calcDistance("../10", 1.0, 1.0, 1.0);

//    ip->debugMap();

//    ip->rank();

//    ip->DebugRankMap();
//    //        qDebug()<<ip->rankRes<<endl;
//    for(int i =0;i<10;i++){
//        qDebug()<<ip->getImgPath(i)<<endl;
//    }

/***ColorHistogram*******************************************/
//    qDebug(">>>>HIST START>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
//    ip->splitChannels(img);
//    ip->getHistogram();
//    ip->displayHistogram();
//    qDebug("Hist DONE!");

//    ip->compareColorHis(ip->HSVHist(img), ip->HSVHist(img2));

/***GLCM****************************************************/
//    Mat GLCMimg1 = ip->genVecGLCM(img);
//    Mat GLCMimg2 = ip->genVecGLCM(img2);
//    ip->compareGLCM(GLCMimg1, GLCMimg2);

/***Canny******************************************************/
//    qDebug()<<"img.channels"<<img.channels()<<endl;
//    qDebug()<<"img2.channels"<<img2.channels()<<endl;
//    ip->CannyThreshold(img);
//    ip->CannyMatch(img,img2);
//    qDebug()<<"img.channels"<<img.channels()<<endl;
//    qDebug()<<"img2.channels"<<img2.channels()<<endl;

/***SIFT*******************************************************/
//    qDebug(">>>>SIFT START>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
//    ip->SiftKeypoints(img);
//    qDebug()<<ip->BFKeypointsCalc(ip->SiftKeypoints(img,150), ip->SiftKeypoints(img2,150),0);
//    qDebug("SIFT DONE!");

/*************************************************************************/

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
