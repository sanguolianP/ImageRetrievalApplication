#include "imageprocess.h"
#include "externalvar.h"

ImageProcess::ImageProcess()
{
//    imageRes = QImage("C:/Users/SanguolianP/Desktop/imageTestqml4/qml/images/maininterface.jpg");
    hisSize[0] = 256;
    hisWidth = 400;
    hisHeight = 400;
    range[0] = 0.0;
    range[1] = 255.0;
    ranges = &range[0];

    grayLevel = 16;

}

ImageProcess::~ImageProcess()
{

}

QImage ImageProcess::openImage()
{
    qDebug("open");
    QString fileName = QFileDialog::getOpenFileName(
                   NULL, "open image file",
                    ".",
                    "Image files (*.bmp *.jpg *.pbm *.pgm *.png *.ppm *.xbm *.xpm);;All files (*.*)");
        if(fileName != "")
        {
            if(!QImage(fileName).isNull())
            {
                qDebug()<<fileName;
                imageRes = QImage(fileName);
                imageGlobal = imageRes;
                qDebug()<<imageRes;

                return imageRes;
            }
        }
}

QImage ImageProcess::processImage()
{

//    qDebug()<<"imageResimageResimageResimageRes+++++++++++++++"<<imageRes;
//    qDebug("processed");
    return imageRes;
}

int ImageProcess::getGlobalWidth()
{
    return imageGlobal.width();
}

int ImageProcess::getGlobalHeight()
{
    return imageGlobal.height();
}

/************************************/

void ImageProcess::openImageCV(QString imgName)
{

}

void ImageProcess::cvShow(QString title, Mat img)
{
//    imshow(title, img);
}

Mat ImageProcess::qImage2cvMat(QImage img)
{
    qDebug("qImage2cvMat");
//    img = imageGlobal;
    Mat imgMat;
    switch (img.format())
    {
    case QImage::Format_ARGB32 :
    case QImage::Format_RGB32 :
    case QImage::Format_ARGB32_Premultiplied:
        imgMat = Mat(img.height(),img.width(),CV_8UC4,(void*)img.constBits(),img.bytesPerLine());
        break;
    case QImage::Format_RGB888:
        imgMat = Mat(img.height(),img.width(),CV_8UC3,(void*)img.constBits(),img.bytesPerLine());
        cvtColor(imgMat,imgMat,COLOR_BGR2RGB);
        break;
    case QImage::Format_Indexed8:
        imgMat = Mat(img.height(),img.width(),CV_8UC1,(void*)img.constBits(),img.bytesPerLine());
        break;
    }
    qDebug("qImage2cvMat End!");
    return imgMat;
}

QImage ImageProcess::cvMat2qImage(Mat img)
{
    qDebug("cvMat2qImage");

    // 8-bits unsigned, NO. OF CHANNELS = 1
    if(img.type() == CV_8UC1)
    {
        QImage image(img.cols, img.rows, QImage::Format_Indexed8);

        // Set the color table (used to translate colour indexes to qRgb values)
        image.setColorCount(256);
        for(int i = 0; i < 256; i++)
        {
            image.setColor(i, qRgb(i, i, i));
        }
        // Copy input Mat
        uchar *pSrc = img.data;
        for(int row = 0; row < img.rows; row ++)
        {
            uchar *pDest = image.scanLine(row);
            memcpy(pDest, pSrc, img.cols);
            pSrc += img.step;
        }
        return image;
    }

    // 8-bits unsigned, NO. OF CHANNELS = 3
    else if(img.type() == CV_8UC3)
    {
        // Copy input Mat
        const uchar *pSrc = (const uchar*)img.data;
        // Create QImage with same dimensions as input Mat
        QImage image(pSrc, img.cols, img.rows, img.step, QImage::Format_RGB888);
        return image.rgbSwapped();
    }
    else if(img.type() == CV_8UC4)
    {
        qDebug() << "CV_8UC4";
        // Copy input Mat
        const uchar *pSrc = (const uchar*)img.data;
        // Create QImage with same dimensions as input Mat
        QImage image(pSrc, img.cols, img.rows, img.step, QImage::Format_ARGB32);
        return image.copy();
    }
    else
    {
        qDebug() << "ERROR: FORMAT ERROR!!! Mat could not be converted to QImage.";
        return QImage();
    }

}

