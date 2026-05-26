#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtPlugin>
#include <QUrl>

Q_IMPORT_PLUGIN(LucideIconsPlugin)

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/qt/qml/LucideIconBrowserApp/Main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
