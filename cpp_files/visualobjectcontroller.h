#ifndef VISUALOBJECTCONTROLLER_H
#define VISUALOBJECTCONTROLLER_H

#include <QObject>

class VisualObjectController : public QObject
{
    Q_OBJECT
public:
    explicit VisualObjectController(QObject *parent = nullptr);

signals:

public slots:
};

#endif // VISUALOBJECTCONTROLLER_H