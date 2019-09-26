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
        QString oneImgPath = ip->getImgPath(ith);
        QImage img2 = QImage(oneImgPath);
        pixmap = QPixmap::fromImage(img2);

    }

    return pixmap;
}
