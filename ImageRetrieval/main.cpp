#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QApplication>
#include <vector>

#include <QFile>
#include <QString>
const QString FILE_PATH_SAVECSV("../test.csv");

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

//    Mat img = imread("E:/proj/Github/ImageRetrievalApplication/ImageRetrieval/xl.jpg");
////    Mat img = imread("‪C:/Users/SanguolianP/Desktop/xl.jpg");
//    qDebug("edqwrdwer");
//    imshow("Image", img);
//    qDebug("222222222");

    ImageProcess *ip = new ImageProcess();

    qDebug()<<ip->hisWidth;

    imageGlobal = QImage("../data/carpet7.jpg");
    //相对路径是相对于.exe来说的，所以图片应该放在bin目录下，../表示上一级目录

    Mat img = ip->qImage2cvMat(imageGlobal);
    Mat img2 = imread("../data/carpet8.jpg");

    //imshow("qImage2cvMat", img);

//    QString line0("0,aaa,000\n");
//    QString line1("1,bb,123456,999,888,777\n");
//    QString line2("2,ccccccccccc,4567890000045232\n");
//    QFile csvFile(FILE_PATH_SAVECSV);

//    if(csvFile.open(QIODevice::ReadWrite))
//    {
//        csvFile.write(line0.toUtf8());
//        csvFile.write(line1.toUtf8());
//        csvFile.write(line2.toUtf8());
//        csvFile.close();
//    }

//    qDebug("dwqwaee");
/***ColorHistogram*******************************************/
//    qDebug(">>>>HIST START>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
//    ip->splitChannels(img);
//    ip->getHistogram();
//    ip->displayHistogram();

//    qDebug("Hist DONE!");

/***GLCM****************************************************/
//    qDebug(">>>>GLCM START>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
//    VecGLCM vec;
//    GLCMFeatures features;

//    ip->initGLCM(vec,16);

//    qDebug()<<vec;
//    qDebug("1111111111");
//    qDebug()<<img.channels();


//    cvtColor(img, img, COLOR_RGB2GRAY);

//    qDebug()<<img.channels();
//    qDebug("2222222222");
//    qDebug()<<img.rows<<"   "<<img.cols;
//    qDebug("3333333333");

//    imshow("oneChannel", img);


//    qDebug("66666666");

//    ip->calGLCM(img, vec, ImageProcess::GLCM_HORIZONTAL);
//    ip->getGLCMFeatures(vec, features);
//    double energy_hor = features.energy;
//    double entropy_hor = features.entropy;
//    double constrast_hor = features.constrast;
//    double idMoment_hor = features.idMoment;
//    qDebug()<<"energy_hor"<<features.energy;
//    qDebug()<<"entropy_hor"<<features.entropy;
//    qDebug()<<"constrast_hor"<<features.constrast;
//    qDebug()<<"idMoment_hor"<<features.idMoment<<endl;

//    ip->calGLCM(img, vec, ImageProcess::GLCM_VERTICAL);
//    ip->getGLCMFeatures(vec, features);
//    double energy_ver = features.energy;
//    double entropy_ver = features.entropy;
//    double constrast_ver = features.constrast;
//    double idMoment_ver = features.idMoment;
//    qDebug()<<"energy_ver"<<features.energy;
//    qDebug()<<"entropy_ver"<<features.entropy;
//    qDebug()<<"constrast_ver"<<features.constrast;
//    qDebug()<<"idMoment_ver"<<features.idMoment<<endl;

//    ip->calGLCM(img, vec, ImageProcess::GLCM_ANGLE_45);
//    ip->getGLCMFeatures(vec, features);
//    double energy_45 = features.energy;
//    double entropy_45 = features.entropy;
//    double constrast_45 = features.constrast;
//    double idMoment_45 = features.idMoment;
//    qDebug()<<"energy_45"<<features.energy;
//    qDebug()<<"entropy_45"<<features.entropy;
//    qDebug()<<"constrast_45"<<features.constrast;
//    qDebug()<<"idMoment_45"<<features.idMoment<<endl;

//    ip->calGLCM(img, vec, ImageProcess::GLCM_ANGLE_135);
//    ip->getGLCMFeatures(vec, features);
//    double energy_135 = features.energy;
//    double entropy_135 = features.entropy;
//    double constrast_135 = features.constrast;
//    double idMoment_135 = features.idMoment;
//    qDebug()<<"energy_135"<<features.energy;
//    qDebug()<<"entropy_135"<<features.entropy;
//    qDebug()<<"constrast_135"<<features.constrast;
//    qDebug()<<"idMoment_135"<<features.idMoment<<endl;

//    double energy_anverage = (energy_hor+energy_ver+energy_45+energy_135)/4;
//    double entropy_anverage = (entropy_hor+entropy_ver+entropy_45+entropy_135)/4;
//    double constrast_anverage = (constrast_hor+constrast_ver+constrast_45+constrast_135)/4;
//    double idMoment_anverage = (idMoment_hor+idMoment_ver+idMoment_45+idMoment_135)/4;
//    qDebug()<<"energy_anverage"<< energy_anverage;
//    qDebug()<<"entropy_anverage"<< entropy_anverage;
//    qDebug()<<"constrast_anverage"<< constrast_anverage;
//    qDebug()<<"idMoment_anverage"<< idMoment_anverage<<endl;

//    qDebug("GLCM DONE!");
/***Canny******************************************************/
//    ip->CannyThreshold(img);
//    ip->CannyMatch(img,img2);



/***SIFT*******************************************************/
//    qDebug(">>>>SIFT START>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
//    ip->SiftKeypoints(img);
//    ip->BFKeypointsCalc(img,img2,0);
//    qDebug("SIFT DONE!");
/*************************************************************/

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
