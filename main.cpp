#include <QtGui/QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "qml/qml_test/qml_cpp_interface.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:///qml/qml_test/main.qml")));
    engine.rootContext()->setContextProperty("mathengine", new QML_CPP_INTERFACE());

    return app.exec();
}
