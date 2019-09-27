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
//                    img = QImage("images1/WindowBG.png");

        if(imageGlobal.isNull())
        {
            img = QImage("../data/lena.jpg");
        }else {
            img = imageGlobal;
        }
//            qDebug()<<imgPro.processImage(imgPro.image);
//        qDebug()<<"imageGlobalimageGlobalimageGlobal/////////////////////////"<< imageGlobal;
        pixmap = QPixmap::fromImage(img);
    }else
    {
        int ith = id.toInt();
//        QString oneImgPath;
//        switch (ith) {
//        case 0:
//            oneImgPath = "../10/0.jpg" ;
//            break;
//        case 1:
//            oneImgPath = "../10/221118240-0045-001-01.jpg" ;
//            break;
//        case 2:
//            oneImgPath = "../10/3.jpg" ;
//            break;
//        case 3:
//            oneImgPath = "../10/221118240-0046-001-01.jpg" ;
//            break;
//        case 4:
//            oneImgPath = "../10/221118240-0067-001-02.jpg" ;
//            break;
//        case 5:
//            oneImgPath = "../10/4.jpg" ;
//            break;
//        case 6:
//            oneImgPath = "../10/221118240-0050-001-01.jpg" ;
//            break;
//        case 7:
//            oneImgPath = "../10/6.jpg" ;
//            break;
//        case 8:
//            oneImgPath = "../10/221118240-0063-002-01.jpg" ;
//            break;

//        }
        QString oneImgPath = ip->getImgPath(ith);
//        qDebug()<< oneImgPath<<endl;
//
        QImage img2 = QImage(oneImgPath);
        pixmap = QPixmap::fromImage(img2);

    }

    return pixmap;
}
