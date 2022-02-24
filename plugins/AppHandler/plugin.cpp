#include <QtQml>
#include <QtQml/QQmlContext>

#include "plugin.h"
#include "apphandler.h"
#include "appinfo.h"

void AppHandlerPlugin::registerTypes(const char *uri) {
    //@uri AppHandler
    qmlRegisterSingletonType<AppHandler>(uri, 1, 0, "AppHandler", [](QQmlEngine*, QJSEngine*) -> QObject* { return new AppHandler; });
    qmlRegisterType<AppInfo>(uri, 1, 0, "AppInfo");
}

