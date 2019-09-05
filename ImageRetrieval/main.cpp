#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QApplication>

#include "myimageprovider.h"
#include "imageprocess.h"

#include "opencv2/opencv.hpp"
using namespace cv;

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



    ImageProcess *ip;

    ip = new ImageProcess();

    qDebug()<<ip->hisWidth;

    imageGlobal = QImage("../lena.jpg");
    //相对路径是相对于.exe来说的，所以图片应该放在bin目录下，../表示上一级目录

    Mat img = ip->qImage2cvMat(imageGlobal);

    imshow("qImage2cvMat", img);

    ip->splitChannels(img);
    ip->getHistogram();
    ip->displayHistogram();

    qDebug("DONE!");









    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
