#ifndef IMAGEPROCESS_H
#define IMAGEPROCESS_H


#include <QObject>
#include <QFileDialog>
#include <QDebug>
#include <QtQuick>

#include <QApplication>

class ImageProcess: public QQuickItem
{
    Q_OBJECT
public:
    ImageProcess();
    ~ImageProcess();

public:
//    QWidget *widget;
    QImage imageRes;

public:

    Q_INVOKABLE QImage openImage();
    Q_INVOKABLE QImage processImage();
    Q_INVOKABLE int getGlobalWidth();
    Q_INVOKABLE int getGlobalHeight();

signals:


};


#endif // IMAGEPROCESS_H
