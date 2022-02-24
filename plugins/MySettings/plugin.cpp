#include <QtQml>
#include <QtQml/QQmlContext>

#include "plugin.h"
#include "mysettings.h"

void MySettingsPlugin::registerTypes(const char *uri) {
    //@uri MySettings
    qmlRegisterSingletonType<MySettings>(uri, 1, 0, "MySettings", [](QQmlEngine*, QJSEngine*) -> QObject* { return new MySettings; });
}

