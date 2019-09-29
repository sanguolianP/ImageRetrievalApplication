#include "myimageprovider.h"
#include "imageprocess.h"

MyImageProvider::MyImageProvider() : QQuickImageProvider(QQuickImageProvider::Pixmap)
{

}

QPixmap MyImageProvider::requestPixmap(const QString &id, QSize *size, const QSize &requestedSize)
{
    int width = 100;
    int height = 50;

    if (size)
        *size = QSize(width, height);
    QPixmap pixmap(requestedSize.width() > 0 ? requestedSize.width() : width,
                   requestedSize.height() > 0 ? requestedSize.height() : height);

    ImageProcess *ip = new ImageProcess();

    if(id == "hello")
    {
        QImage img;

        if(imageGlobal.isNull())
        {
            img = QImage("../qml/images/MainInterface/left/image.png");
        }else {
            img = imageGlobal;
        }

        pixmap = QPixmap::fromImage(img);

    }else if(id == "0")
    {
        QString oneImgPath = ip->getImgPath(0);
//        qDebug()<<"oneImagePath0: "<< oneImgPath<<endl;
        if(oneImgPath == "")
        {
            oneImgPath = "../qml/images/MainInterface/left/image.png";
        }
        QImage img = QImage(oneImgPath);
        pixmap = QPixmap::fromImage(img);
    }else if(id == "1")
    {
        QString oneImgPath = ip->getImgPath(1);
//        qDebug()<<"oneImagePath1: "<< oneImgPath<<endl;
        if(oneImgPath == "")
        {
            oneImgPath = "../qml/images/MainInterface/left/image.png";
        }
        QImage img = QImage(oneImgPath);
        pixmap = QPixmap::fromImage(img);
    }else if(id == "2")
    {
        QString oneImgPath = ip->getImgPath(2);
//        qDebug()<<"oneImagePath2: "<< oneImgPath<<endl;
        if(oneImgPath == "")
        {
            oneImgPath = "../qml/images/MainInterface/left/image.png";
        }
        QImage img = QImage(oneImgPath);
        pixmap = QPixmap::fromImage(img);
    }else if(id == "3")
    {
        QString oneImgPath = ip->getImgPath(3);
//        qDebug()<<"oneImagePath3: "<< oneImgPath<<endl;
        if(oneImgPath == "")
        {
            oneImgPath = "../qml/images/MainInterface/left/image.png";
        }
        QImage img = QImage(oneImgPath);
        pixmap = QPixmap::fromImage(img);
    }else if(id == "4")
    {
        QString oneImgPath = ip->getImgPath(4);
//        qDebug()<<"oneImagePath4: "<< oneImgPath<<endl;
        if(oneImgPath == "")
        {
            oneImgPath = "../qml/images/MainInterface/left/image.png";
        }
        QImage img = QImage(oneImgPath);
        pixmap = QPixmap::fromImage(img);
    }else if(id == "5")
    {
        QString oneImgPath = ip->getImgPath(5);
//        qDebug()<<"oneImagePath5: "<< oneImgPath<<endl;
        if(oneImgPath == "")
        {
            oneImgPath = "../qml/images/MainInterface/left/image.png";
        }
        QImage img = QImage(oneImgPath);
        pixmap = QPixmap::fromImage(img);
    }else if(id == "6")
    {
        QString oneImgPath = ip->getImgPath(6);
//        qDebug()<<"oneImagePath6: "<< oneImgPath<<endl;
        if(oneImgPath == "")
        {
            oneImgPath = "../qml/images/MainInterface/left/image.png";
        }
        QImage img = QImage(oneImgPath);
        pixmap = QPixmap::fromImage(img);
    }else if(id == "7")
    {
        QString oneImgPath = ip->getImgPath(7);
//        qDebug()<<"oneImagePath7: "<< oneImgPath<<endl;
        if(oneImgPath == "")
        {
            oneImgPath = "../qml/images/MainInterface/left/image.png";
        }
        QImage img = QImage(oneImgPath);
        pixmap = QPixmap::fromImage(img);
    }else if(id == "8")
    {
        QString oneImgPath = ip->getImgPath(8);
//        qDebug()<<"oneImagePath8: "<< oneImgPath<<endl;
        if(oneImgPath == "")
        {
            oneImgPath = "../qml/images/MainInterface/left/image.png";
        }
        QImage img = QImage(oneImgPath);
        pixmap = QPixmap::fromImage(img);
    }


    return pixmap;
}
