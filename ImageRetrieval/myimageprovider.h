#ifndef MYIMAGEPROVIDER_H
#define MYIMAGEPROVIDER_H

#include <qquickimageprovider.h>
#include <QImage>
#include <QDebug>
#include "externalvar.h"

class MyImageProvider: public QQuickImageProvider
{
public:
    MyImageProvider();

public:
    QPixmap requestPixmap(const QString &id, QSize *size, const QSize &requestedSize) override;

};

#endif // MYIMAGEPROVIDER_H
