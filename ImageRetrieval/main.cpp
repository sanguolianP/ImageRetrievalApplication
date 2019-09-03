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

//    Mat img = cv::imread("C:/Users/whjsdh/Desktop/lzc.bmp");
//    imshow("Image", img);

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