/***颜色直方图***********************************************/
//分离RGB通道
void ImageProcess::splitChannels(Mat image)
{
    split(image, channelsRGB);
}

//计算直方图
void ImageProcess::getHistogram()
{
    calcHist(&channelsRGB[0], 1, 0, Mat(), outputRGB[0], 1, hisSize, &ranges);
    calcHist(&channelsRGB[1], 1, 0, Mat(), outputRGB[1], 1, hisSize, &ranges);
    calcHist(&channelsRGB[2], 1, 0, Mat(), outputRGB[2], 1, hisSize, &ranges);

    for(int i=0; i<hisSize[0]; i++)
    {
        qDebug()<< i;
        qDebug()<<"B"<< outputRGB[0].at<float>(i);
        qDebug()<<"G"<< outputRGB[1].at<float>(i);
        qDebug()<<"R"<< outputRGB[2].at<float>(i)<<endl;
    }
}

//显示直方图
void ImageProcess::displayHistogram()
{
    Mat rgbHist[3];
    for(int i=0; i<3; i++)
    {
        rgbHist[i] = Mat(hisWidth, hisHeight, CV_8UC3, Scalar::all(0));
    }
    normalize(outputRGB[0], outputRGB[0], 0, hisWidth- 20, NORM_MINMAX);
    normalize(outputRGB[1], outputRGB[1], 0, hisWidth- 20, NORM_MINMAX);
    normalize(outputRGB[2], outputRGB[2], 0, hisWidth- 20, NORM_MINMAX);
    for(int i=0; i<hisSize[0]; i++)
    {
        int val = saturate_cast<int>(outputRGB[0].at<float>(i));
        rectangle(rgbHist[0], Point(i*2+10, rgbHist[0].rows), Point((i+1)*2+10, rgbHist[0].rows-val), Scalar(0,0,255), 1, 8);

        val = saturate_cast<int>(outputRGB[1].at<float>(i));
        rectangle(rgbHist[1], Point(i*2+10, rgbHist[1].rows), Point((i+1)*2+10, rgbHist[1].rows-val), Scalar(0,255,0), 1, 8);

        val = saturate_cast<int>(outputRGB[2].at<float>(i));
        rectangle(rgbHist[2], Point(i*2+10, rgbHist[2].rows), Point((i+1)*2+10, rgbHist[2].rows-val), Scalar(255,0,0), 1, 8);
    }

    imshow("R", rgbHist[0]);
    imshow("G", rgbHist[1]);
    imshow("B", rgbHist[2]);
}

/***灰度共生矩阵**********************************************/
//初始化共生矩阵
void ImageProcess::initGLCM(VecGLCM &vecGLCM, int size)
{
    if(size==grayLevel)
    {
        vecGLCM.resize(size);
        for(int i=0; i<size; i++)
        {
            vecGLCM[i].resize(size);
        }
        for(int i=0; i<size; i++)
        {
            for(int j=0; j<size; j++)
            {
                vecGLCM[i][j] = 0;
            }
        }
    }else{qDebug("size need equre graylevel!");}
}

//得到不同角度的共生矩阵
void ImageProcess::getHorizontalGLCM(VecGLCM &src, VecGLCM &dst, int imgWidth, int imgHeight)
{
    int width = imgWidth;
    int height= imgHeight;
    for(int i=0; i<height; i++)
    {
        for(int j=0; j<width-1; j++)
        {
            int rows = src[i][j];
            int cols = src[i][j+1];
            dst[rows][cols]++;
        }
    }
    qDebug()<<dst;
}

void ImageProcess::getVerticalGLCM(VecGLCM &src, VecGLCM &dst, int imgWidth, int imgHeight)
{
    int width = imgWidth;
    int height= imgHeight;
    for(int i=0; i<height-1; i++)
    {
        for(int j=0; j<width; j++)
        {
            int rows = src[i][j];
            int cols = src[i+1][j];
            dst[rows][cols]++;
        }
    }
}

void ImageProcess::get45GLCM(VecGLCM &src, VecGLCM &dst, int imgWidth, int imgHeight)
{
    int width = imgWidth;
    int height= imgHeight;
    for(int i=0; i<height-1; i++)
    {
        for(int j=0; j<width-1; j++)
        {
            int rows = src[i][j];
            int cols = src[i+1][j+1];
            dst[rows][cols]++;
        }
    }
}

