#ifndef APPHANDLERPLUGIN_H
#define APPHANDLERPLUGIN_H

#include <QQmlExtensionPlugin>

class AppHandlerPlugin : public QQmlExtensionPlugin {
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")

public:
    void registerTypes(const char *uri);
};

#endif
