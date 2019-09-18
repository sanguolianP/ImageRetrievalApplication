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
    fnmapIndex  =0;
}

ImageProcess::~ImageProcess()
{

}

//打开图像
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
//
QImage ImageProcess::processImage()
{

//    qDebug()<<"imageResimageResimageResimageRes+++++++++++++++"<<imageRes;
//    qDebug("processed");
    return imageRes;
}
//获取全局图像的宽和高
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

//QImage转 Mat格式
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
//Mat转 QImage格式
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


/***颜色直方图********************************************颜色***/
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
        qDebug()<<"R"<< outputRGB[2].at<float>(i);
        qDebug()<<"G"<< outputRGB[1].at<float>(i);
        qDebug()<<"B"<< outputRGB[0].at<float>(i)<<endl;
    }
    //return outputRGB[0];
}

//HSV直方图
Mat ImageProcess::HSVHist(Mat src)
{
    Mat srcHSV, HHist;
    cvtColor(src, srcHSV, COLOR_BGR2HSV);
    //h,s对应的bin的数目分别是50，60，即是把h范围是（0，255）的数分成50份分别统计每一份中的像素数。
    int h_bins=50;int s_bins=60;
    int histSize[]={h_bins,s_bins};
    float h_ranges[]={0,256};
    float s_ranges[]={0,180};
    const float* ranges[]={h_ranges,s_ranges};
    //只计算了h，s两个通道，所以channels是0和1
    int channels[]={0,1};
    calcHist(&srcHSV, 1, channels, Mat(), HHist, 2, histSize, ranges);
    normalize(HHist, HHist, 0, 1, NORM_MINMAX, -1, Mat());
    return HHist;
}

double ImageProcess::compareColorHis(Mat h1, Mat h2)//输入即为HSV直方图
{
    double h1_h2 = 0;
    /*
     * compare_method
     * 0Correlation  ~1better    √
     * 1Chi-Square   ~0better
     * 2Intersection > better
     * 3Bhattacharyya~0better    √
     */

    int compare_method=3;
    h1_h2=compareHist(h1,h2,compare_method);
    qDebug() <<endl<< "Bhattacharyya distance：" << h1_h2<<endl;
    return h1_h2;
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
        rectangle(rgbHist[0], Point(i*2+10, rgbHist[0].rows), Point((i+1)*2+10, rgbHist[0].rows-val), Scalar(255,0,0), 1, 8);

        val = saturate_cast<int>(outputRGB[1].at<float>(i));
        rectangle(rgbHist[1], Point(i*2+10, rgbHist[1].rows), Point((i+1)*2+10, rgbHist[1].rows-val), Scalar(0,255,0), 1, 8);

        val = saturate_cast<int>(outputRGB[2].at<float>(i));
        rectangle(rgbHist[2], Point(i*2+10, rgbHist[2].rows), Point((i+1)*2+10, rgbHist[2].rows-val), Scalar(0,0,255), 1, 8);
    }

    imshow("R", rgbHist[2]);
    imshow("G", rgbHist[1]);
    imshow("B", rgbHist[0]);
}


/***灰度共生矩阵*******************************************纹理***/
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

//得到水平的共生矩阵
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

//得到垂直的共生矩阵
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

//得到45°的共生矩阵
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

//得到135°的共生矩阵
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

//由灰度共生矩阵计算得到特征
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


/***边缘提取*******************************************形状***/
Mat ImageProcess::CannyThreshold(Mat src)
{
    int ratio = 3;
    int kernel_size = 3;
    int lowThreshold = 100;
    Mat src_gray, detected_edges;
    //int max_lowThreshold = 100;
    //dst.create( src.size(), src.type() );
    cvtColor( src, src_gray, COLOR_BGR2GRAY );
    //dst.create( src_gray.size(), src_gray.type() );
    blur( src_gray, detected_edges, Size(3,3) );
    Canny( detected_edges, detected_edges, lowThreshold, lowThreshold*ratio, kernel_size );
    //dst = Scalar::all(0);
    imshow("detect", detected_edges);
    //src.copyTo( dst, detected_edges);
    //qDebug()<<dst.channels()<<endl;
    qDebug()<<detected_edges.channels()<<endl;
    return detected_edges;
}

void ImageProcess::CannyMatch(Mat src, Mat src2)//,Mat src2
{
    //MatchShapes(detected_edges)
    double matching = matchShapes(CannyThreshold(src), CannyThreshold(src2), 1, 0);
    qDebug() << matching << endl;
}

