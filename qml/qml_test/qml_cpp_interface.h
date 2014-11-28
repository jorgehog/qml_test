#ifndef QML_CPP_INTERFACE_H
#define QML_CPP_INTERFACE_H

#include <QObject>

#include "mathops.h"

class QML_CPP_INTERFACE : public QObject
{
    Q_OBJECT

public:

    QML_CPP_INTERFACE(QObject *parent = NULL) : QObject(parent)
    {
        m_mathengine = new MathOps();
    }

    virtual ~QML_CPP_INTERFACE()
    {
        delete m_mathengine;
    }

    Q_INVOKABLE double add(double a, double b)
    {
        return m_mathengine->add(a, b);
    }

    Q_INVOKABLE double multiply(double a, double b)
    {
        return a*b;
    }

private:

    MathOps *m_mathengine;
};

#endif // QML_CPP_INTERFACE_H