void ImageProcess::get135GLCM(VecGLCM &src, VecGLCM &dst, int imgWidth, int imgHeight)
{
    int width = imgWidth;
    int height= imgHeight;
    for(int i=0; i<height-1; i++)
    {
        for(int j=1; j<width; j++)
        {
            int rows = src[i][j];
            int cols = src[i+1][j-1];
            dst[rows][cols]++;
        }
    }
}

//计算灰度共生矩阵
void ImageProcess::calGLCM(Mat inputImage, VecGLCM &vecGLCM, int angle)
{
    if(inputImage.channels()==1)
    {
        Mat src = Mat(inputImage.rows, inputImage.cols, inputImage.channels());

        int height = src.rows;
        int width  = src.cols;
        int maxGrayLevel =  0;

        for(int i=0; i<height; i++)
        {
            for(int j=0; j<width; j++)
            {
                int grayVal = src.at<uchar>(i,j);
                if(grayVal > maxGrayLevel)
                {
                    maxGrayLevel = grayVal;
                }
            }
        }

        maxGrayLevel++;
        VecGLCM tempVec;

        tempVec.resize(height);
        for(int i=0; i<height; i++)
        {tempVec[i].resize(height);}

        if(maxGrayLevel > 16)
        {
            for(int i=0; i<height; i++)
            {
                for(int j=0; j<width; j++)
                {
                    int tempVal = src.at<uchar>(i,j);
                    tempVal /= grayLevel;
                    tempVec[i][j] = tempVal;
//                    qDebug()<<tempVec[i][j]<<" ";
                }
            }
            if(angle == GLCM_HORIZONTAL)
                getHorizontalGLCM(tempVec, vecGLCM, width, height);
            if(angle == GLCM_VERTICAL)
                getVerticalGLCM(tempVec, vecGLCM, width, height);
            if(angle == GLCM_ANGLE_45)
                get45GLCM(tempVec, vecGLCM, width, height);
            if(angle == GLCM_ANGLE_135)
                get135GLCM(tempVec, vecGLCM, width, height);

            qDebug("Maxgraylevel > 16");
        }else
        {
            for(int i=0; i<height; i++)
            {
                for(int j=0; j<width; j++)
                {
                    int tempVal = src.at<uchar>(i,j);
                    tempVec[i][j] = tempVal;
                }
            }
            if(angle == GLCM_HORIZONTAL)
                getHorizontalGLCM(tempVec, vecGLCM, width, height);
            if(angle == GLCM_VERTICAL)
                getVerticalGLCM(tempVec, vecGLCM, width, height);
            if(angle == GLCM_ANGLE_45)
                get45GLCM(tempVec, vecGLCM, width, height);
            if(angle == GLCM_ANGLE_135)
                get135GLCM(tempVec, vecGLCM, width, height);

            qDebug("Maxgraylevel < 16");
        }

    }else{qDebug("channel need be one!");}
}

//由灰度共生矩阵得到特征
void ImageProcess::getGLCMFeatures(VecGLCM &vecGLCM, GLCMFeatures &features)
{
    //求矩阵值的总和
    int total = 0;
    for(int i=0; i<grayLevel; i++)
    {
        for(int j=0; j<grayLevel; j++)
        {
            total += vecGLCM[i][j];
        }
    }

    vector<vector<double> > temp;
    temp.resize(grayLevel);
    for(int i=0; i<grayLevel; i++)
    {
        temp[i].resize(grayLevel);
    }

    //归一化
    for(int i=0; i<grayLevel; i++)
    {
        for(int j=0; j<grayLevel; j++)
        {
            temp[i][j] = (double)vecGLCM[i][j] / (double)total;
        }
    }

    for(int i=0; i<grayLevel; i++)
    {
        for(int j=0; j<grayLevel; j++)
        {
            features.energy += temp[i][j] * temp[i][j];

            if(temp[i][j]>0)
            {features.entropy -= temp[i][j] * log(temp[i][j]);}

            features.constrast += (double)(i - j)*(double)(i - j)*temp[i][j];

            features.idMoment += temp[i][j] / (1 + (double)(i - j)*(double)(i - j));
        }
    }

}






