void ImageProcess::SiftKeypoints(Mat src)
{
    // SIFT特征点检测
    int minHessian = 100;
    Ptr<SIFT> detector = SIFT::create(minHessian);//和surf的区别：只是SURF→SIFT
    vector<KeyPoint> keypoints;
    detector->detect(src, keypoints, Mat());//找出关键点
    //qDebug()<< keypoints[0].pt.x<<keypoints[0].pt.y<<keypoints[0].size<<keypoints[0].angle<<endl;
    // 绘制关键点
    Mat keypoint_img;
    drawKeypoints(src, keypoints, keypoint_img, Scalar::all(-1), DrawMatchesFlags::DEFAULT);
    imshow("KeyPoints Image", keypoint_img);
}

void ImageProcess::BFKeypointsCalc(Mat src, Mat src2, bool RANSAC)//RANSAC是否用ransac筛选
{
    int minHessian = 150;    //the number of keypoints
    Ptr<SIFT> detector = SIFT::create(minHessian);
    //CV_WRAP KeyPoint() : pt(0,0), size(0), angle(-1), response(0), octave(0), class_id(-1) {}
    vector<KeyPoint> keypoints1, keypoints2;
    Mat descriptors1,descriptors2;
    //size of descpritor (描述点数，128)
    detector->detectAndCompute(src, Mat(), keypoints1, descriptors1);
    detector->detectAndCompute(src2, Mat(), keypoints2, descriptors2);

    qDebug() << "# keypoints of img1 :" << keypoints1.size() << endl;
    qDebug() << "# keypoints of img2 :" << keypoints2.size() << endl;

    BFMatcher bfmatcher(NORM_L2, true);
    vector<DMatch> matches;
    bfmatcher.match(descriptors1, descriptors2, matches);

    qDebug() << "# matches : " << matches.size() << endl;

    //show it on an image
    Mat output;
    drawMatches(src, keypoints1, src2, keypoints2, matches, output);
    imshow("matches result",output);

    //计算匹配结果中距离最大和距离最小值
    float min_dist = matches[0].distance, max_dist = matches[0].distance;

    for (int m = 0; m < matches.size(); m++)
    {
        if (matches[m].distance<min_dist)
        {
            min_dist = matches[m].distance;
        }
        if (matches[m].distance>max_dist)
        {
            max_dist = matches[m].distance;
        }
    }
    cout << "min dist=" << min_dist << endl;
    cout << "max dist=" << max_dist << endl;

    if(RANSAC == 1)
    {
        //筛选出较好的匹配点
        vector<DMatch> goodMatches;
        for (int m = 0; m < matches.size(); m++)
        {
            if (matches[m].distance < 0.6*max_dist)
            {
                goodMatches.push_back(matches[m]);
            }
        }
        cout << "The number of good matches:" <<goodMatches.size()<< endl;
        //画出匹配结果
        Mat img_out;
        //红色连接的是匹配的特征点数，绿色连接的是未匹配的特征点数
        //matchColor – Color of matches (lines and connected keypoints). If matchColor==Scalar::all(-1) , the color is generated randomly.
        //singlePointColor – Color of single keypoints(circles), which means that keypoints do not have the matches.If singlePointColor == Scalar::all(-1), the color is generated randomly.
        //CV_RGB(0, 255, 0)存储顺序为R-G-B,表示绿色
        drawMatches(src, keypoints1, src2, keypoints2, goodMatches, img_out); //Scalar::all(-1), CV_RGB(0, 0, 255), Mat(), 2);
        imshow("good Matches",img_out);

        //RANSAC匹配过程
        vector<DMatch> m_Matches;
        m_Matches = goodMatches;
        int ptCount = goodMatches.size();
        if (ptCount < 10)
        {
            cout << "Don't find enough match points" << endl;
          //  return 0;
        }

        //坐标转换为float类型
        vector <KeyPoint> RAN_KP1, RAN_KP2;
        //size_t是标准C库中定义的，应为unsigned int，在64位系统中为long unsigned int,在C++中为了适应不同的平台，增加可移植性。
        for (size_t i = 0; i < m_Matches.size(); i++)
        {
            RAN_KP1.push_back(keypoints1[goodMatches[i].queryIdx]);
            RAN_KP2.push_back(keypoints2[goodMatches[i].trainIdx]);
            //RAN_KP1是要存储img01中能与img02匹配的点
            //goodMatches存储了这些匹配点对的img01和img02的索引值
        }
        //坐标变换
        vector <Point2f> p01, p02;
        for (size_t i = 0; i < m_Matches.size(); i++)
        {
            p01.push_back(RAN_KP1[i].pt);
            p02.push_back(RAN_KP2[i].pt);
        }
        /*vector <Point2f> img1_corners(4);
            img1_corners[0] = Point(0,0);
            img1_corners[1] = Point(img_1.cols,0);
            img1_corners[2] = Point(img_1.cols, img_1.rows);
            img1_corners[3] = Point(0, img_1.rows);
            vector <Point2f> img2_corners(4);*/
        //求转换矩阵
        //Mat m_homography;
        //vector<uchar> m;
        //m_homography = findHomography(p01, p02, RANSAC);//寻找匹配图像
        //求基础矩阵 Fundamental,3*3的基础矩阵
        vector<uchar> RansacStatus;
        Mat Fundamental = findFundamentalMat(p01, p02, RansacStatus, FM_RANSAC);
        //重新定义关键点RR_KP和RR_matches来存储新的关键点和基础矩阵，通过RansacStatus来删除误匹配点
        vector <KeyPoint> RR_KP1, RR_KP2;
        vector <DMatch> RR_matches;
        int index = 0;
        for (size_t i = 0; i < m_Matches.size(); i++)
        {
            if (RansacStatus[i] != 0)
            {
                RR_KP1.push_back(RAN_KP1[i]);
                RR_KP2.push_back(RAN_KP2[i]);
                m_Matches[i].queryIdx = index;
                m_Matches[i].trainIdx = index;
                RR_matches.push_back(m_Matches[i]);
                index++;
            }
        }
        cout << "RANSAC: " <<RR_matches.size()<< endl;
        Mat img_RR_matches;
        drawMatches(src, RR_KP1, src2, RR_KP2, RR_matches, img_RR_matches);
        imshow("After RANSAC",img_RR_matches);
    }
    else {
        qDebug() << "NO RANSAC" <<endl;
    }
}


