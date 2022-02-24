#include <QtQml>
#include <QtQml/QQmlContext>

#include "plugin.h"
#include "terminalaccess.h"

void TerminalaccessPlugin::registerTypes(const char *uri) {
    //@uri Terminalaccess
    qmlRegisterSingletonType<Terminalaccess>(uri, 1, 0, "Terminalaccess", [](QQmlEngine*, QJSEngine*) -> QObject* { return new Terminalaccess; });
}
