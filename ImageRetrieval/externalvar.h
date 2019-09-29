#ifndef EXTERNALVAR_H
#define EXTERNALVAR_H

#include <QImage>
#include <QMap>
#include "imageprocess.h"

extern QImage imageGlobal;

extern QMap<double, QString> rankResGlobal;

extern FILEMAP fmGlobal;
extern QMap<int, FILEMAP> fileMapGlobal;
extern int fnmapIndexGlobal;

extern QString currentPath;

#endif // EXTERNALVAR_H