/***FeatureStore部分****************************************/
void ImageProcess::searchFolder(QString path)
{
    QDir dir(path);

//    dir.setNameFilters(ImageFilterList);
    qDebug()<<dir<<endl;
    foreach(QFileInfo mfile, dir.entryInfoList())
    {
        if(mfile.isFile())
        {
            QString filter = mfile.suffix();
            if(filter!="jpg" && filter!="png" && filter!="bmp")
            {
                qDebug("NOT PIC");
                continue;
            }
            qDebug()<<" File: "<< mfile.fileName();
            filenameMap.insert(fnmapIndex, mfile.fileName());
            fnmapIndex++;
        }else
        {
            if(mfile.fileName()=="." || mfile.fileName()=="..")
                continue;
            qDebug()<<"Entry Dir: "<< mfile.absoluteFilePath();
            searchFolder(mfile.absoluteFilePath());
        }
    }
}

void ImageProcess::featureExtraction(QString path)
{
    QMapIterator<int, QString> i(filenameMap);
    while(i.hasNext())
    {
        qDebug()<<i.next().key()<<": "<<i.value()<<endl
                  ;
        QString fullpathName = path + "/" + i.value();
        QImage temp = QImage(fullpathName);
        Mat img = qImage2cvMat(temp);
        Mat hhh = HSVHist(img);

        QString csvName = fullpathName+".csv";
        matToCSV(csvName, hhh);

        qDebug()<<endl<<hhh.rows<<" "<<hhh.cols<<endl;
        cout<<hhh<<endl;
    }
}

void ImageProcess::matToCSV(QString filename, Mat fm)
{
    ofstream myfile;
    myfile.open(filename.toStdString());
    myfile<< cv::format(fm, Formatter::FMT_CSV) << endl;
    myfile.close();
}

Mat ImageProcess::CSVToMat(QString csvfilename)
{
    Ptr<ml::TrainData> train_data;
    train_data = ml::TrainData::loadFromCSV(csvfilename.toStdString(), 1);
    Mat m = train_data->getTrainSamples();
    cout<<endl<<"m"<<m;
//    cvtColor(m,m, COLOR_HSV2RGB_FULL);
//    normalize(m, m, COLOR_RGB2HSV);
//    imshow("CSV2NAT", m);
    return m;
}

/***CalcDistance部分****************************************/


















