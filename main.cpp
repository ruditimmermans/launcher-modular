#include <QGuiApplication>
#include <QCoreApplication>
#include <QUrl>
#include <QString>
#include <QQuickView>
#include <QQmlEngine>

int main(int argc, char *argv[])
{
    QGuiApplication *app = new QGuiApplication(argc, (char**)argv);
    app->setApplicationName("launchermodular.ubuntouchfr");
    QQmlEngine *engine = new QQmlEngine(app);

    engine->addImportPath(QStringLiteral("/usr/lib/"__ARCH_TRIPLET__"/lomiri/qml/"));

    // This is needed because it won't be automatically set when running as a dash replacement
    engine->addImportPath(QStringLiteral("%1/lib/"__ARCH_TRIPLET__"/").arg(app->applicationDirPath()));

    QQuickView *view = new QQuickView(engine, nullptr);

    view->setSource(QStringLiteral("%1/qml/Main.qml").arg(app->applicationDirPath()));
    view->setResizeMode(QQuickView::SizeRootObjectToView);
    view->show();

    return app->exec();
}
