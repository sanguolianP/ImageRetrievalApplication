#include "myimageprovider.h"

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


    if(id == "hello")
    {
        QImage img;
//                    img = QImage("images1/WindowBG.png");

        if(imageGlobal.isNull())
        {
            img = QImage("E:/proj/Github/ImageRetrievalApplication/ImageRetrieval/qml/images/MainInterface/left/image.png");
        }else {
            img = imageGlobal;
        }
//            qDebug()<<imgPro.processImage(imgPro.image);
        qDebug()<<"imageGlobalimageGlobalimageGlobal/////////////////////////"<< imageGlobal;
        pixmap = QPixmap::fromImage(img);
    }

    return pixmap;
}
