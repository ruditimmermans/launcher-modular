#include <QtQml>
#include <QtQml/QQmlContext>
#include "plugin.h"
#include "launcher.h"

void LauncherModularPlugin::registerTypes(const char *uri) {
    //@uri LauncherModular
    qmlRegisterSingletonType<LauncherModularPlug>(uri, 1, 0, "LauncherModularPlug", [](QQmlEngine*, QJSEngine*) -> QObject* { return new LauncherModularPlug; });
}
